extension CELEX.Descriptor {

    internal static let bySector: [CELEX.Sector: [String: CELEX.Descriptor]] = {
        var table: [CELEX.Sector: [String: CELEX.Descriptor]] = [:]
        for descriptor in allCases {
            table[descriptor.sector, default: [:]][descriptor.code] = descriptor
        }
        return table
    }()

    internal static func sectors(describing sector: CELEX.Sector) -> [CELEX.Sector] {
        switch sector {
        case .consolidatedTexts:
            [.legislation, .preparatoryDocuments, .internationalAgreements, .complementaryLegislation, .caseLaw, .treaties]

        case .nationalTranspositionMeasures:
            [.legislation]

        default:
            [sector]
        }
    }

    internal static func split(
        _ body: Substring,
        in sector: CELEX.Sector
    ) -> (descriptor: CELEX.Descriptor, number: Substring)? {
        for candidate in sectors(describing: sector) {
            let table = bySector[candidate] ?? [:]
            for length in [3, 2, 1] where body.utf8.count > length || (candidate == .treaties && body.utf8.count == length) {
                let code = body.prefix(length)
                guard code.utf8.allSatisfy(CELEX.isUppercaseLetter), let descriptor = table[String(code)] else {
                    continue
                }
                let number = body.dropFirst(length)
                if candidate == .treaties || number.utf8.first.map(CELEX.isDigit) == true {
                    return (descriptor, number)
                }
            }
        }
        return nil
    }
}
