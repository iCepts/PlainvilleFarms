PageExtension 50105 pageextension50105 extends "Sales Order Subform"
{
    layout
    {

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TypeOnAfterValidate;
        NoOnAfterValidate;
        TypeChosen := HasTypeToFillMandatotyFields;
        SetLocationCodeMandatory;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TypeOnAfterValidate;
        NoOnAfterValidate;
        TypeChosen := Type <> Type::" ";
        SetLocationCodeMandatory;
        */
        //end;

        /* 
        modify("Qty. to Ship")
        {
            Visible = false;
        } */
        addafter("No.")
        {
            field("Report Code"; "Report Code")
            {
                ApplicationArea = Basic;
            }
            field("Quantity 2"; "Quantity 2")
            {
                ApplicationArea = Basic;

                trigger OnValidate()
                begin
                    Quantity2OnAfterValidate;
                end;
            }
            field("Original Quantity 2"; "Original Quantity 2")
            {
                ApplicationArea = Basic;

            }
            field("Shelf Life"; "Shelf Life")
            {
                ApplicationArea = Basic;
            }
            field("Outstanding Quantity"; "Outstanding Quantity")
            {
                ApplicationArea = Basic;
            }
            field("Outstanding Quantity 2"; "Outstanding Quantity 2")
            {
                ApplicationArea = Basic;
            }
            field("Qty. to Ship 2"; "Qty. to Ship 2")
            {
                ApplicationArea = Basic;
            }
            field("Broker Commission"; "Broker Commission")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Description)
        {
            field("Description 2"; "Description 2")
            {
                ApplicationArea = Basic;
            }

        }
        addafter("Bin Code")
        {
            field("Establishment No."; "Establishment No.")
            {
                ApplicationArea = Basic;
            }
            field("Expiration Date"; "Expiration Date")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Control50)
        {
            field("Original Quantity"; "Original Quantity")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Unit Price")
        {
            field("Disc. per Qty UM"; "Disc. per Qty UM")
            {
                ApplicationArea = Basic;
            }
            field("Unit of Measure 2"; "Unit of Measure 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Inv. Discount Amount")
        {
            field("<Qty. to Ship 2->"; "Qty. to Ship 2")
            {
                ApplicationArea = Basic;
            }

        }
        addafter("Planned Shipment Date")
        {
            field(TransferDate; TransferDate)
            {
                ApplicationArea = Basic;
            }
        }

    }
    actions
    {
        addafter(OrderPromising)
        {
            separator(Action1000000001)
            {
            }
            action("Sort by Item Number")
            {
                ApplicationArea = Basic;
                Caption = 'Sort by Item Number';

                trigger OnAction()
                begin
                    // iCepts BRB 06.29.09 - Sort by Item No.
                    SortByTypeNo;
                end;
            }
        }
        addafter("Get Li&ne Discount")
        {
            action("Calculate Case Price")
            {
                ApplicationArea = Basic;
                Caption = 'Calculate Case Price';

                trigger OnAction()
                begin
                    // iCepts BRB 04.10.13 - Calc Case Price
                    UpdateCaseUnitPrice;
                end;
            }
        }
    }


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TypeChosen := HasTypeToFillMandatotyFields;
    SetLocationCodeMandatory;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TypeChosen := Type <> Type::" ";
    SetLocationCodeMandatory;
    */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InitType;
    CLEAR(ShortcutDimCode);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    InitType;
    CLEAR(ShortcutDimCode);

    SETCURRENTKEY("Document Type","Document No.","Line No.");
    */
    //end;



    //Unsupported feature: Code Modification on "NoOnAfterValidate(PROCEDURE 19066594)".

    //procedure NoOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InsertExtendedText(FALSE);
    IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
       (xRec."No." <> '')
    THEN
      CurrPage.SAVERECORD;

    SaveAndAutoAsmToOrder;

    IF Reserve = Reserve::Always THEN BEGIN
      CurrPage.SAVERECORD;
      IF ("Outstanding Qty. (Base)" <> 0) AND ("No." <> xRec."No.") THEN BEGIN
        AutoReserve(TRUE);
        CurrPage.UPDATE(FALSE);
      END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
    IF (Reserve = Reserve::Always) AND
       ("Outstanding Qty. (Base)" <> 0) AND
       ("No." <> xRec."No.")
    THEN BEGIN
      CurrPage.SAVERECORD;
      AutoReserve(TRUE);
      CurrPage.UPDATE(FALSE);
    END;
    */
    //end;


    procedure SortByTypeNo()
    begin
        SetCurrentkey(Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Document Type", "Shipment Date");
    end;

    procedure UpdateCaseUnitPrice()
    var
        lSalesPrice: Record "Sales Price";
        lSalesHeader: Record "Sales Header";
        lCurrency: Record Currency;
        lSalesLine: Record "Sales Line";
    begin
        // iCepts BRB 04.10.13 - Determine Case Pricing
        lSalesLine.Reset;
        lSalesLine.SetRange("Document Type", "Document Type");
        lSalesLine.SetRange("Document No.", "Document No.");
        lSalesLine.SetRange(Type, Type::Item);
        if lSalesLine.FindFirst then begin
            repeat
                lSalesHeader.Get("Document Type", lSalesLine."Document No.");
                if lSalesHeader."Currency Code" = '' then
                    lCurrency.InitRoundingPrecision
                else begin
                    lSalesHeader.TestField("Currency Factor");
                    lCurrency.Get(lSalesHeader."Currency Code");
                    lCurrency.TestField("Amount Rounding Precision");
                end;

                lSalesPrice.Reset;
                lSalesPrice.SetRange("Item No.", lSalesLine."No.");
                lSalesPrice.SetRange("Sales Type", lSalesPrice."sales type"::Customer);
                lSalesPrice.SetRange("Sales Code", lSalesHeader."Sell-to Customer No."); // iCepts BRB 05.07.13 - Only for specific Customer
                lSalesPrice.SetRange("Unit of Measure Code", 'CS');
                lSalesPrice.SetRange("Req InvoiceUM", true);
                lSalesPrice.SetFilter("Starting Date", '<=%1', WorkDate);
                lSalesPrice.SetFilter("Ending Date", '%1|>%2', 0D, WorkDate);
                if not lSalesPrice.FindFirst then begin
                    // iCepts BRB 05.06.13 - MESSAGE('Filters\%1',lSalesPrice.GETFILTERS);
                    // iCepts BRB 05.06.13 - MESSAGE('There are no Case Prices with Req Inv UOM flagged for this item - %1',"No.");
                end else begin
                    if lSalesLine."Qty. to Ship" <> 0 then begin
                        lSalesLine.Validate("Unit Price",
                          ROUND(
                              lSalesPrice."Unit Price" * (lSalesLine."Qty. to Ship 2" / lSalesLine."Qty. to Ship"),
                              lCurrency."Unit-Amount Rounding Precision"));
                        lSalesLine.Modify;
                    end;
                end;
            until lSalesLine.Next = 0;
        end;
    end;

    local procedure Quantity2OnAfterValidate()
    var
        UpdateIsDone: Boolean;
    begin
        if Type = Type::Item then
            case Reserve of
                Reserve::Always:
                    begin
                        CurrPage.SaveRecord;
                        AutoReserve();
                        CurrPage.Update(false);
                        UpdateIsDone := true;
                    end;
                Reserve::Optional:
                    if ("Quantity 2" < xRec."Quantity 2") and (xRec."Quantity 2" > 0) then begin
                        CurrPage.SaveRecord;
                        CurrPage.Update(false);
                        UpdateIsDone := true;
                    end;
            end;

        if (Type = Type::Item) and
           ("Quantity 2" <> xRec."Quantity 2") and
           not UpdateIsDone
        then
            CurrPage.Update(true);

        // iCepts BRB 10.12.09 - Update Sigma
        //IF ("Quantity 2" <> 0) AND ("No." <> '') THEN      //08.31.11 DXD RFM7282
        //  SendToSigma(FALSE);                              //08.31.11 DXD RFM7282
    end;
}

