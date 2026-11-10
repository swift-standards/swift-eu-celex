# swift-eu-celex

Use this package when you take a CELEX number, the identifier EUR-Lex gives each document, as text, such as `32004R0261`, and need its sector, year, document type and number, or a corrigendum's or consolidated version's suffix. Start from `CELEX`. A value that parses is well-formed. It is not necessarily assigned. The sector and document-type enums, `CELEX.Sector` and `CELEX.Descriptor`, are generated from the Publications Office's table [Types of documents in EUR-Lex](https://eur-lex.europa.eu/content/tools/TableOfSectors/types_of_documents_in_eurlex.html), as published on 10 November 2026: 12 sectors and 157 descriptors. The grammar follows the Publications Office's guide *How CELEX numbers are composed*, version 2025 of 1 September 2025.

## Laws

- A CELEX number is the sector, the four-digit year, the descriptor and the number, as in `32004R0261`: sector 3, 2004, `.regulation`, number `0261`. `description` prints it back exactly.
- The descriptor must be in its sector's table, and the longest code there wins, so `52025DMA00100` is `.digitalMarketsAct` and `12016ME/TXT` is `.consolidatedTreaties2016`. Codes are upper case. Lower case is refused.
- Outside the treaties, a number is digits, then optionally a split in parentheses of two or three digits, then optionally one letter and digits, as in `0424(01)`, `0903(135)` and `0241P1331`. A treaty's number is letters, digits, slashes, dots and parentheses, as in `E/TXT` and `D001/P9`, and it may be empty when the whole treaty is cited, as in `11992E`.
- A corrigendum adds `R` and a two-digit sequence from 01 in parentheses: `32016R0679R(02)` is `.corrigendum(2)`. Sectors 0 and 7 have no corrigenda, and one there is refused.
- A consolidated text is sector 0 with a dash and the date of its last amendment, a real `yyyymmdd`: `02016R0679-20160504`. Its type is read from the first of sectors 3, 5, 2, 4 and 6 whose table has the code and leaves a number starting with a digit, and from the treaties otherwise. So `01999L0094-20031120` is a directive and `01972B/TXT-19730101` is the 1972 accession treaty.
- A national transposition measure is sector 7, the act it transposes as in sector 3 with a four-digit number, an ISO 3166 alpha-3 country, an underscore and the Commission's number: `72015L2366HRV_279843`. Its type is the sector 3 type of that act.
- Sector 8 national case law is the year, a country code from the table, the month and day, and a two-digit split: `82016DE0607(51)`. Country codes outside the pinned table, such as `XI`, are refused.
- A sector C number since 1 October 2023 is `C/`, the year, `/` and the five-digit OJ C number: `C/2025/03118`. Before then it is `C`, the year, `/`, the three-digit OJ C issue with an optional letter, `/` and an item of up to three digits, which may be empty, followed by an optional split and corrigendum: `C2005/315/24`, `C2006/044A/`, `C2015/003A/01R(01)`. Neither form has a type.
- EUR-Lex's own derived numbers, such as the `_SUM` and `_INF` suffixes on case-law summaries, are not in the guide and are refused.
- Text is never trimmed or case-folded.
