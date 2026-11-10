extension CELEX {

    public enum Descriptor: Sendable, Hashable, CaseIterable {

        case ecscTreaty

        case euratomTreaty

        case ecTreaty

        case mergerTreaty

        case accessionTreaty1972

        case financialProvisionsTreaty1975

        case accessionTreaty1979

        case accessionTreaty1985

        case greenlandTreaty

        case singleEuropeanAct

        case treatyOnEuropeanUnion

        case accessionTreaty1994

        case treatyOfAmsterdam

        case treatyOfNice

        case accessionTreaty2003

        case constitutionalTreaty

        case accessionTreaty2005

        case treatyOfLisbon

        case charterOfFundamentalRights

        case accessionTreaty2012

        case withdrawalAgreement

        case investmentBankStatuteTreaty1975

        case consolidatedTreaties2016

        case internationalAgreement

        case actOfAgreementBody

        case actOfAgreementParliamentaryBody

        case otherInternationalAct

        case opinion

        case budget

        case declaration

        case decision

        case commonForeignAndSecurityPolicy

        case policeAndJudicialCooperation

        case resolution

        case recommendation

        case jointVentureNonOpposition

        case ecscRecommendation

        case directive

        case concentrationNonOpposition

        case ecbGuideline

        case institutionalArrangement

        case regulation

        case ecscDecision

        case otherOfficialJournalLDocument

        case otherOfficialJournalCDocument

        case agreementBetweenMemberStates

        case decisionOfMemberStateRepresentatives

        case otherComplementaryOfficialJournalLAct

        case otherComplementaryOfficialJournalCAct

        case complementaryLegislation

        case councilPosition

        case councilAssent

        case memberStateInitiative

        case otherCouncilDocument

        case commissionProposal

        case commissionDocument

        case jointDocument

        case staffWorkingDocument

        case codifiedRegulationProposal

        case codifiedDirectiveProposal

        case codifiedDecisionProposal

        case mergerControl

        case antitrust

        case stateAid

        case digitalMarketsAct

        case digitalServicesAct

        case otherCommissionDocument

        case legislativeResolution

        case parliamentBudget

        case parliamentResolution

        case parliamentInternalDecision

        case otherParliamentDocument

        case auditorsOpinion

        case auditorsReport

        case auditorsSpecialReport

        case otherAuditorsDocument

        case centralBankOpinion

        case centralBankRecommendation

        case otherCentralBankDocument

        case economicAndSocialCommitteeConsultationOpinion

        case economicAndSocialCommitteeOwnInitiativeOpinion

        case economicAndSocialCommitteeOpinion

        case otherEconomicAndSocialCommitteeDocument

        case regionsConsultationOpinion

        case regionsOwnInitiativeOpinion

        case otherRegionsDocument

        case ecscCommitteeOpinion

        case otherEcscCommitteeDocument

        case otherPreparatoryDocument

        case courtOfJusticeJudgment

        case courtOfJusticeOrder

        case advocateGeneralOpinion

        case courtOfJusticeSeizure

        case courtOfJusticeThirdPartyProceeding

        case courtOfJusticeOpinion

        case courtOfJusticeRuling

        case courtOfJusticeDecision

        case courtOfJusticeView

        case courtOfJusticeNewCase

        case courtOfJusticeJudgmentCommunication

        case courtOfJusticeOrderCommunication

        case courtOfJusticeOpinionRequest

        case courtOfJusticeOpinionCommunication

        case generalCourtJudgment

        case generalCourtOrder

        case generalCourtAdvocateGeneralOpinion

        case generalCourtThirdPartyProceeding

        case generalCourtNewCase

        case generalCourtJudgmentCommunication

        case generalCourtOrderCommunication

        case civilServiceTribunalJudgment

        case civilServiceTribunalOrder

        case civilServiceTribunalThirdPartyProceeding

        case civilServiceTribunalNewCase

        case civilServiceTribunalJudgmentCommunication

        case civilServiceTribunalOrderCommunication

        case belgianCaseLaw

        case bulgarianCaseLaw

        case czechCaseLaw

        case danishCaseLaw

        case germanCaseLaw

        case estonianCaseLaw

        case irishCaseLaw

        case greekCaseLaw

        case spanishCaseLaw

        case frenchCaseLaw

        case croatianCaseLaw

        case italianCaseLaw

        case cypriotCaseLaw

        case latvianCaseLaw

        case lithuanianCaseLaw

        case luxembourgCaseLaw

        case hungarianCaseLaw

        case malteseCaseLaw

        case dutchCaseLaw

        case austrianCaseLaw

        case polishCaseLaw

        case portugueseCaseLaw

        case romanianCaseLaw

        case slovenianCaseLaw

        case slovakCaseLaw

        case finnishCaseLaw

        case swedishCaseLaw

        case britishCaseLaw

        case swissCaseLaw

        case icelandicCaseLaw

        case norwegianCaseLaw

        case otherCaseLaw

        case writtenQuestion

        case questionTimeQuestion

        case oralQuestion

        case eftaAgreement

        case eftaSurveillanceAuthorityAct

        case eftaStandingCommitteeAct

        case eftaCourtDecision

        case eftaCourtPendingCase

        case eftaInformation
    }
}

extension CELEX.Descriptor {

    public var sector: CELEX.Sector {
        switch self {
        case .ecscTreaty: .treaties
        case .euratomTreaty: .treaties
        case .ecTreaty: .treaties
        case .mergerTreaty: .treaties
        case .accessionTreaty1972: .treaties
        case .financialProvisionsTreaty1975: .treaties
        case .accessionTreaty1979: .treaties
        case .accessionTreaty1985: .treaties
        case .greenlandTreaty: .treaties
        case .singleEuropeanAct: .treaties
        case .treatyOnEuropeanUnion: .treaties
        case .accessionTreaty1994: .treaties
        case .treatyOfAmsterdam: .treaties
        case .treatyOfNice: .treaties
        case .accessionTreaty2003: .treaties
        case .constitutionalTreaty: .treaties
        case .accessionTreaty2005: .treaties
        case .treatyOfLisbon: .treaties
        case .charterOfFundamentalRights: .treaties
        case .accessionTreaty2012: .treaties
        case .withdrawalAgreement: .treaties
        case .investmentBankStatuteTreaty1975: .treaties
        case .consolidatedTreaties2016: .treaties
        case .internationalAgreement: .internationalAgreements
        case .actOfAgreementBody: .internationalAgreements
        case .actOfAgreementParliamentaryBody: .internationalAgreements
        case .otherInternationalAct: .internationalAgreements
        case .opinion: .legislation
        case .budget: .legislation
        case .declaration: .legislation
        case .decision: .legislation
        case .commonForeignAndSecurityPolicy: .legislation
        case .policeAndJudicialCooperation: .legislation
        case .resolution: .legislation
        case .recommendation: .legislation
        case .jointVentureNonOpposition: .legislation
        case .ecscRecommendation: .legislation
        case .directive: .legislation
        case .concentrationNonOpposition: .legislation
        case .ecbGuideline: .legislation
        case .institutionalArrangement: .legislation
        case .regulation: .legislation
        case .ecscDecision: .legislation
        case .otherOfficialJournalLDocument: .legislation
        case .otherOfficialJournalCDocument: .legislation
        case .agreementBetweenMemberStates: .complementaryLegislation
        case .decisionOfMemberStateRepresentatives: .complementaryLegislation
        case .otherComplementaryOfficialJournalLAct: .complementaryLegislation
        case .otherComplementaryOfficialJournalCAct: .complementaryLegislation
        case .complementaryLegislation: .complementaryLegislation
        case .councilPosition: .preparatoryDocuments
        case .councilAssent: .preparatoryDocuments
        case .memberStateInitiative: .preparatoryDocuments
        case .otherCouncilDocument: .preparatoryDocuments
        case .commissionProposal: .preparatoryDocuments
        case .commissionDocument: .preparatoryDocuments
        case .jointDocument: .preparatoryDocuments
        case .staffWorkingDocument: .preparatoryDocuments
        case .codifiedRegulationProposal: .preparatoryDocuments
        case .codifiedDirectiveProposal: .preparatoryDocuments
        case .codifiedDecisionProposal: .preparatoryDocuments
        case .mergerControl: .preparatoryDocuments
        case .antitrust: .preparatoryDocuments
        case .stateAid: .preparatoryDocuments
        case .digitalMarketsAct: .preparatoryDocuments
        case .digitalServicesAct: .preparatoryDocuments
        case .otherCommissionDocument: .preparatoryDocuments
        case .legislativeResolution: .preparatoryDocuments
        case .parliamentBudget: .preparatoryDocuments
        case .parliamentResolution: .preparatoryDocuments
        case .parliamentInternalDecision: .preparatoryDocuments
        case .otherParliamentDocument: .preparatoryDocuments
        case .auditorsOpinion: .preparatoryDocuments
        case .auditorsReport: .preparatoryDocuments
        case .auditorsSpecialReport: .preparatoryDocuments
        case .otherAuditorsDocument: .preparatoryDocuments
        case .centralBankOpinion: .preparatoryDocuments
        case .centralBankRecommendation: .preparatoryDocuments
        case .otherCentralBankDocument: .preparatoryDocuments
        case .economicAndSocialCommitteeConsultationOpinion: .preparatoryDocuments
        case .economicAndSocialCommitteeOwnInitiativeOpinion: .preparatoryDocuments
        case .economicAndSocialCommitteeOpinion: .preparatoryDocuments
        case .otherEconomicAndSocialCommitteeDocument: .preparatoryDocuments
        case .regionsConsultationOpinion: .preparatoryDocuments
        case .regionsOwnInitiativeOpinion: .preparatoryDocuments
        case .otherRegionsDocument: .preparatoryDocuments
        case .ecscCommitteeOpinion: .preparatoryDocuments
        case .otherEcscCommitteeDocument: .preparatoryDocuments
        case .otherPreparatoryDocument: .preparatoryDocuments
        case .courtOfJusticeJudgment: .caseLaw
        case .courtOfJusticeOrder: .caseLaw
        case .advocateGeneralOpinion: .caseLaw
        case .courtOfJusticeSeizure: .caseLaw
        case .courtOfJusticeThirdPartyProceeding: .caseLaw
        case .courtOfJusticeOpinion: .caseLaw
        case .courtOfJusticeRuling: .caseLaw
        case .courtOfJusticeDecision: .caseLaw
        case .courtOfJusticeView: .caseLaw
        case .courtOfJusticeNewCase: .caseLaw
        case .courtOfJusticeJudgmentCommunication: .caseLaw
        case .courtOfJusticeOrderCommunication: .caseLaw
        case .courtOfJusticeOpinionRequest: .caseLaw
        case .courtOfJusticeOpinionCommunication: .caseLaw
        case .generalCourtJudgment: .caseLaw
        case .generalCourtOrder: .caseLaw
        case .generalCourtAdvocateGeneralOpinion: .caseLaw
        case .generalCourtThirdPartyProceeding: .caseLaw
        case .generalCourtNewCase: .caseLaw
        case .generalCourtJudgmentCommunication: .caseLaw
        case .generalCourtOrderCommunication: .caseLaw
        case .civilServiceTribunalJudgment: .caseLaw
        case .civilServiceTribunalOrder: .caseLaw
        case .civilServiceTribunalThirdPartyProceeding: .caseLaw
        case .civilServiceTribunalNewCase: .caseLaw
        case .civilServiceTribunalJudgmentCommunication: .caseLaw
        case .civilServiceTribunalOrderCommunication: .caseLaw
        case .belgianCaseLaw: .nationalCaseLaw
        case .bulgarianCaseLaw: .nationalCaseLaw
        case .czechCaseLaw: .nationalCaseLaw
        case .danishCaseLaw: .nationalCaseLaw
        case .germanCaseLaw: .nationalCaseLaw
        case .estonianCaseLaw: .nationalCaseLaw
        case .irishCaseLaw: .nationalCaseLaw
        case .greekCaseLaw: .nationalCaseLaw
        case .spanishCaseLaw: .nationalCaseLaw
        case .frenchCaseLaw: .nationalCaseLaw
        case .croatianCaseLaw: .nationalCaseLaw
        case .italianCaseLaw: .nationalCaseLaw
        case .cypriotCaseLaw: .nationalCaseLaw
        case .latvianCaseLaw: .nationalCaseLaw
        case .lithuanianCaseLaw: .nationalCaseLaw
        case .luxembourgCaseLaw: .nationalCaseLaw
        case .hungarianCaseLaw: .nationalCaseLaw
        case .malteseCaseLaw: .nationalCaseLaw
        case .dutchCaseLaw: .nationalCaseLaw
        case .austrianCaseLaw: .nationalCaseLaw
        case .polishCaseLaw: .nationalCaseLaw
        case .portugueseCaseLaw: .nationalCaseLaw
        case .romanianCaseLaw: .nationalCaseLaw
        case .slovenianCaseLaw: .nationalCaseLaw
        case .slovakCaseLaw: .nationalCaseLaw
        case .finnishCaseLaw: .nationalCaseLaw
        case .swedishCaseLaw: .nationalCaseLaw
        case .britishCaseLaw: .nationalCaseLaw
        case .swissCaseLaw: .nationalCaseLaw
        case .icelandicCaseLaw: .nationalCaseLaw
        case .norwegianCaseLaw: .nationalCaseLaw
        case .otherCaseLaw: .nationalCaseLaw
        case .writtenQuestion: .parliamentaryQuestions
        case .questionTimeQuestion: .parliamentaryQuestions
        case .oralQuestion: .parliamentaryQuestions
        case .eftaAgreement: .efta
        case .eftaSurveillanceAuthorityAct: .efta
        case .eftaStandingCommitteeAct: .efta
        case .eftaCourtDecision: .efta
        case .eftaCourtPendingCase: .efta
        case .eftaInformation: .efta
        }
    }

    public var code: String {
        switch self {
        case .ecscTreaty: "K"
        case .euratomTreaty: "A"
        case .ecTreaty: "E"
        case .mergerTreaty: "F"
        case .accessionTreaty1972: "B"
        case .financialProvisionsTreaty1975: "R"
        case .accessionTreaty1979: "H"
        case .accessionTreaty1985: "I"
        case .greenlandTreaty: "G"
        case .singleEuropeanAct: "U"
        case .treatyOnEuropeanUnion: "M"
        case .accessionTreaty1994: "N"
        case .treatyOfAmsterdam: "D"
        case .treatyOfNice: "C"
        case .accessionTreaty2003: "T"
        case .constitutionalTreaty: "V"
        case .accessionTreaty2005: "S"
        case .treatyOfLisbon: "L"
        case .charterOfFundamentalRights: "P"
        case .accessionTreaty2012: "J"
        case .withdrawalAgreement: "W"
        case .investmentBankStatuteTreaty1975: "X"
        case .consolidatedTreaties2016: "ME"
        case .internationalAgreement: "A"
        case .actOfAgreementBody: "D"
        case .actOfAgreementParliamentaryBody: "P"
        case .otherInternationalAct: "X"
        case .opinion: "A"
        case .budget: "B"
        case .declaration: "C"
        case .decision: "D"
        case .commonForeignAndSecurityPolicy: "E"
        case .policeAndJudicialCooperation: "F"
        case .resolution: "G"
        case .recommendation: "H"
        case .jointVentureNonOpposition: "J"
        case .ecscRecommendation: "K"
        case .directive: "L"
        case .concentrationNonOpposition: "M"
        case .ecbGuideline: "O"
        case .institutionalArrangement: "Q"
        case .regulation: "R"
        case .ecscDecision: "S"
        case .otherOfficialJournalLDocument: "X"
        case .otherOfficialJournalCDocument: "Y"
        case .agreementBetweenMemberStates: "A"
        case .decisionOfMemberStateRepresentatives: "D"
        case .otherComplementaryOfficialJournalLAct: "X"
        case .otherComplementaryOfficialJournalCAct: "Y"
        case .complementaryLegislation: "Z"
        case .councilPosition: "AG"
        case .councilAssent: "KG"
        case .memberStateInitiative: "IG"
        case .otherCouncilDocument: "XG"
        case .commissionProposal: "PC"
        case .commissionDocument: "DC"
        case .jointDocument: "JC"
        case .staffWorkingDocument: "SC"
        case .codifiedRegulationProposal: "EC"
        case .codifiedDirectiveProposal: "FC"
        case .codifiedDecisionProposal: "GC"
        case .mergerControl: "M"
        case .antitrust: "AT"
        case .stateAid: "AS"
        case .digitalMarketsAct: "DMA"
        case .digitalServicesAct: "DSA"
        case .otherCommissionDocument: "XC"
        case .legislativeResolution: "AP"
        case .parliamentBudget: "BP"
        case .parliamentResolution: "IP"
        case .parliamentInternalDecision: "DP"
        case .otherParliamentDocument: "XP"
        case .auditorsOpinion: "AA"
        case .auditorsReport: "TA"
        case .auditorsSpecialReport: "SA"
        case .otherAuditorsDocument: "XA"
        case .centralBankOpinion: "AB"
        case .centralBankRecommendation: "HB"
        case .otherCentralBankDocument: "XB"
        case .economicAndSocialCommitteeConsultationOpinion: "AE"
        case .economicAndSocialCommitteeOwnInitiativeOpinion: "IE"
        case .economicAndSocialCommitteeOpinion: "AC"
        case .otherEconomicAndSocialCommitteeDocument: "XE"
        case .regionsConsultationOpinion: "AR"
        case .regionsOwnInitiativeOpinion: "IR"
        case .otherRegionsDocument: "XR"
        case .ecscCommitteeOpinion: "AK"
        case .otherEcscCommitteeDocument: "XK"
        case .otherPreparatoryDocument: "XX"
        case .courtOfJusticeJudgment: "CJ"
        case .courtOfJusticeOrder: "CO"
        case .advocateGeneralOpinion: "CC"
        case .courtOfJusticeSeizure: "CS"
        case .courtOfJusticeThirdPartyProceeding: "CT"
        case .courtOfJusticeOpinion: "CV"
        case .courtOfJusticeRuling: "CX"
        case .courtOfJusticeDecision: "CD"
        case .courtOfJusticeView: "CP"
        case .courtOfJusticeNewCase: "CN"
        case .courtOfJusticeJudgmentCommunication: "CA"
        case .courtOfJusticeOrderCommunication: "CB"
        case .courtOfJusticeOpinionRequest: "CU"
        case .courtOfJusticeOpinionCommunication: "CG"
        case .generalCourtJudgment: "TJ"
        case .generalCourtOrder: "TO"
        case .generalCourtAdvocateGeneralOpinion: "TC"
        case .generalCourtThirdPartyProceeding: "TT"
        case .generalCourtNewCase: "TN"
        case .generalCourtJudgmentCommunication: "TA"
        case .generalCourtOrderCommunication: "TB"
        case .civilServiceTribunalJudgment: "FJ"
        case .civilServiceTribunalOrder: "FO"
        case .civilServiceTribunalThirdPartyProceeding: "FT"
        case .civilServiceTribunalNewCase: "FN"
        case .civilServiceTribunalJudgmentCommunication: "FA"
        case .civilServiceTribunalOrderCommunication: "FB"
        case .belgianCaseLaw: "BE"
        case .bulgarianCaseLaw: "BG"
        case .czechCaseLaw: "CZ"
        case .danishCaseLaw: "DK"
        case .germanCaseLaw: "DE"
        case .estonianCaseLaw: "EE"
        case .irishCaseLaw: "IE"
        case .greekCaseLaw: "EL"
        case .spanishCaseLaw: "ES"
        case .frenchCaseLaw: "FR"
        case .croatianCaseLaw: "HR"
        case .italianCaseLaw: "IT"
        case .cypriotCaseLaw: "CY"
        case .latvianCaseLaw: "LV"
        case .lithuanianCaseLaw: "LT"
        case .luxembourgCaseLaw: "LU"
        case .hungarianCaseLaw: "HU"
        case .malteseCaseLaw: "MT"
        case .dutchCaseLaw: "NL"
        case .austrianCaseLaw: "AT"
        case .polishCaseLaw: "PL"
        case .portugueseCaseLaw: "PT"
        case .romanianCaseLaw: "RO"
        case .slovenianCaseLaw: "SI"
        case .slovakCaseLaw: "SK"
        case .finnishCaseLaw: "FI"
        case .swedishCaseLaw: "SE"
        case .britishCaseLaw: "UK"
        case .swissCaseLaw: "CH"
        case .icelandicCaseLaw: "IS"
        case .norwegianCaseLaw: "NO"
        case .otherCaseLaw: "XX"
        case .writtenQuestion: "E"
        case .questionTimeQuestion: "H"
        case .oralQuestion: "O"
        case .eftaAgreement: "A"
        case .eftaSurveillanceAuthorityAct: "C"
        case .eftaStandingCommitteeAct: "G"
        case .eftaCourtDecision: "J"
        case .eftaCourtPendingCase: "P"
        case .eftaInformation: "X"
        }
    }
}
