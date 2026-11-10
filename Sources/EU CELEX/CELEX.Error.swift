extension CELEX {

    public enum Error: Swift::Error, Sendable, Equatable {

        case empty

        case sector(String)

        case year(String)

        case officialJournalC(String)

        case consolidation(String)

        case transposition(String)

        case corrigendum(String, sector: CELEX.Sector)

        case descriptor(String, sector: CELEX.Sector)

        case number(String)
    }
}
