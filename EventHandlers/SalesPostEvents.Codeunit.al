codeunit 50101 SalesPostEvents
{
    //Icepts 1.01 Quantity 2
    // iCepts BRB 07.15.09 - Check for Zero Prices Warning

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]
    local procedure "Sales-Post_OnBeforePostSalesDoc"
    (
        var SalesHeader: Record "Sales Header";
        CommitIsSuppressed: Boolean;
        PreviewMode: Boolean;
        var HideProgressWindow: Boolean
    )
    begin
        SalesHeader.Check0prices;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostLines', '', true, true)]
    local procedure "Sales-Post_OnBeforePostLines"
    (
        var SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
        CommitIsSuppressed: Boolean;
        PreviewMode: Boolean
    )
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterUpdateSalesLineBeforePost', '', true, true)]
    local procedure "Sales-Post_OnAfterUpdateSalesLineBeforePost"
    (
        var SalesLine: Record "Sales Line";
        var SalesHeader: Record "Sales Header";
        WhseShip: Boolean;
        WhseReceive: Boolean;
        CommitIsSuppressed: Boolean;
    )
    begin
        IF (SalesLine."Document Type" = SalesLine."Document Type"::Invoice) AND (SalesLine."Shipment No." <> '') THEN
            //Icepts 1.01
            SalesLine."Quantity Shipped 2" := SalesLine."Quantity 2";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesShptLineInsert', '', true, true)]
    local procedure "Sales-Post_OnBeforeSalesShptLineInsert"
    (
        var SalesShptLine: Record "Sales Shipment Line";
        SalesShptHeader: Record "Sales Shipment Header";
        SalesLine: Record "Sales Line";
        CommitIsSuppressed: Boolean;
        PostedWhseShipmentLine: Record "Posted Whse. Shipment Line";
        SalesHeader: Record "Sales Header";
        WhseShip: Boolean;
        WhseReceive: Boolean;
        ItemLedgShptEntryNo: Integer
    )
    begin
        SalesShptLine."Quantity 2" := SalesLine."Qty. to Ship 2";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnPostItemJnlLineOnAfterCopyDocumentFields', '', true, true)]
    local procedure "Sales-Post_OnPostItemJnlLineOnAfterCopyDocumentFields"
    (
        var ItemJournalLine: Record "Item Journal Line";
        SalesLine: Record "Sales Line";
        WarehouseReceiptHeader: Record "Warehouse Receipt Header";
        WarehouseShipmentHeader: Record "Warehouse Shipment Header"
    )
    begin
        ItemJournalLine."Unit of Measure Code 2" := SalesLine."Unit of Measure 2";

        IF SalesLine."Document Type" IN [SalesLine."Document Type"::"Return Order", SalesLine."Document Type"::"Credit Memo"] THEN
            ItemJournalLine."Quantity 2" := -SalesLine."Qty. to Ship 2"
        ELSE
            ItemJournalLine."Quantity 2" := SalesLine."Qty. to Ship 2";

    end;


    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesHeader', '', true, true)]
    local procedure "Item Journal Line_OnAfterCopyItemJnlLineFromSalesHeader"
    (
        var ItemJnlLine: Record "Item Journal Line";
        SalesHeader: Record "Sales Header"
    )
    var
        SalesLine: Record "Sales Line";
    begin
        // iCepts BRB 08.06.13 - RFM7914 - Update Broker Code :START
        if SalesLine.Get(SalesHeader."Document Type", SalesHeader."No.", ItemJnlLine."Document Line No.") then
            IF SalesHeader."Broker Code" <> '' THEN
                IF SalesLine."Broker Commission" = TRUE THEN
                    ItemJnlLine."Broker Code" := SalesHeader."Broker Code";

        // iCepts DXD 04.16.15 (11.28.14 - RFM8314)
        ItemJnlLine."Ship-to Code" := SalesHeader."Ship-to Code"; //RFM8314 11.28.14
        ItemJnlLine."Ship-to Name" := SalesHeader."Ship-to Name"; //RFM8314 11.28.14

    end;

}