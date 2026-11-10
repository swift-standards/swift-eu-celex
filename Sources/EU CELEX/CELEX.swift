public struct CELEX: Sendable, Hashable {

    public let sector: CELEX.Sector

    public let year: Int

    public let type: CELEX.Descriptor?

    public let number: String

    public let suffix: CELEX.Suffix?
}
