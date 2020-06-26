codeunit 50100 CopyDocumentMgtEvents
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnBeforeInsertToSalesLine', '', true, true)]
    local procedure "Copy Document Mgt._OnBeforeInsertToSalesLine"
    (
        var ToSalesLine: Record "Sales Line";
        FromSalesLine: Record "Sales Line";
        FromDocType: Option;
        RecalcLines: Boolean;
        var ToSalesHeader: Record "Sales Header";
        DocLineNo: Integer;
        var NextLineNo: Integer
    )
    begin
        //iCepts WRW 09.08.16 Map Quantity 2 to Qty. to Ship 2
        IF ToSalesLine.Type = ToSalesLine.Type::Item THEN
            ToSalesLine."Qty. to Ship 2" := ToSalesLine."Quantity 2";

    end;


}