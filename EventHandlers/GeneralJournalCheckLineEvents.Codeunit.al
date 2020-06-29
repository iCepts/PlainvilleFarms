codeunit 50005 GeneralJrnlRunCheckLineEvents
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Check Line", 'OnBeforeRunCheck', '', true, true)]
    local procedure "Gen. Jnl.-Check Line_OnBeforeRunCheck"(var GenJournalLine: Record "Gen. Journal Line")
    var
        PostInterCompanyTransactions: Codeunit PostIntercompanyTransactions;

    begin
        // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments
        IF GenJournalLine."InterCompany Code" <> '' THEN
            PostInterCompanyTransactions.IntercompanyPayments(GenJournalLine);

    end;

}