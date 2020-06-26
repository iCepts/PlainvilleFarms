TableExtension 50106 tableextension50106 extends "Sales Header"
{
    DrillDownPageID = "Sales List";
    fields
    {
        field(50000; "Shipping Day"; Option)
        {
            OptionMembers = " ",Mon,Tue,Wed,Thu,Fri,Sat,Sun;
        }
        field(50001; "Load No"; Text[20])
        {

        }
        field(50002; "Broker Code"; Code[10])
        {
            TableRelation = "Broker/Cust Svc Rep";
        }
        field(50003; "Cust Service Rep"; Code[10])
        {
            TableRelation = "Broker/Cust Svc Rep";
        }
        field(50004; "Shelf Life"; Option)
        {
            OptionMembers = " ",A,B,C;
            Description = 'iCepts1.08';
        }
        field(50005; "Ship Status"; Option)
        {
            OptionMembers = "Not Shipped",Shipped;
        }
        field(50010; "LoadingLocation"; Code[10])
        {
            TableRelation = "Loading Location".Code;

            Caption = 'Loading Location';
            Description = 'iCepts1.14';
        }
        field(50020; "Ordr Class"; Option)
        {
            OptionMembers = " ",Holiday;
        }



        //Unsupported feature: Code Modification on ""Sell-to Customer No."(Field 2).OnValidate".

        //trigger "(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckCreditLimitIfLineNotInsertedYet;
        TESTFIELD(Status,Status::Open);
        IF ("Sell-to Customer No." <> xRec."Sell-to Customer No.") AND
           (xRec."Sell-to Customer No." <> '')
        THEN BEGIN
          IF ("Opportunity No." <> '') AND ("Document Type" IN ["Document Type"::Quote,"Document Type"::Order]) THEN
            ERROR(
              Text062,
              FIELDCAPTION("Sell-to Customer No."),
              FIELDCAPTION("Opportunity No."),
              "Opportunity No.",
              "Document Type");
          IF HideValidationDialog OR NOT GUIALLOWED THEN
            Confirmed := TRUE
          ELSE
            Confirmed := CONFIRM(Text004,FALSE,FIELDCAPTION("Sell-to Customer No."));
          IF Confirmed THEN BEGIN
            SalesLine.SETRANGE("Document Type","Document Type");
            SalesLine.SETRANGE("Document No.","No.");
        //EFT3.00.10 -
            EFTTran.SETCURRENTKEY("Document Type", "Document No.");
            EFTTran.SETRANGE("Document Type", "Document Type");
            EFTTran.SETRANGE("Document No.", "No.");
        //EFT3.00.10 +
            IF "Sell-to Customer No." = '' THEN BEGIN
              IF SalesLine.FINDFIRST THEN
                ERROR(
                  Text005,
                  FIELDCAPTION("Sell-to Customer No."));
        //EFT3.00.10 -
              IF NOT EFTTran.ISEMPTY THEN
                ERROR(EFTText003, FIELDCAPTION("Sell-to Customer No."));
        //EFT3.00.10 +
              INIT;
              SalesSetup.GET;
              "No. Series" := xRec."No. Series";
              InitRecord;
              IF xRec."Shipping No." <> '' THEN BEGIN
                "Shipping No. Series" := xRec."Shipping No. Series";
                "Shipping No." := xRec."Shipping No.";
              END;
              IF xRec."Posting No." <> '' THEN BEGIN
                "Posting No. Series" := xRec."Posting No. Series";
                "Posting No." := xRec."Posting No.";
              END;
              IF xRec."Return Receipt No." <> '' THEN BEGIN
                "Return Receipt No. Series" := xRec."Return Receipt No. Series";
                "Return Receipt No." := xRec."Return Receipt No.";
              END;
              IF xRec."Prepayment No." <> '' THEN BEGIN
                "Prepayment No. Series" := xRec."Prepayment No. Series";
                "Prepayment No." := xRec."Prepayment No.";
              END;
              IF xRec."Prepmt. Cr. Memo No." <> '' THEN BEGIN
                "Prepmt. Cr. Memo No. Series" := xRec."Prepmt. Cr. Memo No. Series";
                "Prepmt. Cr. Memo No." := xRec."Prepmt. Cr. Memo No.";
              END;
        //CLN1.00.05 -
              EmailEventMgt.PopulateSalesEmailAddressOnAfterValidateSalesHeaderSellTo(Rec, xRec, CurrFieldNo);
        //CLN1.00.05 +
              EXIT;
            END;
            IF "Document Type" = "Document Type"::Order THEN
              SalesLine.SETFILTER("Quantity Shipped",'<>0')
            ELSE
              IF "Document Type" = "Document Type"::Invoice THEN BEGIN
                SalesLine.SETRANGE("Sell-to Customer No.",xRec."Sell-to Customer No.");
                SalesLine.SETFILTER("Shipment No.",'<>%1','');
              END;

            IF SalesLine.FINDFIRST THEN
              IF "Document Type" = "Document Type"::Order THEN
                SalesLine.TESTFIELD("Quantity Shipped",0)
              ELSE
                SalesLine.TESTFIELD("Shipment No.",'');
            SalesLine.SETRANGE("Shipment No.");
            SalesLine.SETRANGE("Quantity Shipped");

            IF "Document Type" = "Document Type"::Order THEN BEGIN
              SalesLine.SETFILTER("Prepmt. Amt. Inv.",'<>0');
              IF SalesLine.FIND('-') THEN
                SalesLine.TESTFIELD("Prepmt. Amt. Inv.",0);
              SalesLine.SETRANGE("Prepmt. Amt. Inv.");
            END;

            IF "Document Type" = "Document Type"::"Return Order" THEN
              SalesLine.SETFILTER("Return Qty. Received",'<>0')
            ELSE
              IF "Document Type" = "Document Type"::"Credit Memo" THEN BEGIN
                SalesLine.SETRANGE("Sell-to Customer No.",xRec."Sell-to Customer No.");
                SalesLine.SETFILTER("Return Receipt No.",'<>%1','');
              END;

            IF SalesLine.FINDFIRST THEN
              IF "Document Type" = "Document Type"::"Return Order" THEN
                SalesLine.TESTFIELD("Return Qty. Received",0)
              ELSE
                SalesLine.TESTFIELD("Return Receipt No.",'');
            SalesLine.RESET
          END ELSE BEGIN
            Rec := xRec;
            EXIT;
          END;
        END;

        IF ("Document Type" = "Document Type"::Order) AND
           (xRec."Sell-to Customer No." <> "Sell-to Customer No.")
        THEN BEGIN
          SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::Order);
          SalesLine.SETRANGE("Document No.","No.");
          SalesLine.SETFILTER("Purch. Order Line No.",'<>0');
          IF NOT SalesLine.ISEMPTY THEN
            ERROR(
              Text006,
              FIELDCAPTION("Sell-to Customer No."));
          SalesLine.RESET;
        END;

        GetCust("Sell-to Customer No.");

        Cust.CheckBlockedCustOnDocs(Cust,"Document Type",FALSE,FALSE);
        GLSetup.GET;
        IF GLSetup."VAT in Use" THEN
          Cust.TESTFIELD("Gen. Bus. Posting Group");
        "Sell-to Customer Template Code" := '';
        "Sell-to Customer Name" := Cust.Name;
        "Sell-to Customer Name 2" := Cust."Name 2";
        "Sell-to Address" := Cust.Address;
        "Sell-to Address 2" := Cust."Address 2";
        "Sell-to City" := Cust.City;
        "Sell-to Post Code" := Cust."Post Code";
        "Sell-to County" := Cust.County;
        "Sell-to Country/Region Code" := Cust."Country/Region Code";
        //EFT2.10-01 -
        "Sell-to Phone No." := Cust."Phone No.";
        //EFT2.10-01 +
        IF NOT SkipSellToContact THEN
          "Sell-to Contact" := Cust.Contact;
        "Gen. Bus. Posting Group" := Cust."Gen. Bus. Posting Group";
        "VAT Bus. Posting Group" := Cust."VAT Bus. Posting Group";
        //KW20160621.KK
        //"Tax Area Code" := Cust."Tax Area Code";
        //KW20160621.KK
        //KW20160707.KK
        "Ship-to Address Type" := Cust."Address Type";
        //KW20160707.KK
        //KW20161215.KK
        "Standard Text Code 1" := Cust."Standard Text Code 1";
        "Standard Text Code 2" := Cust."Standard Text Code 2";
        "Standard Text Code 3" := Cust."Standard Text Code 3";
        //KW20161215.KK
        "Tax Liable" := Cust."Tax Liable";
        "Tax Exemption No." := Cust."Tax Exemption No.";
        "VAT Registration No." := Cust."VAT Registration No.";
        "VAT Country/Region Code" := Cust."Country/Region Code";
        "Shipping Advice" := Cust."Shipping Advice";
        "Responsibility Center" := UserSetupMgt.GetRespCenter(0,Cust."Responsibility Center");
        VALIDATE("Location Code",UserSetupMgt.GetLocation(0,Cust."Location Code","Responsibility Center"));

        IF "Sell-to Customer No." = xRec."Sell-to Customer No." THEN
          IF ShippedSalesLinesExist OR ReturnReceiptExist THEN BEGIN
            TESTFIELD("VAT Bus. Posting Group",xRec."VAT Bus. Posting Group");
            TESTFIELD("Gen. Bus. Posting Group",xRec."Gen. Bus. Posting Group");
          END;

        "Sell-to IC Partner Code" := Cust."IC Partner Code";
        "Send IC Document" := ("Sell-to IC Partner Code" <> '') AND ("IC Direction" = "IC Direction"::Outgoing);

        IF Cust."Bill-to Customer No." <> '' THEN
          VALIDATE("Bill-to Customer No.",Cust."Bill-to Customer No.")
        ELSE BEGIN
          IF "Bill-to Customer No." = "Sell-to Customer No." THEN
            SkipBillToContact := TRUE;
          VALIDATE("Bill-to Customer No.","Sell-to Customer No.");
          SkipBillToContact := FALSE;
        END;
        VALIDATE("Ship-to Code",'');

        GetShippingTime(FIELDNO("Sell-to Customer No."));

        IF (xRec."Sell-to Customer No." <> "Sell-to Customer No.") OR
           (xRec."Currency Code" <> "Currency Code") OR
           (xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group") OR
           (xRec."VAT Bus. Posting Group" <> "VAT Bus. Posting Group")
        THEN
          RecreateSalesLines(FIELDCAPTION("Sell-to Customer No."));

        IF NOT SkipSellToContact THEN
          UpdateSellToCont("Sell-to Customer No.");

        //CLN1.00.03 -
        EmailEventMgt.PopulateSalesEmailAddressOnAfterValidateSalesHeaderSellTo(Rec, xRec, CurrFieldNo);
        //CLN1.00.03 +

        //EFT4.00.04 -
        EFTSourceDocMgt.UpdateEFTTransactionsFromSales(Rec, FIELDCAPTION("Sell-to Customer No."), HideValidationDialog);
        //EFT4.00.04 +

        //CLS1.10.00 -
        ShippingEventMgt.PopulateSellToOnAfterValidateSalesHeaderSellToCustomerNo(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 +
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..19
        #25..29
        #34..57
        #61..133
        #137..140
        "Tax Area Code" := Cust."Tax Area Code";
        #152..168
        //>> Shipping
        "External Sell-to No." := Cust."External No.";
        //<< Shipping

        #169..180
        // >> EDI
        CASE Cust."EDI Invoice" OF
          Cust."EDI Invoice"::Always:
            BEGIN
              "EDI Order" := TRUE;
              "EDI Invoice" := TRUE;
            END;
          Cust."EDI Invoice"::Never:
            "EDI Order" := FALSE;
        END;
        // << EDI

        // >> Shipping
        GetCust("Sell-to Customer No.");
        IF Cust."Default Ship-for Code" <> '' THEN
          VALIDATE("Ship-for Code",Cust."Default Ship-for Code");
        // << Shipping

        #181..190
        // iCepts BRB 10.09.09 - Sigma Customer ID Check
        SigmaCustCheck;
        */
        //end;


        //Unsupported feature: Code Modification on ""Bill-to Customer No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);
        BilltoCustomerNoChanged := xRec."Bill-to Customer No." <> "Bill-to Customer No.";
        IF BilltoCustomerNoChanged THEN
          IF xRec."Bill-to Customer No." = '' THEN
            InitRecord
          ELSE BEGIN
            VALIDATE("Credit Card No.",'');
            IF HideValidationDialog OR NOT GUIALLOWED THEN
              Confirmed := TRUE
            ELSE
              Confirmed := CONFIRM(Text004,FALSE,FIELDCAPTION("Bill-to Customer No."));
            IF Confirmed THEN BEGIN
        //EFT3.00.10 -
            EFTTran.SETCURRENTKEY("Document Type", "Document No.");
            EFTTran.SETRANGE("Document Type", "Document Type");
            EFTTran.SETRANGE("Document No.", "No.");
            IF "Bill-to Customer No." = '' THEN BEGIN
              IF NOT EFTTran.ISEMPTY THEN
                ERROR(EFTText003, FIELDCAPTION("Bill-to Customer No."));
            END;
        //EFT3.00.10 +
              SalesLine.SETRANGE("Document Type","Document Type");
              SalesLine.SETRANGE("Document No.","No.");
              IF "Document Type" = "Document Type"::Order THEN
                SalesLine.SETFILTER("Quantity Shipped",'<>0')
              ELSE
                IF "Document Type" = "Document Type"::Invoice THEN
                  SalesLine.SETFILTER("Shipment No.",'<>%1','');

              IF SalesLine.FINDFIRST THEN
                IF "Document Type" = "Document Type"::Order THEN
                  SalesLine.TESTFIELD("Quantity Shipped",0)
                ELSE
                  SalesLine.TESTFIELD("Shipment No.",'');
              SalesLine.SETRANGE("Shipment No.");
              SalesLine.SETRANGE("Quantity Shipped");

              IF "Document Type" = "Document Type"::Order THEN BEGIN
                SalesLine.SETFILTER("Prepmt. Amt. Inv.",'<>0');
                IF SalesLine.FIND('-') THEN
                  SalesLine.TESTFIELD("Prepmt. Amt. Inv.",0);
                SalesLine.SETRANGE("Prepmt. Amt. Inv.");
              END;

              IF "Document Type" = "Document Type"::"Return Order" THEN
                SalesLine.SETFILTER("Return Qty. Received",'<>0')
              ELSE
                IF "Document Type" = "Document Type"::"Credit Memo" THEN
                  SalesLine.SETFILTER("Return Receipt No.",'<>%1','');

              IF SalesLine.FINDFIRST THEN
                IF "Document Type" = "Document Type"::"Return Order" THEN
                  SalesLine.TESTFIELD("Return Qty. Received",0)
                ELSE
                  SalesLine.TESTFIELD("Return Receipt No.",'');
              SalesLine.RESET
            END ELSE
              "Bill-to Customer No." := xRec."Bill-to Customer No.";
          END;

        GetCust("Bill-to Customer No.");
        Cust.CheckBlockedCustOnDocs(Cust,"Document Type",FALSE,FALSE);
        Cust.TESTFIELD("Customer Posting Group");
        CheckCrLimit;
        "Bill-to Customer Template Code" := '';
        "Bill-to Name" := Cust.Name;
        "Bill-to Name 2" := Cust."Name 2";
        "Bill-to Address" := Cust.Address;
        "Bill-to Address 2" := Cust."Address 2";
        "Bill-to City" := Cust.City;
        "Bill-to Post Code" := Cust."Post Code";
        "Bill-to County" := Cust.County;
        "Bill-to Country/Region Code" := Cust."Country/Region Code";
        //EFT2.10-01 -
        "Bill-to Phone No." := Cust."Phone No.";
        //EFT2.10-01 +
        //EFT3.00 -
        "Bill-to Federal ID No." := Cust."Federal ID No.";
        "Bill-to Identification No." := Cust."Identification No.";
        "Bill-to Identification County" := Cust."Identification State";
        //EFT3.00 +
        //EFT4.00.02.15 -
        IF "Document Type" IN ["Document Type"::Order, "Document Type"::Invoice] THEN
          "Electronic Invoice Type" := Cust."Electronic Invoice Type"
        ELSE
          "Electronic Invoice Type" := "Electronic Invoice Type"::None;
        //EFT4.00.02.15 +
        IF NOT SkipBillToContact THEN
          "Bill-to Contact" := Cust.Contact;
        "Payment Terms Code" := Cust."Payment Terms Code";
        "Prepmt. Payment Terms Code" := Cust."Payment Terms Code";

        IF "Document Type" = "Document Type"::"Credit Memo" THEN BEGIN
          "Payment Method Code" := '';
          IF PaymentTerms.GET("Payment Terms Code") THEN
            IF PaymentTerms."Calc. Pmt. Disc. on Cr. Memos" THEN
              "Payment Method Code" := Cust."Payment Method Code"
        END ELSE
          "Payment Method Code" := Cust."Payment Method Code";

        GLSetup.GET;
        IF GLSetup."Bill-to/Sell-to VAT Calc." = GLSetup."Bill-to/Sell-to VAT Calc."::"Bill-to/Pay-to No." THEN BEGIN
          "VAT Bus. Posting Group" := Cust."VAT Bus. Posting Group";
          "VAT Country/Region Code" := Cust."Country/Region Code";
          "VAT Registration No." := Cust."VAT Registration No.";
          "Gen. Bus. Posting Group" := Cust."Gen. Bus. Posting Group";
        END;
        "Customer Posting Group" := Cust."Customer Posting Group";
        "Currency Code" := Cust."Currency Code";
        "Customer Price Group" := Cust."Customer Price Group";
        //KW20170131.KK
        grecCustPriceGroup.GET("Customer Price Group");
        Retail := grecCustPriceGroup.Retail;
        //KW20170131.KK
        "Prices Including VAT" := Cust."Prices Including VAT";
        "Allow Line Disc." := Cust."Allow Line Disc.";
        "Invoice Disc. Code" := Cust."Invoice Disc. Code";
        "Customer Disc. Group" := Cust."Customer Disc. Group";
        "Language Code" := Cust."Language Code";
        "Salesperson Code" := Cust."Salesperson Code";
        "Combine Shipments" := Cust."Combine Shipments";
        Reserve := Cust.Reserve;
        IF "Document Type" = "Document Type"::Order THEN
          "Prepayment %" := Cust."Prepayment %";

        IF NOT BilltoCustomerNoChanged THEN BEGIN
          IF ShippedSalesLinesExist THEN BEGIN
            TESTFIELD("Customer Disc. Group",xRec."Customer Disc. Group");
            TESTFIELD("Currency Code",xRec."Currency Code");
          END;
        END;

        CreateDim(
          DATABASE::Customer,"Bill-to Customer No.",
          DATABASE::"Salesperson/Purchaser","Salesperson Code",
          DATABASE::Campaign,"Campaign No.",
          DATABASE::"Responsibility Center","Responsibility Center",
          DATABASE::"Customer Template","Bill-to Customer Template Code");

        VALIDATE("Payment Terms Code");
        VALIDATE("Prepmt. Payment Terms Code");
        VALIDATE("Payment Method Code");
        VALIDATE("Currency Code");
        VALIDATE("Prepayment %");

        IF (xRec."Sell-to Customer No." = "Sell-to Customer No.") AND
           BilltoCustomerNoChanged
        THEN BEGIN
          RecreateSalesLines(FIELDCAPTION("Bill-to Customer No."));
          BilltoCustomerNoChanged := FALSE;
        END;
        IF NOT SkipBillToContact THEN
          UpdateBillToCont("Bill-to Customer No.");

        "Bill-to IC Partner Code" := Cust."IC Partner Code";
        "Send IC Document" := ("Bill-to IC Partner Code" <> '') AND ("IC Direction" = "IC Direction"::Outgoing);

        //CLN1.00.03 -
        EmailEventMgt.PopulateSalesEmailAddressOnAfterValidateSalesHeaderBillTo(Rec, xRec, CurrFieldNo);
        //CLN1.00.03 +

        //EFT4.00.04 -
        EFTSourceDocMgt.UpdateEFTTransactionsFromSales(Rec, FIELDCAPTION("Bill-to Customer No."), HideValidationDialog);
        //EFT4.00.04 +
        //EFT3.00.13 -
        //EFT4.00.03.01 -
        IF "Account Number" <> '' THEN
          VALIDATE("Account Number", '');
        IF "Routing Number" <> '' THEN
          VALIDATE("Routing Number", '');
        //EFT4.00.03.01 +
        "Expiration Month" := '';
        "Expiration Year" := '';
        //EFT4.00.04.10 -
        "EFT Tender Type" := "EFT Tender Type"::" ";
        //EFT4.00.04.10 +
        VALIDATE("Payment Method Code");
        //EFT3.00.13 +

        //CLS1.10.00 -
        ShippingEventMgt.PopulateBillToOnAfterValidateSalesHeaderBillToCustomerNo(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 +
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..12
        #22..64

        //07.29.09 Add Shipping Day DXD
        "Shipping Day" := Cust."Shipping Day"; //07.29.09 add shipping day
        //iCepts 08.12.09 dxd Populate Broker Code
        "Broker Code" := Cust."Broker Code"; // 08.12.09 Broker Code
        //12.28.09 Cust Service Rep DXD Icepts1.07
        "Cust Service Rep" := Cust."Cust Service Rep";
        //12.28.09 Cust Service Rep
        //01.08.10 iCepts1.08 DXD Add Shelf Life
        "Shelf Life" := Cust."Shelf Life";// 01.08.10 dxd

        #65..73
        #88..110
        #115..156
        */
        //end;

        //Unsupported feature: Deletion on ""Your Reference"(Field 11).OnValidate".



        //Unsupported feature: Code Modification on ""Ship-to Code"(Field 12).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Document Type" = "Document Type"::Order) AND
           (xRec."Ship-to Code" <> "Ship-to Code")
        THEN BEGIN
          SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::Order);
          SalesLine.SETRANGE("Document No.","No.");
          SalesLine.SETFILTER("Purch. Order Line No.",'<>0');
          IF NOT SalesLine.ISEMPTY THEN
            ERROR(
              Text006,
              FIELDCAPTION("Ship-to Code"));
          SalesLine.RESET;
        END;

        //EFT4.00.04 -
        EFTSourceDocMgt.UpdateEFTTransactionsFromSales(Rec, FIELDCAPTION("Ship-to Code"), HideValidationDialog);
        //EFT4.00.04 +

        IF ("Document Type" <> "Document Type"::"Return Order") AND
           ("Document Type" <> "Document Type"::"Credit Memo")
        THEN
          IF "Ship-to Code" <> '' THEN BEGIN
            IF xRec."Ship-to Code" <> '' THEN
              BEGIN
              GetCust("Sell-to Customer No.");
              IF Cust."Location Code" <> '' THEN
                VALIDATE("Location Code",Cust."Location Code");
        //KW20160621.KK
        //      "Tax Area Code" := Cust."Tax Area Code";
        //KW20160621.KK
            END;
            ShipToAddr.GET("Sell-to Customer No.","Ship-to Code");
            "Ship-to Name" := ShipToAddr.Name;
            "Ship-to Name 2" := ShipToAddr."Name 2";
            "Ship-to Address" := ShipToAddr.Address;
            "Ship-to Address 2" := ShipToAddr."Address 2";
            "Ship-to City" := ShipToAddr.City;
            "Ship-to Post Code" := ShipToAddr."Post Code";
        //KW20160621.KK
        //    "Ship-to County" := ShipToAddr.County;
            VALIDATE("Ship-to County", ShipToAddr.County);
        //KW20160621.KK
        //KW20160707.KK
            VALIDATE("Ship-to Address Type", ShipToAddr."Address Type");
        //KW20160707.KK
        //EFT2.10-01 -
            "Ship-to Phone No." := ShipToAddr."Phone No.";
        //EFT2.10-01 +
            VALIDATE("Ship-to Country/Region Code",ShipToAddr."Country/Region Code");
        //KW20170213.KK
        //    "Ship-to Contact" := ShipToAddr.Contact;
            IF ShipToAddr.Contact <>'' THEN
              "Ship-to Contact" := ShipToAddr.Contact
            ELSE
              "Ship-to Contact" := ShipToAddr.Name;
        //KW20170213.KK
            "Shipment Method Code" := ShipToAddr."Shipment Method Code";
            IF ShipToAddr."Location Code" <> '' THEN
              VALIDATE("Location Code",ShipToAddr."Location Code");
            "Shipping Agent Code" := ShipToAddr."Shipping Agent Code";
            "Shipping Agent Service Code" := ShipToAddr."Shipping Agent Service Code";
        //KW20160616.KK
        //    IF ShipToAddr."Tax Area Code" <> '' THEN
        //      "Tax Area Code" := ShipToAddr."Tax Area Code";
        //KW20160616.KK
            "Tax Liable" := ShipToAddr."Tax Liable";
          END ELSE
            IF "Sell-to Customer No." <> '' THEN BEGIN
              GetCust("Sell-to Customer No.");
              "Ship-to Name" := Cust.Name;
              "Ship-to Name 2" := Cust."Name 2";
              "Ship-to Address" := Cust.Address;
              "Ship-to Address 2" := Cust."Address 2";
              "Ship-to City" := Cust.City;
              "Ship-to Post Code" := Cust."Post Code";
        //KW20160621.KK
        //      "Ship-to County" := Cust.County;
              VALIDATE("Ship-to County", Cust.County);
        //KW20160621.KK
        //EFT2.10-01 -
              "Ship-to Phone No." := Cust."Phone No.";
        //EFT2.10-01 +
              VALIDATE("Ship-to Country/Region Code",Cust."Country/Region Code");
        //KW20170213.KK
        //      "Ship-to Contact" := Cust.Contact;
              "Ship-to Contact" := Cust.Name;
        //KW20170213.KK
              "Shipment Method Code" := Cust."Shipment Method Code";
              IF NOT SellToCustTemplate.GET("Sell-to Customer Template Code") THEN BEGIN
        //KW20160616.KK
        //                "Tax Area Code" := Cust."Tax Area Code";
        //KW20160616.KK
                "Tax Liable" := Cust."Tax Liable";
              END;
              IF Cust."Location Code" <> '' THEN
                VALIDATE("Location Code",Cust."Location Code");
              "Shipping Agent Code" := Cust."Shipping Agent Code";
              "Shipping Agent Service Code" := Cust."Shipping Agent Service Code";
            END;

        GetShippingTime(FIELDNO("Ship-to Code"));

        IF (xRec."Sell-to Customer No." = "Sell-to Customer No.") AND
           (xRec."Ship-to Code" <> "Ship-to Code")
        THEN
          IF (xRec."VAT Country/Region Code" <> "VAT Country/Region Code") OR
             (xRec."Tax Area Code" <> "Tax Area Code")
          THEN
            RecreateSalesLines(FIELDCAPTION("Ship-to Code"))
          ELSE BEGIN
            IF xRec."Shipping Agent Code" <> "Shipping Agent Code" THEN
              MessageIfSalesLinesExist(FIELDCAPTION("Shipping Agent Code"));
            IF xRec."Shipping Agent Service Code" <> "Shipping Agent Service Code" THEN
              MessageIfSalesLinesExist(FIELDCAPTION("Shipping Agent Service Code"));
            IF xRec."Tax Liable" <> "Tax Liable" THEN
              VALIDATE("Tax Liable");
          END;

        //CLN1.00.03 -
        EmailEventMgt.PopulateSalesEmailAddressOnAfterValidateSalesHeaderShipTo(Rec, xRec, CurrFieldNo);
        //CLN1.00.03 +

        //CLS1.10.00 -
        ShippingEventMgt.PopulateShipToOnAfterValidateSalesHeaderShipToCode(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 +
        //KW20170216.KK
        VALIDATE("Ship-to Country/Region Code");
        //KW20170216.KK
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..11

          // iCepts BRB 12.18.13 - Give error if going to CFS and Ship-to Code changed :START
          IF ("Location Code" = 'FB') OR ("Location Code" = 'FB-DENVER') OR ("Location Code" = 'FB-ATLYK')
            THEN BEGIN
            MESSAGE('You need to Manually change the CFS order');
          END;
          // iCepts BRB 12.18.13 - Give error if going to CFS and Ship-to Code changed :END

          // iCepts WRW 11.21.14 - Display CAT2 "Shipto Code" change message  - Start
          IF NOT Location2.GET("Location Code") THEN
            CLEAR(Location2);
          IF Location2.DownloadToCAT2 THEN BEGIN
            // iCepts WRW 12.09.14 - Suppress Display CAT2 "Shipto Code" change message when creating from EDI routine
            IF NOT(FromEDICreateSalesOrder) AND NOT("Location Code" = 'FB') AND NOT("Location Code" = 'FB-DENVER')
            AND NOT("Location Code" = 'FB-ATLYK') THEN
              MESSAGE('Ship to change.  You need to manually change CAT order');
          END;
          // iCepts WRW 11.21.14 - Display CAT2 "Shipto Code" change message - End

        END;
        #17..26
              "Tax Area Code" := Cust."Tax Area Code";
        #30..37
            "Ship-to County" := ShipToAddr.County;
            VALIDATE("Ship-to Country/Region Code",ShipToAddr."Country/Region Code");
            "Ship-to Contact" := ShipToAddr.Contact;
        #56..58

          // >> Shipping
          // "Shipping Agent Code" := ShipToAddr."Shipping Agent Code";
          IF ShipToAddr."Shipping Agent Code" <> '' THEN BEGIN
            VALIDATE("Shipping Agent Code",ShipToAddr."Shipping Agent Code");
            IF ShipToAddr."E-Ship Agent Service" <> '' THEN
              VALIDATE("E-Ship Agent Service",ShipToAddr."E-Ship Agent Service");
          END;
          "Shipping Payment Type" := ShipToAddr."Shipping Payment Type";
          "Shipping Insurance" := ShipToAddr."Shipping Insurance";
          IF "Shipping Payment Type" = "Shipping Payment Type"::Prepaid THEN
            VALIDATE("Third Party Ship. Account No.",'')
          ELSE
            IF ShippingAccount.GetPrimaryShippingAccountNo(
                 "Shipping Agent Code",ShippingAccount."Ship-to Type"::Customer,
                 "Sell-to Customer No.","Ship-to Code")
            THEN
              VALIDATE("Third Party Ship. Account No.",ShippingAccount."Account No.");
          IF NOT "Free Freight" THEN BEGIN
            "Free Freight" := ShipToAddr."Free Freight";
            "No Free Freight Lines on Order" := ShipToAddr."No Free Freight Lines on Order";
          END;
          "Residential Delivery" := ShipToAddr."Residential Delivery";
          "Blind Shipment" := ShipToAddr."Blind Shipment";
          "Double Blind Shipment" := ShipToAddr."Double Blind Shipment";
          VALIDATE("Double Blind Ship-from Cust No",ShipToAddr."Double Blind Ship-from Cust No");
          "External Ship-to No." := ShipToAddr."External No.";
          // << Shipping

            "Shipping Agent Service Code" := ShipToAddr."Shipping Agent Service Code";
            IF ShipToAddr."Tax Area Code" <> '' THEN
              "Tax Area Code" := ShipToAddr."Tax Area Code";
        #65..74
              "Ship-to County" := Cust.County;
              VALIDATE("Ship-to Country/Region Code",Cust."Country/Region Code");
              "Ship-to Contact" := Cust.Contact;
              "Shipment Method Code" := Cust."Shipment Method Code";
              IF NOT SellToCustTemplate.GET("Sell-to Customer Template Code") THEN BEGIN
                "Tax Area Code" := Cust."Tax Area Code";
        #92..95

            // >> Shipping
            // "Shipping Agent Code" := Cust."Shipping Agent Code";
            "Residential Delivery" := Cust."Residential Delivery";
            IF Cust."Shipping Agent Code" <> '' THEN BEGIN
              VALIDATE("Shipping Agent Code",Cust."Shipping Agent Code");
              IF Cust."E-Ship Agent Service" <> '' THEN
                VALIDATE("E-Ship Agent Service",Cust."E-Ship Agent Service");
            END;
            "Shipping Payment Type" := Cust."Shipping Payment Type";
            "Shipping Insurance" := Cust."Shipping Insurance";
            IF "Shipping Payment Type" = "Shipping Payment Type"::Prepaid THEN
              VALIDATE("Third Party Ship. Account No.",'')
            ELSE
              IF ShippingAccount.GetPrimaryShippingAccountNo(
                   "Shipping Agent Code",ShippingAccount."Ship-to Type"::Customer,
                   "Sell-to Customer No.","Ship-to Code")
              THEN
                VALIDATE("Third Party Ship. Account No.",ShippingAccount."Account No.");
            IF NOT "Free Freight" THEN BEGIN
              "Free Freight" := Cust."Free Freight";
              "No Free Freight Lines on Order" := Cust."No Free Freight Lines on Order";
            END;
            "Residential Delivery" := Cust."Residential Delivery";
            "Blind Shipment" := Cust."Blind Shipment";
            "Double Blind Shipment" := Cust."Double Blind Shipment";
            VALIDATE("Double Blind Ship-from Cust No",Cust."Double Blind Ship-from Cust No");
            "External Ship-to No." := Cust."External No.";
            // << Shipping

        #97..117
        // iCepts BRB 10.09.09 - Sigma Customer ID Check
        SigmaCustCheck;
        */
        //end;

        //Unsupported feature: Deletion on ""Ship-to Name"(Field 13).OnValidate".


        //Unsupported feature: Deletion on ""Ship-to Address"(Field 15).OnValidate".


        //Unsupported feature: Deletion on ""Ship-to Address 2"(Field 16).OnValidate".



        //Unsupported feature: Code Modification on ""Ship-to City"(Field 17).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PostCode.ValidateCity(
          "Ship-to City","Ship-to Post Code","Ship-to County","Ship-to Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);

        //KW20170414.KK
        VALIDATE("Ship-to Country/Region Code");
        //KW20170414.KK

        //CLS1.10.00 -
        ShippingEventMgt.InvalidateFreightCalcOnAfterValidateSalesHeaderShipToCity(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 +
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PostCode.ValidateCity(
          "Ship-to City","Ship-to Post Code","Ship-to County","Ship-to Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
        */
        //end;


        //Unsupported feature: Code Modification on ""Shipment Date"(Field 21).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        UpdateSalesLines(FIELDCAPTION("Shipment Date"),CurrFieldNo <> 0);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //UpdateSalesLines(FIELDCAPTION("Shipment Date"),CurrFieldNo <> 0);  //06.23.15DXD
        UpdateSalesLines(FIELDCAPTION("Shipment Date"),FALSE);//06.23.15 DXD was CurrFieldNo <>0
        */
        //end;


        //Unsupported feature: Code Modification on ""Payment Terms Code"(Field 23).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Payment Terms Code" <> '') AND ("Document Date" <> 0D) THEN BEGIN
          PaymentTerms.GET("Payment Terms Code");
          IF (("Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"]) AND
        #4..23
            "Prepayment Due Date" := CALCDATE(PaymentTerms."Due Date Calculation","Document Date");
          VALIDATE("Prepmt. Payment Terms Code","Payment Terms Code");
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..26
        // >> Shipping
        IF PaymentTerms.GET("Payment Terms Code") THEN BEGIN
          "COD Payment" := PaymentTerms."COD Payment";
          "COD Cashiers Check" := PaymentTerms."COD Cashiers Check";
        END ELSE BEGIN
          "COD Payment" := FALSE;
          "COD Cashiers Check" := FALSE;
        END;

        // << Shipping
        */
        //end;

        //Unsupported feature: Property Deletion (Description) on ""Payment Terms Code"(Field 23)".



        //Unsupported feature: Code Modification on ""Location Code"(Field 28).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);
        IF ("Location Code" <> xRec."Location Code") AND
           (xRec."Sell-to Customer No." = "Sell-to Customer No.")
        THEN
          MessageIfSalesLinesExist(FIELDCAPTION("Location Code"));

        UpdateShipToAddress;

        #9..13
            "Outbound Whse. Handling Time" := InvtSetup."Outbound Whse. Handling Time";
        END;

        //CLS1.10.00 -
        ShippingEventMgt.SetDefaultCarrierTypeOnAfterValidateSalesHeaderLocationCode(Rec, xRec, CurrFieldNo);
        ShippingEventMgt.UpdateShipToOnAfterValidateSalesHeaderLocationCode(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 +
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);
        { // iCepts BRB 10.20.10 - Do not show message, update lines :START
        #2..5
        // iCepts BRB 10.20.10 - Do not show message, update lines :END}
        #6..16
        // iCepts BRB 10.22.09 - Message if changed from NEWOX to another location
        IF (xRec."Location Code" = 'NEWOX') AND ("Location Code" <> 'NEWOX') THEN
          MESSAGE('Location Changed\Make sure you manually change/delete the Sigma Order');

        // iCepts BRB 10.20.10 - Update Location code on lines
        UpdateSalesLines(FIELDCAPTION("Location Code"),FALSE);
        */
        //end;


        //Unsupported feature: Code Modification on ""Salesperson Code"(Field 43).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalEntry.SETRANGE("Table ID",DATABASE::"Sales Header");
        ApprovalEntry.SETRANGE("Document Type","Document Type");
        ApprovalEntry.SETRANGE("Document No.","No.");
        #4..10
          DATABASE::Campaign,"Campaign No.",
          DATABASE::"Responsibility Center","Responsibility Center",
          DATABASE::"Customer Template","Bill-to Customer Template Code");

        //CLN1.00.03 -
        EmailEventMgt.PopulateSalesEmailAddressOnAfterValidateSalesHeaderSalesperson(Rec, xRec, CurrFieldNo);
        //CLN1.00.03 +
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..13
        */
        //end;

        //Unsupported feature: Deletion on ""On Hold"(Field 51).OnValidate".


        //Unsupported feature: Property Deletion (TableRelation) on ""On Hold"(Field 51)".


        //Unsupported feature: Property Deletion (Description) on ""On Hold"(Field 51)".



        //Unsupported feature: Code Modification on ""Bal. Account No."(Field 55).OnValidate".

        //trigger  Account No()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Bal. Account No." <> '' THEN
          CASE "Bal. Account Type" OF
            "Bal. Account Type"::"G/L Account":
              BEGIN
                GLAcc.GET("Bal. Account No.");
                GLAcc.CheckGLAcc;
                GLAcc.TESTFIELD("Direct Posting",TRUE);
              END;
            "Bal. Account Type"::"Bank Account":
              BEGIN
                BankAcc.GET("Bal. Account No.");
                BankAcc.TESTFIELD(Blocked,FALSE);
                BankAcc.TESTFIELD("Currency Code","Currency Code");
              END;
          END;
        //EFT3.00.07 -
        IF "Bal. Account No." <> '' THEN BEGIN
          CALCFIELDS("Net Amount Settled (LCY)", "Net Amount Authorized (LCY)");
          TESTFIELD("Net Amount Settled (LCY)", 0);
          TESTFIELD("Net Amount Authorized (LCY)", 0);
        //EFT4.00.04 -
          IF CheckEFTPermission THEN BEGIN
        //EFT4.00.04 +
            EFTTran.SETCURRENTKEY("Document Type", "Document No.");
            EFTTran.SETRANGE("Document Type", "Document Type");
            EFTTran.SETRANGE("Document No.", "No.");
            EFTTran.SETRANGE("Transaction Status", EFTTran."Transaction Status"::"0", EFTTran."Transaction Status"::"2");
            IF NOT EFTTran.ISEMPTY THEN
              FIELDERROR("Bal. Account No.", EFTText002);
          END;
        END;
        //EFT3.00.07 +
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..15
        */
        //end;


        //Unsupported feature: Code Modification on ""Ship-to Post Code"(Field 91).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PostCode.ValidatePostCode(
          "Ship-to City","Ship-to Post Code","Ship-to County","Ship-to Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);

        //KW20170414.KK
        VALIDATE("Ship-to Country/Region Code");
        //KW20170414.KK

        //CLS1.10.00 -
        ShippingEventMgt.InvalidateFreightCalcOnAfterValidateSalesHeaderShipToPostCode(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 +
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PostCode.ValidatePostCode(
          "Ship-to City","Ship-to Post Code","Ship-to County","Ship-to Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
        */
        //end;

        //Unsupported feature: Deletion on ""Ship-to County"(Field 92).OnValidate".



        //Unsupported feature: Code Modification on ""Ship-to Country/Region Code"(Field 93).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        //CLS1.10.00 -
        ShippingEventMgt.InvalidateFreightCalcOnAfterValidateSalesHeaderShipToCountry(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 +
        //KW20170213.KK
        IF Rec."Ship-to Country/Region Code" <> xRec."Ship-to Country/Region Code" THEN BEGIN
          grecCustomer.GET("Sell-to Customer No.");
          IF grecCountry.GET("Ship-to Country/Region Code") THEN BEGIN
            IF grecCountry."Shipping Agent Code" <>'' THEN BEGIN
              "Shipping Agent Code" := grecCountry."Shipping Agent Code";
              "Shipping Agent Service" := grecCountry."Shipping Agent Service Code";
            END ELSE BEGIN
              "Shipping Agent Code" := grecCustomer."Shipping Agent Code";
              "Shipping Agent Service" := grecCustomer."Shipping Agent Service Code";
            END;
            IF grecCountry."Ship Complete" = TRUE THEN
              "Shipping Advice" := "Shipping Advice"::Complete
            ELSE
              "Shipping Advice" := "Shipping Advice"::Partial;
          END ELSE BEGIN
            "Shipping Agent Code" := grecCustomer."Shipping Agent Code";
            "Shipping Agent Service" := grecCustomer."Shipping Agent Service Code";
            "Shipping Advice" := grecCustomer."Shipping Advice";
          END;
        END;
        //KW20170213.KK
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        // >> Shipping
        IF "Ship-to Country/Region Code" <> xRec."Ship-to Country/Region Code" THEN
          IF "Shipping Agent Code" <> '' THEN BEGIN
            xRec."Shipping Agent Code" := '';
            VALIDATE("Shipping Agent Code");
          END;
        // << Shipping
        */
        //end;


        //Unsupported feature: Code Insertion on ""External Document No."(Field 100)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        // iCepts BRB 07.14.09 - check for Duplicate External Document No.
        CheckDuplicateExtDocNo;

        // iCepts BRB 10.20.09 - Update SigmaLines when PO changed
        // iCepts BRB 01.16.12 - Only send to Sigma on Release
        {
        IF "External Document No." <> xRec."External Document No." THEN BEGIN
          SalesLine.RESET;
          SalesLine.SETRANGE("Document Type","Document Type");
          SalesLine.SETRANGE("Document No.","No.");
          IF SalesLine.FINDSET THEN BEGIN
            REPEAT
              SalesLine.SendToSigma(FALSE);
            UNTIL SalesLine.NEXT = 0;
          END;
        END;
        }
        */
        //end;


        //Unsupported feature: Code Modification on ""Payment Method Code"(Field 104).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF DOPaymentTransLogEntry.FINDFIRST THEN
          DOPaymentTransLogMgt.ValidateHasNoValidTransactions("Document Type",FORMAT("Document Type"),"No.");
        IF DOPaymentMgt.IsValidPaymentMethod(xRec."Payment Method Code") AND NOT DOPaymentMgt.IsValidPaymentMethod("Payment Method Code")
        THEN
          TESTFIELD("Credit Card No.",'');
        PaymentMethod.INIT;
        IF "Payment Method Code" <> '' THEN
          PaymentMethod.GET("Payment Method Code");
        IF PaymentMethod."Direct Debit" THEN BEGIN
          IF "Direct Debit Mandate ID" = '' THEN
            "Direct Debit Mandate ID" := SEPADirectDebitMandate.GetDefaultMandate("Bill-to Customer No.","Due Date");
          IF "Payment Terms Code" = '' THEN
            "Payment Terms Code" := PaymentMethod."Direct Debit Pmt. Terms Code";
        END;
        "Bal. Account Type" := PaymentMethod."Bal. Account Type";
        "Bal. Account No." := PaymentMethod."Bal. Account No.";
        //EFT3.00.07 -
        IF "Bal. Account No." <> '' THEN BEGIN
          CALCFIELDS("Net Amount Settled (LCY)", "Net Amount Authorized (LCY)");
          TESTFIELD("Net Amount Settled (LCY)", 0);
          TESTFIELD("Net Amount Authorized (LCY)", 0);
        //EFT4.00.04 -
          IF CheckEFTPermission THEN BEGIN
        //EFT4.00.04 +
            EFTTran.SETCURRENTKEY("Document Type", "Document No.");
            EFTTran.SETRANGE("Document Type", "Document Type");
            EFTTran.SETRANGE("Document No.", "No.");
            EFTTran.SETRANGE("Transaction Status", EFTTran."Transaction Status"::"0", EFTTran."Transaction Status"::"2");
            IF NOT EFTTran.ISEMPTY THEN
              FIELDERROR("Bal. Account No.", EFTText002);
          END;
        END;
        //EFT3.00.07 +
        //EFT4.00.03.01 -
        IF PaymentMethod."EFT Tender Type" <> "EFT Tender Type" THEN
          VALIDATE("EFT Tender Type", PaymentMethod."EFT Tender Type");
        //EFT4.00.03.01 +
        IF "Bal. Account No." <> '' THEN BEGIN
          TESTFIELD("Applies-to Doc. No.",'');
          TESTFIELD("Applies-to ID",'');
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..16
        #38..41
        */
        //end;


        //Unsupported feature: Code Modification on ""Shipping Agent Code"(Field 105).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);
        IF xRec."Shipping Agent Code" = "Shipping Agent Code" THEN
          EXIT;

        "Shipping Agent Service Code" := '';
        GetShippingTime(FIELDNO("Shipping Agent Code"));
        UpdateSalesLines(FIELDCAPTION("Shipping Agent Code"),CurrFieldNo <> 0);

        //CLS1.10.00 -
        ShippingEventMgt.InitFieldsOnAfterValidateSalesHeaderShippingAgentCode(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 -
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..7
        // >> Shipping
        SalesSetup.GET;
        IF ("Shipping Agent Code" <> xRec."Shipping Agent Code") AND
           (xRec."Shipping Agent Code" <> '') AND SalesSetup."Enable Shipping"
        THEN BEGIN
          IF CurrFieldNo = FIELDNO("Shipping Agent Code") THEN BEGIN
            DeleteShippingAgentOptionPage;

            Package.RESET;
            Package.SETCURRENTKEY("Source Type","Source Subtype","Source ID");
            Package.SETRANGE("Source Type",DATABASE::"Sales Header");
            Package.SETRANGE("Source Subtype","Document Type");
            Package.SETRANGE("Source ID","No.");
            IF Package.FIND('-') THEN
              MESSAGE(Text14000701);
          END;

          VALIDATE("E-Ship Agent Service",'');
        END;

        IF ("Shipping Agent Code" <> '') AND SalesSetup."Enable Shipping" THEN BEGIN
          ShippingAgent.GET("Shipping Agent Code");
          "World Wide Service" :=
             EShipAgentService.WorldWideService(ShippingAgent,"Ship-to Country/Region Code");
          VALIDATE(
            "E-Ship Agent Service",
            EShipAgentService.DefaultShipAgentService(ShippingAgent,"Ship-to Country/Region Code"));

          IF CurrFieldNo = FIELDNO("Shipping Agent Code") THEN
            EShipAgentService.CheckNameAddressSalesHeader(Rec,"Shipping Agent Code");
        END ELSE
          "World Wide Service" := FALSE;

        IF "Shipping Agent Code" <> xRec."Shipping Agent Code" THEN
          IF "Shipping Payment Type" = "Shipping Payment Type"::Prepaid THEN
            VALIDATE("Third Party Ship. Account No.",'')
          ELSE
            IF ShippingAccount.GetPrimaryShippingAccountNo(
                 "Shipping Agent Code",ShippingAccount."Ship-to Type"::Customer,
                 "Sell-to Customer No.","Ship-to Code")
            THEN
              VALIDATE("Third Party Ship. Account No.",ShippingAccount."Account No.")
            ELSE
              VALIDATE("Third Party Ship. Account No.",'');
        // << Shipping
        */
        //end;


        //Unsupported feature: Code Modification on ""VAT Base Discount %"(Field 119).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF NOT (CurrFieldNo IN [0,FIELDNO("Posting Date"),FIELDNO("Document Date")]) THEN
          TESTFIELD(Status,Status::Open);
        GLSetup.GET;
        #4..32
          UNTIL SalesLine.NEXT = 0;
        END;
        SalesLine.RESET;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        // >> EDI
        IF EDITemp THEN
          EXIT;
        // << EDI

        #1..35
        */
        //end;


        //Unsupported feature: Code Modification on ""Sell-to Contact No."(Field 5052).OnValidate".

        //trigger "(Field 5052)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);

        IF ("Sell-to Contact No." <> xRec."Sell-to Contact No.") AND
        #4..67
        END;

        UpdateSellToCust("Sell-to Contact No.");
        //CLS1.10.00 -
        ShippingEventMgt.InvalidateFreightCalcOnAfterValidateSalesHeaderSellToContactNo(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 +
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..70
        */
        //end;


        //Unsupported feature: Code Modification on ""Bill-to Customer Template Code"(Field 5054).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Document Type","Document Type"::Quote);
        TESTFIELD(Status,Status::Open);

        #4..55
          "Customer Price Group" := BillToCustTemplate."Customer Price Group";
          "Customer Disc. Group" := BillToCustTemplate."Customer Disc. Group";
          "Allow Line Disc." := BillToCustTemplate."Allow Line Disc.";
        //KW20160616.KK
        //    "Tax Area Code" := BillToCustTemplate."Tax Area Code";
        //KW20160616.KK
            "Tax Liable" := BillToCustTemplate."Tax Liable";
          VALIDATE("Payment Terms Code",BillToCustTemplate."Payment Terms Code");
          VALIDATE("Payment Method Code",BillToCustTemplate."Payment Method Code");
          "Shipment Method Code" := BillToCustTemplate."Shipment Method Code";
        #66..76
           (xRec."Bill-to Customer Template Code" <> "Bill-to Customer Template Code")
        THEN
          RecreateSalesLines(FIELDCAPTION("Bill-to Customer Template Code"));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..58
          "Tax Area Code" := BillToCustTemplate."Tax Area Code";
          "Tax Liable" := BillToCustTemplate."Tax Liable";
        #63..79
        */
        //end;


        //Unsupported feature: Code Modification on ""Responsibility Center"(Field 5700).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);
        IF NOT UserSetupMgt.CheckRespCenter(0,"Responsibility Center") THEN
          ERROR(
        #4..25
          RecreateSalesLines(FIELDCAPTION("Responsibility Center"));
          "Assigned User ID" := '';
        END;

        //CLS1.10.00 -
        ShippingEventMgt.UpdateShipToOnAfterValidateSalesHeaderResponsibilityCenter(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 +
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..28
        */
        //end;


        //Unsupported feature: Code Modification on ""Shipping Advice"(Field 5750).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);
        IF InventoryPickConflict("Document Type","No.","Shipping Advice") THEN
          ERROR(Text066,FIELDCAPTION("Shipping Advice"),FORMAT("Shipping Advice"),TABLECAPTION);
        IF WhseShpmntConflict("Document Type","No.","Shipping Advice") THEN
          ERROR(STRSUBSTNO(Text070,FIELDCAPTION("Shipping Advice"),FORMAT("Shipping Advice"),TABLECAPTION));
        WhseSourceHeader.SalesHeaderVerifyChange(Rec,xRec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..6

        // >> EDI
        IF NOT RunFromEDI THEN
        // << EDI (Missing Indentation)
        WhseSourceHeader.SalesHeaderVerifyChange(Rec,xRec);
        */
        //end;


        //Unsupported feature: Code Modification on ""Shipping Agent Service Code"(Field 5794).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);
        GetShippingTime(FIELDNO("Shipping Agent Service Code"));
        UpdateSalesLines(FIELDCAPTION("Shipping Agent Service Code"),CurrFieldNo <> 0);

        //CLS1.10.00 -
        ShippingEventMgt.CheckOptionsOnAfterValidateSalesHeaderShippingAgentServiceCode(Rec, xRec, CurrFieldNo);
        //CLS1.10.00 +
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        */
        //end;

        //Unsupported feature: Property Deletion (InitValue) on ""Prepmt. Include Tax"(Field 12600)".


        //Unsupported feature: Property Deletion (TableRelation) on ""Car Year 1"(Field 50000)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Car Year 1"(Field 50000)".


        //Unsupported feature: Property Deletion (Description) on ""Car Year 1"(Field 50000)".


        //Unsupported feature: Property Deletion (TableRelation) on ""Car Year 2"(Field 50001)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Car Year 2"(Field 50001)".


        //Unsupported feature: Property Deletion (Description) on ""Car Year 2"(Field 50001)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Car Year 3"(Field 50002)".


        //Unsupported feature: Property Deletion (Description) on ""Car Year 3"(Field 50002)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Car Year 4"(Field 50003)".


        //Unsupported feature: Property Deletion (Description) on ""Car Year 4"(Field 50003)".


        //Unsupported feature: Property Deletion (TableRelation) on ""Car Year 5"(Field 50004)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Car Year 5"(Field 50004)".


        //Unsupported feature: Property Deletion (CaptionML) on ""On Hold Datetime"(Field 50005)".


        //Unsupported feature: Property Deletion (Description) on ""On Hold Datetime"(Field 50005)".


        //Unsupported feature: Property Deletion (Editable) on ""On Hold Datetime"(Field 50005)".


        //Unsupported feature: Deletion (FieldCollection) on ""On Hold User ID"(Field 50006)".


        //Unsupported feature: Deletion (FieldCollection) on ""Datetime Added"(Field 50007)".


        //Unsupported feature: Deletion (FieldCollection) on ""Added By User ID"(Field 50008)".


        //Unsupported feature: Deletion (FieldCollection) on ""Priority Code"(Field 50009)".


        //Unsupported feature: Deletion (FieldCollection) on ""Marketplace Order No."(Field 50011)".


        //Unsupported feature: Deletion (FieldCollection) on ""Type of Sale"(Field 50012)".


        //Unsupported feature: Deletion (FieldCollection) on ""Accellos Priority Code"(Field 50013)".


        //Unsupported feature: Deletion (FieldCollection) on ""Datetime Modified"(Field 50014)".


        //Unsupported feature: Deletion (FieldCollection) on ""Modified By User ID"(Field 50015)".


        //Unsupported feature: Deletion (FieldCollection) on ""Standard Text Code 1"(Field 50017)".


        //Unsupported feature: Deletion (FieldCollection) on ""Standard Text Code 2"(Field 50018)".


        //Unsupported feature: Deletion (FieldCollection) on ""Standard Text Code 3"(Field 50019)".


        //Unsupported feature: Deletion (FieldCollection) on ""No. of Hazardous Items"(Field 50026)".


        //Unsupported feature: Deletion (FieldCollection) on ""Add Freight Charge"(Field 50027)".


        //Unsupported feature: Deletion (FieldCollection) on ""Red Hot Rush"(Field 50029)".


        //Unsupported feature: Deletion (FieldCollection) on ""No. of Freight Lines"(Field 50030)".


        //Unsupported feature: Deletion (FieldCollection) on ""Last Sent to Accellos Date"(Field 50034)".


        //Unsupported feature: Deletion (FieldCollection) on ""Shipment Type"(Field 50035)".


        //Unsupported feature: Deletion (FieldCollection) on ""Qty. To Pick"(Field 50036)".


        //Unsupported feature: Deletion (FieldCollection) on ""Currently In Accellos"(Field 50037)".


        //Unsupported feature: Deletion (FieldCollection) on ""Ship-to Attention"(Field 50038)".


        //Unsupported feature: Deletion (FieldCollection) on ""Final Invoice"(Field 50039)".


        //Unsupported feature: Deletion (FieldCollection) on ""Discount Code"(Field 50040)".


        //Unsupported feature: Deletion (FieldCollection) on ""Applied Gift Cert. Amount"(Field 50041)".


        //Unsupported feature: Deletion (FieldCollection) on "Retail(Field 50042)".


        //Unsupported feature: Deletion (FieldCollection) on ""Accellos Packslip No."(Field 50043)".


        //Unsupported feature: Deletion (FieldCollection) on ""Hold Order Over Time Approved"(Field 50044)".


        //Unsupported feature: Deletion (FieldCollection) on ""Credit Hold Approved"(Field 50045)".


        //Unsupported feature: Deletion (FieldCollection) on ""Past Due Approved"(Field 50046)".


        //Unsupported feature: Deletion (FieldCollection) on ""OK to Mail"(Field 50047)".


        //Unsupported feature: Deletion (FieldCollection) on ""Picking Status"(Field 50048)".


        //Unsupported feature: Deletion (FieldCollection) on ""Customer Flag Box"(Field 50049)".


        //Unsupported feature: Deletion (FieldCollection) on ""Invoice Royalty Amount"(Field 50053)".


        //Unsupported feature: Deletion (FieldCollection) on ""Invoice Duty Amount"(Field 50054)".


        //Unsupported feature: Deletion (FieldCollection) on ""Actual Shipping Agent Code"(Field 50055)".


        //Unsupported feature: Deletion (FieldCollection) on ""Actual Shipping Agent Service"(Field 50056)".


        //Unsupported feature: Deletion (FieldCollection) on ""Exclude from Usage"(Field 70551)".


        //Unsupported feature: Deletion (FieldCollection) on ""Unique Webshop Document Id"(Field 11123399)".


        //Unsupported feature: Deletion (FieldCollection) on ""Net Amount Authorized (LCY)"(Field 37028300)".


        //Unsupported feature: Deletion (FieldCollection) on ""Expiration Filter"(Field 37028303)".


        //Unsupported feature: Deletion (FieldCollection) on ""Net Amt. to Auth.-Sale (LCY)"(Field 37028305)".


        //Unsupported feature: Deletion (FieldCollection) on ""Net Amt. Authorized-Sale (LCY)"(Field 37028306)".


        //Unsupported feature: Deletion (FieldCollection) on ""Net Amt. Auth. On Hold (LCY)"(Field 37028311)".


        //Unsupported feature: Deletion (FieldCollection) on ""Net Amount to Authorize (LCY)"(Field 37028312)".


        //Unsupported feature: Deletion (FieldCollection) on ""Net Amt. to Settle-Sale (LCY)"(Field 37028314)".


        //Unsupported feature: Deletion (FieldCollection) on ""Net Amount to Settle (LCY)"(Field 37028315)".


        //Unsupported feature: Deletion (FieldCollection) on ""Net Amount Settled (LCY)"(Field 37028316)".


        //Unsupported feature: Deletion (FieldCollection) on ""Net Amount Settled-Sale (LCY)"(Field 37028317)".


        //Unsupported feature: Deletion (FieldCollection) on ""Sell-to Phone No."(Field 37028320)".


        //Unsupported feature: Deletion (FieldCollection) on ""Bill-to Phone No."(Field 37028321)".


        //Unsupported feature: Deletion (FieldCollection) on ""Ship-to Phone No."(Field 37028322)".


        //Unsupported feature: Deletion (FieldCollection) on ""Bill-to Federal ID No."(Field 37028323)".


        //Unsupported feature: Deletion (FieldCollection) on ""Bill-to Identification No."(Field 37028324)".


        //Unsupported feature: Deletion (FieldCollection) on ""Bill-to Identification County"(Field 37028325)".


        //Unsupported feature: Deletion (FieldCollection) on ""Account Number"(Field 37028326)".


        //Unsupported feature: Deletion (FieldCollection) on ""Expiration Month"(Field 37028327)".


        //Unsupported feature: Deletion (FieldCollection) on ""Expiration Year"(Field 37028328)".


        //Unsupported feature: Deletion (FieldCollection) on ""Routing Number"(Field 37028329)".


        //Unsupported feature: Deletion (FieldCollection) on ""Check Type"(Field 37028330)".


        //Unsupported feature: Deletion (FieldCollection) on "Hash(Field 37028331)".


        //Unsupported feature: Deletion (FieldCollection) on ""Card Type"(Field 37028332)".


        //Unsupported feature: Deletion (FieldCollection) on ""Account Type"(Field 37028333)".


        //Unsupported feature: Deletion (FieldCollection) on ""Issuer Identification Number"(Field 37028334)".


        //Unsupported feature: Deletion (FieldCollection) on ""Encryption Salt"(Field 37028335)".


        //Unsupported feature: Deletion (FieldCollection) on ""Protected Account Number"(Field 37028336)".


        //Unsupported feature: Deletion (FieldCollection) on ""EFT Tender Type"(Field 37028337)".


        //Unsupported feature: Deletion (FieldCollection) on ""EFT Customer Link Type"(Field 37028339)".


        //Unsupported feature: Deletion (FieldCollection) on ""EFT Customer Link No."(Field 37028340)".


        //Unsupported feature: Deletion (FieldCollection) on ""EFT Customer Link Line No."(Field 37028341)".


        //Unsupported feature: Deletion (FieldCollection) on ""Account Number Protection Type"(Field 37028342)".


        //Unsupported feature: Deletion (FieldCollection) on ""EFT Order ID"(Field 37028343)".


        //Unsupported feature: Deletion (FieldCollection) on ""EFT Store No."(Field 37028344)".


        //Unsupported feature: Deletion (FieldCollection) on ""Electronic Invoice Type"(Field 37028345)".


        //Unsupported feature: Deletion (FieldCollection) on ""E-Mail Confirmation Sent"(Field 37028800)".


        //Unsupported feature: Deletion (FieldCollection) on ""Shipping Billing Type"(Field 37029010)".


        //Unsupported feature: Deletion (FieldCollection) on ""Shipping Insurance"(Field 37029011)".


        //Unsupported feature: Deletion (FieldCollection) on ""Ship-to Address Type"(Field 37029012)".


        //Unsupported feature: Deletion (FieldCollection) on ""Saturday Delivery"(Field 37029013)".


        //Unsupported feature: Deletion (FieldCollection) on ""Delivery Confirmation"(Field 37029014)".


        //Unsupported feature: Deletion (FieldCollection) on ""COD Type"(Field 37029015)".


        //Unsupported feature: Deletion (FieldCollection) on ""COD Amount"(Field 37029016)".


        //Unsupported feature: Deletion (FieldCollection) on ""Delivery Verbal Confirmation"(Field 37029017)".


        //Unsupported feature: Deletion (FieldCollection) on ""Ship-to E-Mail"(Field 37029018)".


        //Unsupported feature: Deletion (FieldCollection) on ""No. of Return Labels Sent"(Field 37029019)".


        //Unsupported feature: Deletion (FieldCollection) on ""Shipping Agent Service"(Field 37029020)".


        //Unsupported feature: Deletion (FieldCollection) on ""Shipping Carbon Neutral"(Field 37029021)".


        //Unsupported feature: Deletion (FieldCollection) on ""Third Party Account No."(Field 37029022)".


        //Unsupported feature: Deletion (FieldCollection) on ""Freight Calculation Valid"(Field 37029023)".


        //Unsupported feature: Deletion (FieldCollection) on ""Carrier Type"(Field 37029024)".


        //Unsupported feature: Deletion (FieldCollection) on ""Hold-at Location Code"(Field 37029025)".


        //Unsupported feature: Deletion (FieldCollection) on ""Released From Shipping"(Field 37029026)".


        //Unsupported feature: Deletion (FieldCollection) on ""Address Validation Override"(Field 37029030)".


        //Unsupported feature: Deletion (FieldCollection) on ""Address Validation Hash"(Field 37029031)".


        //Unsupported feature: Deletion (FieldCollection) on ""Return Shipping Agent Code"(Field 37029070)".


        //Unsupported feature: Deletion (FieldCollection) on ""Return Shipping Ag. Srv. Code"(Field 37029071)".


        //Unsupported feature: Deletion (FieldCollection) on ""Return Label Delivery Type"(Field 37029072)".


    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Document Type","Combine Shipments","Bill-to Customer No.","Currency Code","EU 3-Party Trade"(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Hash,""Bill-to Customer No."""(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""EFT Tender Type","EFT Customer Link Type","EFT Customer Link No.","EFT Customer Link Line No."(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Document Type","Your Reference"(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Web Order No."(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Marketplace Order No."(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Sell-to Contact"(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Ship-to Name"(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Bill-to Name"(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Accellos Packslip No."(Key)".
        // 
        // key(Key1;"Document Type","Combine Shipments","Bill-to Customer No.","Currency Code","EU 3-Party Trade","Dimension Set ID")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key3;"Document Type","EDI Trade Partner","External Document No.","Sell-to Customer No.","Ship-to Code")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key4;"Requested Delivery Date")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key5;"Shipment Date")
        // {
        // }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    //KW20170115.KK
    //grecGCLedger.SETRANGE("Document Type","Document Type");
    grecGCLedger.SETRANGE("Document No.","No.");
    grecGCLedger.DELETEALL;
    //KW20170115.KK

    IF DOPaymentTransLogEntry.FINDFIRST THEN
      DOPaymentTransLogMgt.ValidateCanDeleteDocument("Payment Method Code","Document Type",FORMAT("Document Type"),"No.");

    //EFT4.00.04 -
    EFTSourceDocMgt.DeleteSalesHeader(Rec);
    //EFT4.00.04 +
    IF NOT UserSetupMgt.CheckRespCenter(0,"Responsibility Center") THEN
      ERROR(
        Text022,
    #16..42
        "Opportunity No." := '';
      END;

    SalesPost.DeleteHeader(
      Rec,SalesShptHeader,SalesInvHeader,SalesCrMemoHeader,ReturnRcptHeader,SalesInvHeaderPrepmt,SalesCrMemoHeaderPrepmt);
    VALIDATE("Applies-to ID",'');

    ApprovalMgt.DeleteApprovalEntry(DATABASE::"Sales Header","Document Type","No.");
    SalesLine.RESET;
    SalesLine.LOCKTABLE;
    #53..63
    SalesLine.SETRANGE(Type);
    DeleteSalesLines;

    //KW20160212.KK
    //SalesCommentLine.SETRANGE("Document Type","Document Type");
    //SalesCommentLine.SETRANGE("No.","No.");
    //SalesCommentLine.DELETEALL;
    //KW20160212.KK

    IF "Tax Area Code" <> '' THEN BEGIN
      SalesTaxDifference.RESET;
    #75..140
        END;
    END;

    //CLS1.10.07 -
    ShippingEventMgt.DeleteShipmentsOnAfterDeleteSalesHeader(Rec, TRUE);
    //CLS1.10.07 +

    // START,SC
    SanaDeleteRelatedData(Rec);
    // END,SC
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #7..9
    #13..45
    //iCepts 11.13.15 DXD
    ArchiveManagement.ArchSalesDocumentNoConfirm(Rec);
    //iCepts 11.13.15 dxd

    #46..49
    // >> Shipping
    IF "Document Type" IN ["Document Type"::Order,"Document Type"::Invoice] THEN BEGIN
      Package.RESET;
      Package.SETCURRENTKEY("Source Type","Source Subtype","Source ID");
      Package.SETRANGE("Source Type",DATABASE::"Sales Header");
      Package.SETRANGE("Source Subtype","Document Type");
      Package.SETRANGE("Source ID","No.");
      Package.DELETEALL(TRUE);
    END;

    IF "Document Type" IN ["Document Type"::"Credit Memo","Document Type"::"Return Order"] THEN BEGIN
      ReceiveHeader.RESET;
      ReceiveHeader.SETCURRENTKEY("Source Type","Source Subtype","Source ID");
      ReceiveHeader.SETRANGE("Source Type",DATABASE::"Sales Header");
      ReceiveHeader.SETRANGE("Source Subtype","Document Type");
      ReceiveHeader.SETRANGE("Source ID","No.");
      ReceiveHeader.DELETEALL(TRUE);
    END;

    DeleteShippingAgentOptionPage;
    // << Shipping

    // >> EDI
    DeleteEDIDiscounts;
    // << EDI

    #50..66
    SalesCommentLine.SETRANGE("Document Type","Document Type");
    SalesCommentLine.SETRANGE("No.","No.");
    SalesCommentLine.DELETEALL;
    #72..143
    // iCepts BRB 01.13.14 - CAT2 Delete Message
    IF NOT Location.GET("Location Code") THEN
      CLEAR(Location);
    IF Location.DownloadToCAT2 THEN
      MESSAGE('Make sure you manually delete the CAT2 Order');
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InitInsert;
    InsertMode := TRUE;

    IF GetFilterCustNo <> '' THEN
      VALIDATE("Sell-to Customer No.",GetFilterCustNo);

    IF GetFilterContNo <> '' THEN
      VALIDATE("Sell-to Contact No.",GetFilterContNo);

    "Doc. No. Occurrence" := ArchiveManagement.GetNextOccurrenceNo(DATABASE::"Sales Header","Document Type","No.");
    //CLN1.00.03
    EmailEventMgt.CopyEmailAddressOnAfterInsertSalesHeader(Rec, TRUE);
    //CLN1.00.03

    //KW20160201.KK
    "Datetime Added" := CURRENTDATETIME;
    "Added By User ID" := USERID;
    //KW20160201.KK
    //KW20161219.KK
    ccDetermineShipmentType;
    //KW20161219.KK

    //CLS1.10 -
    ShippingEventMgt.SetupOnAfterInsertSalesHeader(Rec, TRUE);
    //CLS1.10 +
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10

    // iCepts BRB 07.14.09 - check for Duplicate External Document No.
    CheckDuplicateExtDocNo;
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    //KW20160201.KK
    "Datetime Modified" := CURRENTDATETIME;
    "Modified By User ID" := USERID;
    //KW20160201.KK
    //KW20161219.KK
    ccDetermineShipmentType;
    //KW20161219.KK
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // iCepts BRB 07.14.09 - check for Duplicate External Document No.
    CheckDuplicateExtDocNo;
    */
    //end;


    //Unsupported feature: Code Modification on "InitRecord(PROCEDURE 10)".

    //procedure InitRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesSetup.GET;

    CASE "Document Type" OF
    #4..55
      "Posting Date" := 0D;

    "Document Date" := WORKDATE;
    //KW20160509.KK
    "Requested Delivery Date" := WORKDATE;
    //KW20160509.KK

    VALIDATE("Location Code",UserSetupMgt.GetLocation(0,Cust."Location Code","Responsibility Center"));

    #65..74
      VALIDATE("Outbound Whse. Handling Time",InvtSetup."Outbound Whse. Handling Time");

    "Responsibility Center" := UserSetupMgt.GetRespCenter(0,"Responsibility Center");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..58
    #62..77
    */
    //end;


    //Unsupported feature: Code Modification on "RecreateSalesLines(PROCEDURE 4)".

    //procedure RecreateSalesLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF SalesLinesExist THEN BEGIN
      IF HideValidationDialog OR NOT GUIALLOWED THEN
        Confirmed := TRUE
    #4..81
                  SalesLine."Purchase Order No." := SalesLineTmp."Purchase Order No.";
                  SalesLine."Purch. Order Line No." := SalesLineTmp."Purch. Order Line No.";
                  SalesLine."Drop Shipment" := SalesLine."Purch. Order Line No." <> 0;
                END;
              END;

    #88..154
          Text017,ChangedFieldName);
    END;
    SalesLine.BlockDynamicTracking(FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // >> EDI
    IF EDITemp THEN
      EXIT;
    // << EDI

    #1..84

                  // >> EDI
                  SalesLine."EDI Ship Confirmed" := SalesLineTmp."EDI Ship Confirmed";
                  SalesLine."EDI Item Cross Ref." := SalesLineTmp."EDI Item Cross Ref.";
                  SalesLine."EDI Unit of Measure" := SalesLineTmp."EDI Unit of Measure";
                  SalesLine."EDI Unit Price" := SalesLineTmp."EDI Unit Price";
                  SalesLine."EDI Price Discrepancy" := SalesLineTmp."EDI Price Discrepancy";
                  SalesLine."EDI Segment Group" := SalesLineTmp."EDI Segment Group";
                  SalesLine."EDI Original Qty." := SalesLineTmp."EDI Original Qty.";
                  SalesLine."EDI Status Pending" := SalesLineTmp."EDI Status Pending";
                  SalesLine."EDI Release No." := SalesLineTmp."EDI Release No.";
                  SalesLine."EDI Ship Req. Date" := SalesLineTmp."EDI Ship Req. Date";
                  SalesLine."EDI Kanban No." := SalesLineTmp."EDI Kanban No.";
                  SalesLine."EDI Line Type" := SalesLineTmp."EDI Line Type"::Recreate;
                  SalesLine."EDI Line Status" := SalesLineTmp."EDI Line Status";
                  SalesLine."EDI Cumulative Quantity" := SalesLineTmp."EDI Cumulative Quantity";
                  SalesLine."EDI Forecast Begin Date" := SalesLineTmp."EDI Forecast Begin Date";
                  SalesLine."EDI Forecast End Date" := SalesLineTmp."EDI Forecast End Date";
                  SalesLine."EDI Code" := SalesLineTmp."EDI Code";
                  // << EDI

    #85..157
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateSalesLines(PROCEDURE 15)".

    //procedure UpdateSalesLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NOT SalesLinesExist THEN
      EXIT;

    #4..28
    SalesLine.SETRANGE("Document No.","No.");
    IF SalesLine.FINDSET THEN
      REPEAT
        CASE ChangedFieldName OF
          FIELDCAPTION("Shipment Date"):
            IF SalesLine."No." <> '' THEN
              SalesLine.VALIDATE("Shipment Date","Shipment Date");
          FIELDCAPTION("Currency Factor"):
            IF SalesLine.Type <> SalesLine.Type::" " THEN BEGIN
              SalesLine.VALIDATE("Unit Price");
    #39..72
          FIELDCAPTION("Tax Liable"):
            IF SalesLine."No." <> '' THEN
              SalesLine.VALIDATE("Tax Liable","Tax Liable");
        END;
        SalesLineReserve.AssignForPlanning(SalesLine);
        SalesLine.MODIFY(TRUE);
      UNTIL SalesLine.NEXT = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..31
        SalesLine.SetFromHeader; // iCepts BRB 10.21.10 - Set from header, not to show Location NEWOX message
        CASE ChangedFieldName OF
          FIELDCAPTION("Shipment Date"):
            //IF SalesLine."No." <> '' THEN   //06.23.15 Update Shipment date for all lines
              SalesLine.VALIDATE("Shipment Date","Shipment Date");  //06.23.15
    #36..75
          FIELDCAPTION("Location Code"): // iCepts BRB 10.20.10 - Update Location Code on line
              SalesLine.VALIDATE("Location Code","Location Code");
    #76..78
          // iCepts BRB 10.20.09 - If Line Updated, resend
          // iCepts BRB 01.16.12 - Only send to Sigma on Release
          {
          IF ChangedFieldName = FIELDCAPTION("Shipment Date") THEN
            SalesLine.SendToSigma(FALSE);
          }
      UNTIL SalesLine.NEXT = 0;
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 16)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.GET;
    TableID[1] := Type1;
    No[1] := No1;
    #4..18
      MODIFY;
      UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // >> EDI
    IF EDITemp THEN
      EXIT;
    // << EDI

    #1..21
    */
    //end;


    //Unsupported feature: Code Modification on "ValidateShortcutDimCode(PROCEDURE 19)".

    //procedure ValidateShortcutDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";
    DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
    IF "No." <> '' THEN
    #4..7
      IF SalesLinesExist THEN
        UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // >> EDI
    IF EDITemp THEN
      EXIT;
    // << EDI

    #1..10
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateSellToCust(PROCEDURE 25)".

    //procedure UpdateSellToCust();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF Cont.GET(ContactNo) THEN
      "Sell-to Contact No." := Cont."No."
    ELSE BEGIN
    #4..30
        "Ship-to Address 2" := ContComp."Address 2";
        "Ship-to City" := ContComp.City;
        "Ship-to Post Code" := ContComp."Post Code";
    //KW20160621.KK
    //    "Ship-to County" := ContComp.County;
        VALIDATE("Ship-to County", ContComp.County);
    //KW20160621.KK
        VALIDATE("Ship-to Country/Region Code",ContComp."Country/Region Code");
        IF ("Sell-to Customer Template Code" = '') AND (NOT CustTemplate.ISEMPTY) THEN
          VALIDATE("Sell-to Customer Template Code",Cont.FindCustomerTemplate);
    #41..70
       ("Bill-to Customer No." = '')
    THEN
      VALIDATE("Bill-to Contact No.","Sell-to Contact No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..33
        "Ship-to County" := ContComp.County;
    #38..73
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateShipToAddress(PROCEDURE 31)".

    //procedure UpdateShipToAddress();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN BEGIN
      IF "Location Code" <> '' THEN BEGIN
        Location.GET("Location Code");
    #4..9
        "Ship-to County" := Location.County;
        "Ship-to Country/Region Code" := Location."Country/Region Code";
        "Ship-to Contact" := Location.Contact;
        //KW20160829.KK
        "Ship-to Phone No." := Location."Phone No.";
        //KW20160829.KK
      END ELSE BEGIN
        CompanyInfo.GET;
        "Ship-to Code" := '';
    #19..24
        "Ship-to County" := CompanyInfo."Ship-to County";
        "Ship-to Country/Region Code" := CompanyInfo."Ship-to Country/Region Code";
        "Ship-to Contact" := CompanyInfo."Ship-to Contact";
        //KW20160829.KK
        "Ship-to Phone No." := CompanyInfo."Phone No.";
        //KW20160829.KK

      END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..12
    #16..27
      END;
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateAllLineDim(PROCEDURE 34)".

    //procedure UpdateAllLineDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Update all lines with changed dimensions.

    IF NewParentDimSetID = OldParentDimSetID THEN
      EXIT;
    IF NOT HideValidationDialog OR NOT GUIALLOWED THEN
      IF NOT CONFIRM(Text064) THEN
        EXIT;

    #9..21
          ATOLink.UpdateAsmDimFromSalesLine(SalesLine);
        END;
      UNTIL SalesLine.NEXT = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    IF NOT HideValidationDialog AND GUIALLOWED THEN
    #6..24
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: SHdr) (VariableCollection) on "CheckDuplicateExtDocNo(PROCEDURE 1000000000)".


    //Unsupported feature: Variable Insertion (Variable: SIHdr) (VariableCollection) on "CheckDuplicateExtDocNo(PROCEDURE 1000000000)".


    //Unsupported feature: Variable Insertion (Variable: SCMHdr) (VariableCollection) on "CheckDuplicateExtDocNo(PROCEDURE 1000000000)".


    //Unsupported feature: Variable Insertion (Variable: ExtDocType) (VariableCollection) on "CheckDuplicateExtDocNo(PROCEDURE 1000000000)".


    //Unsupported feature: Property Deletion (Local) on "ccDetermineShipmentType(PROCEDURE 1000000000)".


    //Unsupported feature: Property Modification (Name) on "ccDetermineShipmentType(PROCEDURE 1000000000)".



    //Unsupported feature: Code Modification on "ccDetermineShipmentType(PROCEDURE 1000000000)".

    //procedure ccDetermineShipmentType();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    //KW20161219.KK
    IF "Ship-to Country/Region Code" <> '' THEN
      IF grecCountry.GET("Ship-to Country/Region Code") THEN
        VALIDATE("Shipment Type", grecCountry."Shipment Type")
      ELSE
        VALIDATE("Shipment Type", "Shipment Type"::"Noncontinental U.S.");

    IF "Ship-to Country/Region Code" = '' THEN
      IF grecState.GET("Ship-to County") THEN
        "Shipment Type" := grecState."Shipment Type"
      ELSE
        "Shipment Type" := "Shipment Type"::Foreign;
    //KW20161219.KK
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // iCepts BRB 07.14.09 - check for Duplicate External Document No.
    IF ("Sell-to Customer No." = '') OR ("External Document No." = '') THEN
      EXIT;

    // Check the Sales Header for any Orders, Invoices or Credit Memos that have this Ext. Doc. No.
    ExtDocType := '';
    SHdr.RESET;
    SHdr.SETCURRENTKEY("Sell-to Customer No.", "External Document No.");
    SHdr.SETFILTER("Document Type", '%1|%2|%3|%4', "Document Type"::Order, "Document Type"::Invoice,
                   "Document Type"::"Credit Memo", "Document Type"::"Blanket Order");
    SHdr.SETRANGE("Sell-to Customer No.", "Sell-to Customer No.");
    SHdr.SETRANGE("External Document No.", "External Document No.");
    SHdr.SETFILTER("No.",'<>%1',"No."); // iCepts BRB 07.14.09 - Do not bring in current Document

    // Check the Sales Invoice Header for any Posted Invoices with this Ext. Doc. No.
    SIHdr.RESET;
    SIHdr.SETCURRENTKEY("Sell-to Customer No.", "External Document No.");
    SIHdr.SETRANGE("Sell-to Customer No.", "Sell-to Customer No.");
    SIHdr.SETRANGE("External Document No.","External Document No.");

    // Check the Sales Credit Memo Header for any Posted Credit Memos w/ this Ext. Doc. No.
    SCMHdr.RESET;
    SCMHdr.SETCURRENTKEY("Sell-to Customer No.", "External Document No.");
    SCMHdr.SETRANGE("Sell-to Customer No.", "Sell-to Customer No.");
    SCMHdr.SETRANGE("External Document No.", "External Document No.");

    // Make sure there are no other references.
    IF (SHdr.COUNT <> 0) OR (SIHdr.COUNT <> 0) OR (SCMHdr.COUNT <> 0 ) THEN BEGIN
      IF ("Sell-to Customer No." <> xRec."Sell-to Customer No.") AND (xRec."Sell-to Customer No." <> '') THEN BEGIN
        ERROR('Ext. Document No. has been used for this Customer.');
      END ELSE BEGIN
        IF SHdr.COUNT <> 0 THEN BEGIN
          SHdr.FINDFIRST;
          ExtDocType := 'Open ' + FORMAT(SHdr."Document Type") + ' ' + FORMAT(SHdr."No.");
        END;
        IF SIHdr.COUNT <> 0 THEN BEGIN
          SIHdr.FINDFIRST;
          ExtDocType := 'Posted Invoice ' + FORMAT(SIHdr."No.");
        END;
        IF SCMHdr.COUNT <> 0 THEN BEGIN
          SCMHdr.FINDFIRST;
          ExtDocType := 'Posted Credit Memo ' + FORMAT(SCMHdr."No.");
        END;

        ERROR(
              'Ext. Document Number has been used for this Customer.\' +
              'in %1.',ExtDocType);
      END;
    END;
    */
    //end;





    procedure Check0prices()
    var
        UnitPriceLines: Text[1024];
        SalesLine: Record "Sales Line";

    begin
        // iCepts BRB 07.15.09 - Check for Zero Prices
        UnitPriceLines := '';
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", "Document Type");
        SalesLine.SetRange("Document No.", "No.");
        SalesLine.SetFilter("Unit Price", '=0');
        SalesLine.SetFilter(Type, '<>0');
        if SalesLine.FindFirst then begin
            repeat
                UnitPriceLines := UnitPriceLines + Format(SalesLine."Line No.") + ', ';
            until SalesLine.Next = 0;
            UnitPriceLines := CopyStr(UnitPriceLines, 1, StrLen(UnitPriceLines) - 2);
            if not Confirm('Unit Price is zero for Lines %1\Are you sure you want to Release/Post?', false, UnitPriceLines) then
                Error('Please update Unit Prices');
        end;
    end;

    procedure SigmaCustCheck()
    var
        SigmaCustomerID: Code[20];
        Customer: Record Customer;
        ShipToAddress: Record "Ship-to Address";
    begin
        // iCepts BRB 10.09.09 - Sigma Customer ID Check
        if "Sell-to Customer No." = '' then
            exit;
        if "Location Code" = 'NEWOX' then begin
            SigmaCustomerID := '';
            if Customer.Get("Sell-to Customer No.") then
                SigmaCustomerID := Customer."Sigma Customer ID";
            if "Ship-to Code" <> '' then
                if ShipToAddress.Get("Sell-to Customer No.", "Ship-to Code") then
                    SigmaCustomerID := ShipToAddress."Sigma Customer ID";
            if SigmaCustomerID = '' then begin
                // iCepts BRB ERROR('Sigma Customer ID is not setup for:\Customer: %1\Ship-to: %2',"Sell-to Customer No.","Ship-to Code");
            end;
        end;
    end;


    //Unsupported feature: Deletion (VariableCollection) on "InitInsert(PROCEDURE 61).grecCountry(Variable 1000000000)".


    //Unsupported feature: Deletion (VariableCollection) on "ccDetermineShipmentType(PROCEDURE 1000000000).grecCountry(Variable 1000000000)".


    //Unsupported feature: Deletion (VariableCollection) on "ccDetermineShipmentType(PROCEDURE 1000000000).grecState(Variable 1000000001)".


    var
        ShippingAgent: Record "Shipping Agent";

        Location2: Record Location;


}