public import ISO_3166
public import ISO_8601

extension CELEX {

    public enum Suffix: Sendable, Hashable {

        case corrigendum(Int)

        case consolidated(ISO_8601.CalendarDate)

        case transposition(country: ISO_3166.Alpha3, number: String)
    }
}

extension CELEX.Suffix {

    public var text: String {
        switch self {
        case .corrigendum(let sequence):
            "R(" + CELEX.digits(sequence, count: 2) + ")"

        case .consolidated(let date):
            "-" + date.basic

        case .transposition(let country, let number):
            country.value.uppercased() + "_" + number
        }
    }
}
