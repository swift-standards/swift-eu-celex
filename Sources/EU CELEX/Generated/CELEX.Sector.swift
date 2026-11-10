extension CELEX {

    public enum Sector: Sendable, Hashable, CaseIterable {

        case consolidatedTexts

        case treaties

        case internationalAgreements

        case legislation

        case complementaryLegislation

        case preparatoryDocuments

        case caseLaw

        case nationalTranspositionMeasures

        case nationalCaseLaw

        case parliamentaryQuestions

        case officialJournalC

        case efta
    }
}

extension CELEX.Sector {

    public var code: String {
        switch self {
        case .consolidatedTexts: "0"
        case .treaties: "1"
        case .internationalAgreements: "2"
        case .legislation: "3"
        case .complementaryLegislation: "4"
        case .preparatoryDocuments: "5"
        case .caseLaw: "6"
        case .nationalTranspositionMeasures: "7"
        case .nationalCaseLaw: "8"
        case .parliamentaryQuestions: "9"
        case .officialJournalC: "C"
        case .efta: "E"
        }
    }

    public init?(code: some StringProtocol) {
        switch String(code) {
        case "0": self = .consolidatedTexts
        case "1": self = .treaties
        case "2": self = .internationalAgreements
        case "3": self = .legislation
        case "4": self = .complementaryLegislation
        case "5": self = .preparatoryDocuments
        case "6": self = .caseLaw
        case "7": self = .nationalTranspositionMeasures
        case "8": self = .nationalCaseLaw
        case "9": self = .parliamentaryQuestions
        case "C": self = .officialJournalC
        case "E": self = .efta
        default: return nil
        }
    }
}
