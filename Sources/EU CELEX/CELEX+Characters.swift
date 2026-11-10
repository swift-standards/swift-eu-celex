extension CELEX {

    internal static func isDigit(_ byte: UInt8) -> Bool {
        (UInt8(ascii: "0")...UInt8(ascii: "9")).contains(byte)
    }

    internal static func isUppercaseLetter(_ byte: UInt8) -> Bool {
        (UInt8(ascii: "A")...UInt8(ascii: "Z")).contains(byte)
    }

    internal static func isNumberCharacter(_ byte: UInt8) -> Bool {
        isDigit(byte) || isUppercaseLetter(byte) || byte == UInt8(ascii: "/") || byte == UInt8(ascii: "(")
            || byte == UInt8(ascii: ")") || byte == UInt8(ascii: ".")
    }

    internal static func isDigits(_ text: Substring, count: Int) -> Bool {
        text.utf8.count == count && text.utf8.allSatisfy(isDigit)
    }

    internal static func digits(_ value: Int, count: Int) -> String {
        let text = String(value)
        return String(repeating: "0", count: max(0, count - text.count)) + text
    }
}
