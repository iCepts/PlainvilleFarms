codeunit 50004 ItemJournalCheckLineEvents
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Check Line", 'OnBeforeCheckDimensions', '', true, true)]
    local procedure "Item Jnl.-Check Line_OnBeforeCheckDimensions"
    (
        var ItemJournalLine: Record "Item Journal Line";
        CalledFromAdjustment: Boolean;
        var IsHandled: Boolean
    )
    var
        SecondQtyMgt: Codeunit SecondQtyManagement;

    begin
        //Icepts1.0 RFM6066 DRS 06/13/2008
        IF ItemJournalLine.Quantity <> 0 THEN // iCepts BRB 05.25.10 - Getting an error saying Quantity 2 can't be 0, only Invoicing PO iCepts1.01
            SecondQtyMgt.ZeroCheck(ItemJournalLine);
    end;

}