TableExtension 50108 tableextension50108 extends "Purchase Header" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Buy-from Vendor No."(Field 2).OnValidate".

        //trigger "(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            InitRecOnVendUpdate;
            TESTFIELD(Status,Status::Open);
            IF ("Buy-from Vendor No." <> xRec."Buy-from Vendor No.") AND
            #4..132

            VALIDATE("Order Address Code");

            IF (xRec."Buy-from Vendor No." <> "Buy-from Vendor No.") OR
               (xRec."Currency Code" <> "Currency Code") OR
               (xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group") OR
            #139..141

            IF NOT SkipBuyFromContact THEN
              UpdateBuyFromCont("Buy-from Vendor No.");
            //CLS1.10.00 -
            ShippingEventMgt.PopulateBuyFromOnAfterValidatePurchHeaderBuyFromVendorNo(Rec, xRec, CurrFieldNo);
            //CLS1.10.00 +
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..135
            // >> EDI
            "EDI Order" := Vend."EDI Order";
            // << EDI

            #136..144
            */
        //end;


        //Unsupported feature: Code Modification on ""No."(Field 3).OnValidate".

        //trigger "(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "No." <> xRec."No." THEN BEGIN
              PurchSetup.GET;
              NoSeriesMgt.TestManual(GetNoSeriesCode);
              "No. Series" := '';
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF "No." <> xRec."No." THEN BEGIN
              PurchSetup.GET;
              UserSetup.GET(USERID); //RFM8552 09.22.15DXD
            #3..5
            */
        //end;


        //Unsupported feature: Code Modification on ""Pay-to Vendor No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD(Status,Status::Open);
            IF (xRec."Pay-to Vendor No." <> "Pay-to Vendor No.") AND
               (xRec."Pay-to Vendor No." <> '')
            #4..113
              UpdatePayToCont("Pay-to Vendor No.");

            "Pay-to IC Partner Code" := Vend."IC Partner Code";
            //CLS1.10.00 -
            ShippingEventMgt.PopulatePayToOnAfterValidatePurchHeaderPayToVendorNo(Rec, xRec, CurrFieldNo);
            //CLS1.10.00 +
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..116
            */
        //end;


        //Unsupported feature: Code Modification on ""Ship-to Code"(Field 12).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ("Document Type" = "Document Type"::Order) AND
               (xRec."Ship-to Code" <> "Ship-to Code")
            THEN BEGIN
            #4..39
              IF Cust."Location Code" <> '' THEN
                VALIDATE("Location Code",Cust."Location Code");
            END;
            //CLS1.10.00 -
            ShippingEventMgt.PopulateShipToOnAfterValidatePurchHeaderShipToCode(Rec, xRec, CurrFieldNo);
            //CLS1.10.00 +
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..42
            */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 28).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD(Status,Status::Open);
            IF ("Location Code" <> xRec."Location Code") AND
               (xRec."Buy-from Vendor No." = "Buy-from Vendor No.")
            #4..57
                VALIDATE("Tax Exemption No.",Location."Tax Exemption No.");
              END;
            END;
            //CLS1.10.00 -
            ShippingEventMgt.PopulateShipToOnAfterValidatePurchHeaderLocationCode(Rec, xRec, CurrFieldNo);
            //CLS1.10.00 +
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..60
            */
        //end;


        //Unsupported feature: Code Modification on ""Sell-to Customer No."(Field 72).OnValidate".

        //trigger "(Field 72)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ("Document Type" = "Document Type"::Order) AND
               (xRec."Sell-to Customer No." <> "Sell-to Customer No.")
            THEN BEGIN
            #4..7
                ERROR(
                  Text006,
                  FIELDCAPTION("Sell-to Customer No."));
            END;

            IF "Sell-to Customer No." = '' THEN
              VALIDATE("Location Code",UserSetupMgt.GetLocation(1,'',"Responsibility Center"))
            ELSE
              VALIDATE("Ship-to Code",'');
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..10

              PurchLine.SETRANGE("Sales Order Line No.");
              PurchLine.SETFILTER("Special Order Sales Line No.",'<>0');
              IF NOT PurchLine.ISEMPTY THEN
                ERROR(
                  Text006,
                  FIELDCAPTION("Sell-to Customer No."));
            #11..16
            */
        //end;


        //Unsupported feature: Code Insertion on ""Buy-from Country/Region Code"(Field 90)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            // >> Shipping
            IF "Buy-from Country/Region Code" <> xRec."Buy-from Country/Region Code" THEN
              IF "E-Ship Agent Code" <> '' THEN BEGIN
                xRec."E-Ship Agent Code" := '';
                VALIDATE("E-Ship Agent Code");
              END;
            // << Shipping
            */
        //end;


        //Unsupported feature: Code Modification on ""Order Address Code"(Field 95).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Order Address Code" <> '' THEN BEGIN
              OrderAddr.GET("Buy-from Vendor No.","Order Address Code");
              "Buy-from Vendor Name" := OrderAddr.Name;
            #4..21
                "Ship-to County" := OrderAddr.County;
                "Ship-to Country/Region Code" := OrderAddr."Country/Region Code";
                "Ship-to Contact" := OrderAddr.Contact;
              END
            END ELSE BEGIN
              GetVend("Buy-from Vendor No.");
              "Buy-from Vendor Name" := Vend.Name;
            #29..49
                "Shipment Method Code" := Vend."Shipment Method Code";
                IF Vend."Location Code" <> '' THEN
                  VALIDATE("Location Code",Vend."Location Code");
              END
            END;
            //CLS1.10.00 -
            ShippingEventMgt.PopulateOnAfterValidatePurchHeaderOrderAddressCode(Rec, xRec, CurrFieldNo);
            //CLS1.10.00 +
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..24
              END;

              // >> Shipping
              "E-Ship Agent Code" := OrderAddr."E-Ship Agent Code";
              IF OrderAddr."E-Ship Agent Code" <> '' THEN BEGIN
                VALIDATE("E-Ship Agent Code",OrderAddr."E-Ship Agent Code");
                IF OrderAddr."E-Ship Agent Service" <> '' THEN
                  VALIDATE("E-Ship Agent Service",OrderAddr."E-Ship Agent Service");
              END;
              "Residential Delivery" := OrderAddr."Residential Delivery";
              "Shipping Payment Type" := OrderAddr."Shipping Payment Type";
              "Shipping Insurance" := OrderAddr."Shipping Insurance";
              IF "Shipping Payment Type" = "Shipping Payment Type"::Prepaid THEN
                VALIDATE("Third Party Ship. Account No.",'')
              ELSE
                IF ShippingAccount.GetPrimaryShippingAccountNo(
                     "E-Ship Agent Code",ShippingAccount."Ship-to Type"::Vendor,
                     "Sell-to Customer No.","Ship-to Code")
                THEN
                  VALIDATE("Third Party Ship. Account No.",ShippingAccount."Account No.");
              // << Shipping
            #26..52

              // >> Shipping
              VALIDATE("E-Ship Agent Code",Vend."Shipping Agent Code");
              IF Vend."Shipping Agent Code" <> '' THEN BEGIN
                VALIDATE("E-Ship Agent Code",Vend."Shipping Agent Code");
                IF Vend."E-Ship Agent Service" <> '' THEN
                  VALIDATE("E-Ship Agent Service",Vend."E-Ship Agent Service");
              END;
              "Residential Delivery" := Vend."Residential Delivery";
              "Shipping Payment Type" := Vend."Shipping Payment Type";
              "Shipping Insurance" := Vend."Shipping Insurance";
              IF "Shipping Payment Type" = "Shipping Payment Type"::Prepaid THEN
                VALIDATE("Third Party Ship. Account No.",'')
              ELSE
                IF ShippingAccount.GetPrimaryShippingAccountNo(
                     "E-Ship Agent Code",ShippingAccount."Ship-to Type"::Customer,
                     "Sell-to Customer No.","Ship-to Code")
                THEN
                  VALIDATE("Third Party Ship. Account No.",ShippingAccount."Account No.");
              "Residential Delivery" := Vend."Residential Delivery";
              // << Shipping
              END;
            END;
            */
        //end;

        //Unsupported feature: Deletion (FieldCollection) on ""Buy-from Phone No."(Field 37028320)".


        //Unsupported feature: Deletion (FieldCollection) on ""Pay-to Phone No."(Field 37028321)".


        //Unsupported feature: Deletion (FieldCollection) on ""Ship-to Phone No."(Field 37028322)".


        //Unsupported feature: Deletion (FieldCollection) on ""Shipping Agent Code"(Field 37029000)".


        //Unsupported feature: Deletion (FieldCollection) on ""Shipping Agent Service Code"(Field 37029001)".


        //Unsupported feature: Deletion (FieldCollection) on ""Shipping Billing Type"(Field 37029010)".


        //Unsupported feature: Deletion (FieldCollection) on ""Ship-to Address Type"(Field 37029012)".


        //Unsupported feature: Deletion (FieldCollection) on ""Saturday Delivery"(Field 37029013)".


        //Unsupported feature: Deletion (FieldCollection) on ""Delivery Confirmation"(Field 37029014)".


        //Unsupported feature: Deletion (FieldCollection) on ""COD Type"(Field 37029015)".


        //Unsupported feature: Deletion (FieldCollection) on ""COD Amount"(Field 37029016)".


        //Unsupported feature: Deletion (FieldCollection) on ""Delivery Verbal Confirmation"(Field 37029017)".


        //Unsupported feature: Deletion (FieldCollection) on ""Ship-to E-Mail"(Field 37029018)".


        //Unsupported feature: Deletion (FieldCollection) on ""Shipping Carbon Neutral"(Field 37029021)".


        //Unsupported feature: Deletion (FieldCollection) on ""Third Party Account No."(Field 37029022)".


        //Unsupported feature: Deletion (FieldCollection) on ""Address Validation Override"(Field 37029030)".


        //Unsupported feature: Deletion (FieldCollection) on ""Address Validation Hash"(Field 37029031)".

        field(50010;SendToCAT2;Boolean)
        {
            Caption = 'Send To CAT2';
            Description = 'RFM7988';
        }
      
    }
    keys
    {
        
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT UserSetupMgt.CheckRespCenter(1,"Responsibility Center") THEN
          ERROR(
            Text023,
        #4..7
          ReturnShptHeader,PurchInvHeaderPrepmt,PurchCrMemoHeaderPrepmt);
        VALIDATE("Applies-to ID",'');

        ApprovalMgt.DeleteApprovalEntry(DATABASE::"Purchase Header","Document Type","No.");
        PurchLine.LOCKTABLE;

        #14..97
            END;
        END;

        //CLS1.10.07 -
        ShippingEventMgt.DeleteShipmentsOnAfterDeletePurchHeader(Rec, TRUE);
        //CLS1.10.07 +
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..10
        // >> Shipping
        IF "Document Type" IN ["Document Type"::"Credit Memo","Document Type"::"Return Order"] THEN BEGIN
          Package.RESET;
          Package.SETCURRENTKEY("Source Type","Source Subtype","Source ID");
          Package.SETRANGE("Source Type",DATABASE::"Purchase Header");
          Package.SETRANGE("Source Subtype","Document Type");
          Package.SETRANGE("Source ID","No.");
          Package.DELETEALL(TRUE);
        END;

        IF "Document Type" IN ["Document Type"::Order,"Document Type"::Invoice] THEN BEGIN
          ReceiveHeader.RESET;
          ReceiveHeader.SETCURRENTKEY("Source Type","Source Subtype","Source ID");
          ReceiveHeader.SETRANGE("Source Type",DATABASE::"Purchase Header");
          ReceiveHeader.SETRANGE("Source Subtype","Document Type");
          ReceiveHeader.SETRANGE("Source ID","No.");
          ReceiveHeader.DELETEALL(TRUE);
        END;

        DeleteShippingAgentOptionPage;
        // << Shipping

        #11..100
        // iCepts BRB 01.13.14 - CAT2 Delete Message
        IF SendToCAT2 THEN
          MESSAGE('Make sure you manually delete the CAT2 Order');
        */
    //end;


    //Unsupported feature: Code Modification on "AssistEdit(PROCEDURE 2)".

    //procedure AssistEdit();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        PurchSetup.GET;
        TestNoSeries;
        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode,OldPurchHeader."No. Series","No. Series") THEN BEGIN
          PurchSetup.GET;
          TestNoSeries;
          NoSeriesMgt.SetSeries("No.");
          EXIT(TRUE);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        PurchSetup.GET;
        UserSetup.GET(USERID);//09.22.15 DXD RFM8552
        #2..8
        */
    //end;


    //Unsupported feature: Code Modification on "TestNoSeries(PROCEDURE 6)".

    //procedure TestNoSeries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        PurchSetup.GET;
        CASE "Document Type" OF
          "Document Type"::Quote:
            PurchSetup.TESTFIELD("Quote Nos.");
          "Document Type"::Order:
            PurchSetup.TESTFIELD("Order Nos.");
          "Document Type"::Invoice:
            BEGIN
              PurchSetup.TESTFIELD("Invoice Nos.");
              PurchSetup.TESTFIELD("Posted Invoice Nos.");
            END;
          "Document Type"::"Return Order":
        #13..18
          "Document Type"::"Blanket Order":
            PurchSetup.TESTFIELD("Blanket Order Nos.");
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        PurchSetup.GET;
        UserSetup.GET(USERID);//09.22.15 DXD RFM8552
        #2..5
            //PurchSetup.TESTFIELD("Order Nos.");
            UserSetup.TESTFIELD("PO Order Nos.");//09.22.15dxd
          "Document Type"::Invoice:
            BEGIN
              //PurchSetup.TESTFIELD("Invoice Nos.");
              UserSetup.TESTFIELD("PO Invoice Nos.");//RFM8552 09.23.15dxd
        #10..21
        */
    //end;


    //Unsupported feature: Code Modification on "GetNoSeriesCode(PROCEDURE 9)".

    //procedure GetNoSeriesCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Document Type" OF
          "Document Type"::Quote:
            EXIT(PurchSetup."Quote Nos.");
          "Document Type"::Order:
            EXIT(PurchSetup."Order Nos.");
          "Document Type"::Invoice:
            EXIT(PurchSetup."Invoice Nos.");
          "Document Type"::"Return Order":
            EXIT(PurchSetup."Return Order Nos.");
          "Document Type"::"Credit Memo":
            EXIT(PurchSetup."Credit Memo Nos.");
          "Document Type"::"Blanket Order":
            EXIT(PurchSetup."Blanket Order Nos.");
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
            //EXIT(PurchSetup."Order Nos.");
            EXIT(UserSetup."PO Order Nos.");//09.22.15 DXD RFM8552
          "Document Type"::Invoice:
            //EXIT(PurchSetup."Invoice Nos.");
            EXIT(UserSetup."PO Invoice Nos.");//09.23.15 DXD RFM8552
        #8..14
        */
    //end;

    procedure SetRunFromEDI(Start: Boolean)
    begin
        if Start then
          RunFromEDI := true
        else
          RunFromEDI := false;
    end;

    
    procedure fSendToCAT2()
    var
        CAT2POVW: Record CAT2POVW;
        PurchLine: Record "Purchase Line";
        Text50000: label 'There is nothing to release for %1 %2.';
    begin
        // iCepts BRB 10.31.13 - RFM7988 Update table CAT2POVW
        if "Document Type" <> "document type"::Order then
          exit;

        PurchLine.Reset;
        PurchLine.SetRange("Document Type","Document Type");
        PurchLine.SetRange("Document No.","No.");
        PurchLine.SetRange(Type,PurchLine.Type::Item);
        PurchLine.SetFilter("No.",'<>%1','');
        PurchLine.SetFilter(Quantity,'<>0');

        if not PurchLine.Find('-') then  begin
          Error(Text50000,"Document Type","No.");
        end else begin

          repeat
            PurchLine.fSendtoCAT2;
          until PurchLine.Next = 0;
        end;
    end;

    var
        ShippingAgent: Record "Shipping Agent";
        RunFromEDI: Boolean;

    var
        UserSetup: Record "User Setup";
}

