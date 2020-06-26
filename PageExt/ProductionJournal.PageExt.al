PageExtension 50115 pageextension50115 extends "Production Journal"
{
    layout
    {
        addafter("Item No.")
        {
            field("Unit Amount"; "Unit Amount")
            {
                ApplicationArea = Basic;
            }
            field("Unit Cost"; "Unit Cost")
            {
                ApplicationArea = Basic;
            }
        }
      /*   addafter(Description)
        {
            field("Description 2"; ProdOrder."Description 2")
            {
                ApplicationArea = Basic;
                Caption = 'Description 2';
            }
        } */
        addafter("Unit of Measure Code")
        {
            field("Quantity 2"; "Quantity 2")
            {
                ApplicationArea = Basic;
                Editable = Quantity2Editable;
            }
            field("Unit of Measure Code 2"; "Unit of Measure Code 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Output Quantity")
        {
            field("Output Quantity 2"; "Output Quantity 2")
            {
                ApplicationArea = Basic;
                Editable = OutputQuantity2Editable;
            }
            field("<Unit of Measure Code 2->"; "Unit of Measure Code 2")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addafter("&Print")
        {
            action("Update &Qty2")
            {
                ApplicationArea = Basic;
                Caption = 'Update &Qty2';
                Ellipsis = true;
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Text001: label 'Ok to Update Quantity 2 on the Output Lines for Order No. %1?';
                    Text002: label 'Output Lines for Order No. %1 have been updated.';
                    Text003: label 'No Production Ledger Entry Found for Quantity 2 for Order No. %1.';
                    NothingToPostErr: label 'There are no Output Lines to post Quantity 2 values too.';
                    ItemJournalLine2: Record "Item Journal Line";
                    ItemLedgerEntry2: Record "Item Ledger Entry";
                    Quantity2Amt: Decimal;
                begin
                    // iCepts WRW 05.08.18 - RFM9225 Populate the Number of Cases (qty2) from Production Import - Start
                    if not Confirm(Text001, false, "Order No.") then
                        exit;

                    ItemLedgerEntry2.Reset;
                    ItemLedgerEntry2.SetRange("Order Type", ItemLedgerEntry2."order type"::Production);
                    ItemLedgerEntry2.SetRange("Order No.", Rec."Order No.");
                    if ItemLedgerEntry2.FindSet then begin
                        Quantity2Amt := ItemLedgerEntry2."Quantity 2";
                    end else begin
                        Message(Text003, Rec."Order No.");
                        exit;
                    end;

                    ItemJournalLine2.Reset;
                    ItemJournalLine2.SetRange("Document No.", Rec."Order No.");
                    ItemJournalLine2.SetRange("Entry Type", ItemJournalLine2."entry type"::Output);
                    ItemJournalLine2.SetRange("Inventory Posting Group", 'FG');
                    if ItemJournalLine2.FindSet then begin
                        repeat
                            if ItemJournalLine2."Output Quantity 2" = 0 then begin
                                ItemJournalLine2.Validate(ItemJournalLine2."Output Quantity 2", Quantity2Amt);
                                ItemJournalLine2."Changed by User" := true;
                                ItemJournalLine2.Modify(true);
                            end;
                        until ItemJournalLine2.Next = 0;
                        Message(Text002, Rec."Order No.");
                    end else begin
                        Message(NothingToPostErr);
                        exit;
                    end;

                    CurrPage.Update(false);
                    // iCepts WRW 05.08.18 - RFM9225 Populate the Number of Cases (qty2) from Production Import - End
                end;
            }
        }
    }

    var
        [InDataSet]
        OutputQuantity2Editable: Boolean;
        [InDataSet]
        Quantity2Editable: Boolean;


    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Applies-from EntryEditable" := TRUE;
    QuantityEditable := TRUE;
    "Output QuantityEditable" := TRUE;
    #4..10
    "Concurrent CapacityEditable" := TRUE;
    "Ending TimeEditable" := TRUE;
    "Starting TimeEditable" := TRUE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
    Quantity2Editable := TRUE;
    OutputQuantity2Editable := TRUE;
    */
    //end;


    //Unsupported feature: Code Modification on "ControlsMngt(PROCEDURE 1)".

    //procedure ControlsMngt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF ("Entry Type" = "Entry Type"::Output) AND
       ("Operation No." <> '')
    THEN
    #4..16
    "Scrap CodeEditable" := "Entry Type" = "Entry Type"::Output;
    "Scrap QuantityEditable" := "Entry Type" = "Entry Type"::Output;
    "Output QuantityEditable" := "Entry Type" = "Entry Type"::Output;

    QuantityEditable := "Entry Type" = "Entry Type"::Consumption;
    "Applies-from EntryEditable" := "Entry Type" = "Entry Type"::Consumption;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..19
    OutputQuantity2Editable := "Entry Type" = "Entry Type"::Output;

    QuantityEditable := "Entry Type" = "Entry Type"::Consumption;
    Quantity2Editable := "Entry Type" = "Entry Type"::Consumption;
    "Applies-from EntryEditable" := "Entry Type" = "Entry Type"::Consumption;
    */
    //end;
}

