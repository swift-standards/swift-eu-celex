import EU_CELEX
import ISO_3166
import ISO_8601
import Testing

enum `CELEX Tests` {}

extension `CELEX Tests` {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension `CELEX Tests`.Test.Unit {

    @Test
    func `a regulation reads its sector, year, type and number`() throws {
        let act = try CELEX("32004R0261")
        #expect(act.sector == .legislation)
        #expect(act.sector.code == "3")
        #expect(act.type == .regulation)
        #expect(act.year == 2004)
        #expect(act.number == "0261")
        #expect(act.suffix == nil)
    }

    @Test(arguments: [
        "32004R0261", "32000L0060", "32016R0679R(02)", "32013L0053R(05)", "02016R0679-20160504",
        "01999L0094-20031120", "01972B/TXT-19730101", "02016ME/TXT-20160901", "02020XG0131(01)-20200131",
        "02006XC1208(04)-20150805", "02003T0000-20040501", "12016E/TXT", "12016E000", "12012EN01",
        "11992MG/B8", "11997D001/P9", "11957A/AFI/DCL/FRAN", "12016ME/TXT", "21988D1231(11)",
        "22025D01849", "32024A07439", "32012A0424(01)", "42013A0806(01)", "52015AG0010(01)",
        "52012XG1026(01)", "52025XG02954", "52002XC0903(135)", "51992DC2198(01)S", "31962D0241P1331",
        "31962D0602P1518R(01)", "62014CJ0348", "62025CO0582(01)", "62014CC0362", "72015L2366HRV_279843",
        "72024R0886IRL_202502744", "72001F0888HRV_224197", "82016DE0607(51)", "82010BE1117(03)",
        "91980E000951", "92000O000006", "E2021A0624(01)", "E2025C03567", "C/2025/03118", "C/2024/90028", "C2005/315/24",
        "C2007/269/123", "C2006/044A/", "C2003/080A/(01)", "C2001/024/06(01)", "C2015/003A/01R(01)", "11992E",
        "12003TR(05)",
    ])
    func `published CELEX numbers print as they were read`(text: String) throws {
        #expect(try CELEX(text).description == text)
    }

    @Test
    func `a corrigendum is R and its sequence in parentheses`() throws {
        let corrigendum = try CELEX("32016R0679R(02)")
        #expect(corrigendum.suffix == .corrigendum(2))
        #expect(corrigendum.number == "0679")
        #expect(corrigendum.type == .regulation)
    }

    @Test
    func `a consolidated text is sector 0 with the date of its last amendment`() throws {
        let consolidated = try CELEX("02016R0679-20160504")
        #expect(consolidated.sector == .consolidatedTexts)
        #expect(consolidated.type == .regulation)
        #expect(consolidated.suffix == .consolidated(try ISO_8601.CalendarDate(year: 2016, month: 5, day: 4)))
    }

    @Test
    func `a consolidated text takes its type from the sector its number fits, sector 3 first`() throws {
        #expect(try CELEX("01999L0094-20031120").type == .directive)
        #expect(try CELEX("02000Y0413(01)-20100101").type == .otherOfficialJournalCDocument)
        #expect(try CELEX("02020XG0131(01)-20200131").type == .otherCouncilDocument)
        #expect(try CELEX("01972B/TXT-19730101").type == .accessionTreaty1972)
        #expect(try CELEX("02016ME/TXT-20160901").type == .consolidatedTreaties2016)
    }

    @Test
    func `a national transposition measure names the act, the country and the Commission's number`() throws {
        let measure = try CELEX("72015L2366HRV_279843")
        #expect(measure.sector == .nationalTranspositionMeasures)
        #expect(measure.type == .directive)
        #expect(measure.year == 2015)
        #expect(measure.number == "2366")
        #expect(measure.suffix == .transposition(country: .hrv, number: "279843"))
    }

    @Test
    func `the descriptor is the longest code of the sector's table`() throws {
        #expect(try CELEX("52025DMA00100").type == .digitalMarketsAct)
        #expect(try CELEX("12016ME/TXT").type == .consolidatedTreaties2016)
        #expect(try CELEX("11992MG/B8").type == .treatyOnEuropeanUnion)
        #expect(try CELEX("11992MG/B8").number == "G/B8")
        #expect(try CELEX("62014CJ0348").type == .courtOfJusticeJudgment)
        #expect(try CELEX("82016DE0607(51)").type == .germanCaseLaw)
        #expect(try CELEX("91980E000951").type == .writtenQuestion)
        #expect(try CELEX("E2021A0624(01)").type == .eftaAgreement)
    }

    @Test
    func `before October 2023 a sector C number is the OJ C issue and the item in it`() throws {
        let notice = try CELEX("C2005/315/24")
        #expect(notice.sector == .officialJournalC)
        #expect(notice.year == 2005)
        #expect(notice.number == "315/24")
        #expect(notice.type == nil)
        #expect(try CELEX("C2015/003A/01R(01)").suffix == .corrigendum(1))
    }

    @Test
    func `a treaty may be cited as a whole, with no number`() throws {
        #expect(try CELEX("11992E").type == .ecTreaty)
        #expect(try CELEX("11992E").number.isEmpty)
        #expect(try CELEX("12003TR(05)").suffix == .corrigendum(5))
    }

    @Test
    func `a sector C number is the year and the five-digit OJ C number, with no type`() throws {
        let notice = try CELEX("C/2025/03118")
        #expect(notice.sector == .officialJournalC)
        #expect(notice.year == 2025)
        #expect(notice.number == "03118")
        #expect(notice.type == nil)
    }

    @Test
    func `every descriptor belongs to one sector and has a code unique there`() {
        var seen: Set<String> = []
        for descriptor in CELEX.Descriptor.allCases {
            #expect(seen.insert(descriptor.sector.code + descriptor.code).inserted)
        }
        #expect(CELEX.Descriptor.allCases.count == 157)
        #expect(CELEX.Sector.allCases.map(\.code) == ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "C", "E"])
    }
}

extension `CELEX Tests`.Test.`Edge Case` {

    @Test
    func `an empty text, an unknown sector and a short year are refused`() {
        #expect(throws: CELEX.Error.empty) { try CELEX("") }
        #expect(throws: CELEX.Error.sector("X")) { try CELEX("X2004R0261") }
        #expect(throws: CELEX.Error.year("200R")) { try CELEX("3200R0261") }
    }

    @Test
    func `a sector C number is either form and nothing else`() {
        #expect(throws: CELEX.Error.officialJournalC("C/2025/3118")) { try CELEX("C/2025/3118") }
        #expect(throws: CELEX.Error.officialJournalC("C2009/45/04")) { try CELEX("C2009/45/04") }
        #expect(throws: CELEX.Error.officialJournalC("C2009/097A(01)")) { try CELEX("C2009/097A(01)") }
        #expect(throws: CELEX.Error.officialJournalC("C2009/097/1234")) { try CELEX("C2009/097/1234") }
        #expect(throws: CELEX.Error.officialJournalC("C2009")) { try CELEX("C2009") }
    }

    @Test
    func `a descriptor must be in its sector's table`() {
        #expect(throws: CELEX.Error.descriptor("Z0261", sector: .legislation)) { try CELEX("32004Z0261") }
        #expect(throws: CELEX.Error.descriptor("r0261", sector: .legislation)) { try CELEX("32004r0261") }
        #expect(throws: CELEX.Error.descriptor("R", sector: .legislation)) { try CELEX("32004R") }
        #expect(throws: CELEX.Error.descriptor("ZZ0607(01)", sector: .nationalCaseLaw)) { try CELEX("82016ZZ0607(01)") }
    }

    @Test
    func `a number outside the treaties is digits with an optional split and letter`() {
        #expect(throws: CELEX.Error.number("0261R(00)")) { try CELEX("32004R0261R(00)") }
        #expect(throws: CELEX.Error.number("0261/TXT")) { try CELEX("32004R0261/TXT") }
        #expect(throws: CELEX.Error.number("0607")) { try CELEX("82016DE0607") }
        #expect(throws: CELEX.Error.number("261 ")) { try CELEX("32004R261 ") }
    }

    @Test
    func `sectors 0 and 7 have no corrigenda`() {
        #expect(throws: CELEX.Error.corrigendum("02016R0679R(01)-20160504", sector: .consolidatedTexts)) {
            try CELEX("02016R0679R(01)-20160504")
        }
        #expect(throws: CELEX.Error.corrigendum("72015L2366HRV_279843R(01)", sector: .nationalTranspositionMeasures)) {
            try CELEX("72015L2366HRV_279843R(01)")
        }
    }

    @Test
    func `a consolidated text needs a real date`() {
        #expect(throws: CELEX.Error.consolidation("02016R0679")) { try CELEX("02016R0679") }
        #expect(throws: CELEX.Error.consolidation("02016R0679-20160231")) { try CELEX("02016R0679-20160231") }
    }

    @Test
    func `a transposition measure needs an ISO 3166 alpha-3 country and a number`() {
        #expect(throws: CELEX.Error.transposition("72015L2366XYZ_279843")) { try CELEX("72015L2366XYZ_279843") }
        #expect(throws: CELEX.Error.transposition("72015L2366HRV_")) { try CELEX("72015L2366HRV_") }
        #expect(throws: CELEX.Error.transposition("72015L2366HRV")) { try CELEX("72015L2366HRV") }
        #expect(throws: CELEX.Error.descriptor("Z2366", sector: .nationalTranspositionMeasures)) {
            try CELEX("72015Z2366HRV_279843")
        }
    }

    @Test
    func `EUR-Lex's summary and information numbers are not in the guide and are refused`() {
        #expect(throws: CELEX.Error.number("0345_SUM")) { try CELEX("62024CJ0345_SUM") }
    }
}
