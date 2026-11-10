import ISO_3166
import ISO_8601

extension CELEX {

    public init(_ text: some StringProtocol) throws(CELEX.Error) {
        let string = Substring(String(text))
        guard let first = string.first else {
            throw .empty
        }
        if first == "C" {
            self = try string.hasPrefix("C/") ? Self.officialJournalC(string) : Self.officialJournalCIssue(string)
            return
        }
        guard let sector = CELEX.Sector(code: String(first)) else {
            throw .sector(String(first))
        }
        let yearText = string.dropFirst().prefix(4)
        guard CELEX.isDigits(yearText, count: 4), let year = Int(yearText) else {
            throw .year(String(yearText))
        }
        var body = string.dropFirst(5)
        let suffix = try Self.suffix(of: &body, in: sector, text: string)
        guard let (descriptor, number) = CELEX.Descriptor.split(body, in: sector) else {
            throw .descriptor(String(body), sector: sector)
        }
        guard Self.isValid(number: number, in: sector == .nationalTranspositionMeasures ? sector : descriptor.sector) else {
            throw .number(String(number))
        }
        self.init(sector: sector, year: year, type: descriptor, number: String(number), suffix: suffix)
    }

    private static func officialJournalC(_ string: Substring) throws(CELEX.Error) -> CELEX {
        let parts = string.split(separator: "/", omittingEmptySubsequences: false)
        guard parts.count == 3, CELEX.isDigits(parts[1], count: 4), CELEX.isDigits(parts[2], count: 5),
            let year = Int(parts[1])
        else {
            throw .officialJournalC(String(string))
        }
        return CELEX(sector: .officialJournalC, year: year, type: nil, number: String(parts[2]), suffix: nil)
    }

    private static func officialJournalCIssue(_ string: Substring) throws(CELEX.Error) -> CELEX {
        let yearText = string.dropFirst().prefix(4)
        var rest = string.dropFirst(5)
        guard CELEX.isDigits(yearText, count: 4), let year = Int(yearText), rest.first == "/" else {
            throw .officialJournalC(String(string))
        }
        rest = rest.dropFirst()
        let corrigendum = Self.corrigendum(of: rest)
        if corrigendum != nil {
            rest = rest.dropLast(5)
        }
        let parts = rest.split(separator: "/", omittingEmptySubsequences: false)
        guard parts.count == 2, Self.isIssue(parts[0]), Self.isIssueItem(parts[1]) else {
            throw .officialJournalC(String(string))
        }
        return CELEX(
            sector: .officialJournalC,
            year: year,
            type: nil,
            number: String(rest),
            suffix: corrigendum.map(CELEX.Suffix.corrigendum)
        )
    }

    private static func isIssue(_ text: Substring) -> Bool {
        let bytes = Array(text.utf8)
        return (bytes.count == 3 || bytes.count == 4) && bytes[0..<3].allSatisfy(CELEX.isDigit)
            && (bytes.count == 3 || CELEX.isUppercaseLetter(bytes[3]))
    }

    private static func isIssueItem(_ text: Substring) -> Bool {
        let bytes = Array(text.utf8)
        var index = 0
        while index < bytes.count, CELEX.isDigit(bytes[index]) { index += 1 }
        guard index <= 3 else { return false }
        if index == bytes.count { return true }
        return bytes.count == index + 4 && bytes[index] == UInt8(ascii: "(")
            && bytes[(index + 1)..<(index + 3)].allSatisfy(CELEX.isDigit) && bytes[index + 3] == UInt8(ascii: ")")
    }

    private static func suffix(
        of body: inout Substring,
        in sector: CELEX.Sector,
        text: Substring
    ) throws(CELEX.Error) -> CELEX.Suffix? {
        let corrigendum = Self.corrigendum(of: body)
        switch sector {
        case .consolidatedTexts:
            let parts = body.split(separator: "-", omittingEmptySubsequences: false)
            guard parts.count == 2, let date = ISO_8601.CalendarDate(basic: parts[1]) else {
                throw .consolidation(String(text))
            }
            guard Self.corrigendum(of: parts[0]) == nil else {
                throw .corrigendum(String(text), sector: sector)
            }
            body = parts[0]
            return .consolidated(date)

        case .nationalTranspositionMeasures:
            guard corrigendum == nil else {
                throw .corrigendum(String(text), sector: sector)
            }
            let parts = body.split(separator: "_", omittingEmptySubsequences: false)
            guard parts.count == 2, parts[0].utf8.count > 3, !parts[1].isEmpty, parts[1].utf8.allSatisfy(CELEX.isDigit)
            else {
                throw .transposition(String(text))
            }
            let countryCode = parts[0].suffix(3)
            guard countryCode.utf8.allSatisfy(CELEX.isUppercaseLetter) else {
                throw .transposition(String(text))
            }
            let country: ISO_3166.Alpha3
            do throws(ISO_3166.Alpha3.Error) {
                country = try ISO_3166.Alpha3(countryCode)
            } catch {
                throw .transposition(String(text))
            }
            body = parts[0].dropLast(3)
            return .transposition(country: country, number: String(parts[1]))

        default:
            guard let corrigendum else {
                return nil
            }
            body = body.dropLast(5)
            return .corrigendum(corrigendum)
        }
    }

    private static func corrigendum(of body: Substring) -> Int? {
        let tail = body.suffix(5)
        guard tail.utf8.count == 5, tail.hasPrefix("R("), tail.hasSuffix(")") else {
            return nil
        }
        let digits = tail.dropFirst(2).dropLast()
        guard CELEX.isDigits(digits, count: 2), let sequence = Int(digits), sequence > 0 else {
            return nil
        }
        return sequence
    }

    private static func isValid(number: Substring, in sector: CELEX.Sector) -> Bool {
        let bytes = Array(number.utf8)
        switch sector {
        case .treaties:
            return bytes.allSatisfy(CELEX.isNumberCharacter)

        case .nationalTranspositionMeasures:
            return bytes.count == 4 && bytes.allSatisfy(CELEX.isDigit)

        case .nationalCaseLaw:
            return bytes.count == 8 && bytes[0..<4].allSatisfy(CELEX.isDigit) && bytes[4] == UInt8(ascii: "(")
                && bytes[5..<7].allSatisfy(CELEX.isDigit) && bytes[7] == UInt8(ascii: ")")

        default:
            var index = bytes.startIndex
            while index < bytes.endIndex, CELEX.isDigit(bytes[index]) { index += 1 }
            guard index > bytes.startIndex else { return false }
            if index < bytes.endIndex, bytes[index] == UInt8(ascii: "(") {
                let start = index + 1
                var end = start
                while end < bytes.endIndex, CELEX.isDigit(bytes[end]) { end += 1 }
                guard (2...3).contains(end - start), end < bytes.endIndex, bytes[end] == UInt8(ascii: ")") else {
                    return false
                }
                index = end + 1
            }
            if index < bytes.endIndex, CELEX.isUppercaseLetter(bytes[index]) {
                index += 1
                while index < bytes.endIndex, CELEX.isDigit(bytes[index]) { index += 1 }
            }
            return index == bytes.endIndex
        }
    }
}

extension CELEX: CustomStringConvertible {

    public var description: String {
        guard let type else {
            let year = CELEX.digits(year, count: 4)
            return number.contains("/") ? "C" + year + "/" + number + (suffix?.text ?? "") : "C/" + year + "/" + number
        }
        return sector.code + CELEX.digits(year, count: 4) + type.code + number + (suffix?.text ?? "")
    }
}
