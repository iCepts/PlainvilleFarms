TableExtension 50107 tableextension50107 extends "Sales Line"
{
    fields
    {

        //Unsupported feature: Property Insertion (InitValue) on "Type(Field 5)".

        modify("Unit of Measure Code")
        {
            TableRelation = if (Type = const(Item)) "Item Unit of Measure".Code where("Item No." = field("No."))
            else
            if (Type = const(Resource)) "Resource Unit of Measure".Code where("Resource No." = field("No."))
            else
            "Unit of Measure";
        }

        //Unsupported feature: Code Modification on ""No."(Field 6).OnValidate".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;
        CheckItemAvailable(FIELDNO("No."));
        #4..55
        END ELSE
          SalesHeader.TESTFIELD("Sell-to Customer No.");

        "Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
        "Currency Code" := SalesHeader."Currency Code";
        IF NOT IsServiceItem THEN
        #62..126
              GetItem;
              Item.TESTFIELD(Blocked,FALSE);
              Item.TESTFIELD("Gen. Prod. Posting Group");
              IF Item.Type = Item.Type::Inventory THEN BEGIN
                Item.TESTFIELD("Inventory Posting Group");
                "Posting Group" := Item."Inventory Posting Group";
        #133..145
              "Profit %" := Item."Profit %";
              "Allow Item Charge Assignment" := TRUE;
              PrepaymentMgt.SetSalesPrepaymentPct(Rec,SalesHeader."Posting Date");

              IF SalesHeader."Language Code" <> '' THEN
                GetItemTranslation;
        #152..154
              ELSE
                Reserve := Item.Reserve;

              "Unit of Measure Code" := Item."Sales Unit of Measure";
            END;
          Type::Resource:
        #161..169
              "VAT Prod. Posting Group" := Res."VAT Prod. Posting Group";
              "Tax Group Code" := Res."Tax Group Code";
              "Allow Item Charge Assignment" := FALSE;
              FindResUnitCost;
            END;
          Type::"Fixed Asset":
        #176..194
            END;
        END;

        IF NOT (Type IN [Type::" ",Type::"Fixed Asset"]) THEN
          VALIDATE("VAT Prod. Posting Group");

        UpdatePrepmtSetupFields;

        IF Type <> Type::" " THEN BEGIN
          VALIDATE("Unit of Measure Code");
          IF Quantity <> 0 THEN BEGIN
            InitOutstanding;
        #207..232
        END;

        UpdateItemCrossRef;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        // iCepts BRB 02.19.09 - Check for Duplicate items
        IF (Type = Type::Item) AND DuplicateItem THEN BEGIN
          IF NOT CONFIRM(STRSUBSTNO(TextDuplicate,"No.")) THEN
            ERROR('Select another Item');
        END;

        #1..58
        //iCepts 08-12-09dxd Set Broker Commission to true if broker code is entered
        //START:
        "Broker Commission" := FALSE;
        IF SalesHeader."Broker Code" <> '' THEN BEGIN
           IF Type > 0 THEN
              "Broker Commission" := TRUE;
        END;
        //Icepts 08-12-09

        //iCepts1.25 DXD 01.08.10 Add Shelf Life
        "Shelf Life" := SalesHeader."Shelf Life"; //iCepts1.25 DXD 01.08.10

        #59..129

              //RFM6570 START 08.06.09 DXD
              //Item.TESTFIELD(ReportCode);
              "Report Code" := Item.ReportCode;
              //RFM6570 END

        #130..148
              // >> Shipping
              Pack := TRUE;
              IF CustomerItemPackageUOM.GET("Sell-to Customer No.","No.") THEN BEGIN
                VALIDATE("Std. Pack Unit of Measure Code",CustomerItemPackageUOM."Std. Pack Unit of Measure Code");
                "Std. Packs per Package" := CustomerItemPackageUOM."Std. Packs per Package";
              END ELSE BEGIN
                VALIDATE("Std. Pack Unit of Measure Code",Item."Std. Pack Unit of Measure Code");
                "Std. Packs per Package" := Item."Std. Packs per Package";
              END;

              UpdateRequiredShippingAgent;
              // << Shipping
        #149..157
              // RFM6066 06/06/2008
              "Unit of Measure 2" := Item."Base Unit of Measure 2";

              "Establishment No." := Item."Establishment No.";

        #158..172
              // >> Shipping
              Pack := Res.Pack;

              UpdateRequiredShippingAgent;
              // << Shipping
        #173..197
        VALIDATE("Prepayment %");

        IF Type <> Type::" " THEN BEGIN
          IF Type <> Type::"Fixed Asset" THEN
            VALIDATE("VAT Prod. Posting Group");
        #204..235

        // >> EDI
        //SalesHeader.GET("Document Type","Document No.");
        GetSalesHeader;
        // << EDI

        // iCepts BRB 10.12.09 - Update Sigma
        //IF (Quantity <> 0) AND ("No." <> '') THEN   //08.31.11 DXD RFM7282
        //  SendToSigma(FALSE);                       //08.31.11 DXD RFM7282

        // iCepts BRB 11.23.09 - SetDefaultQty, so the Qty. to Ship is 0
        */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 7).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;
        CheckAssocPurchOrder(FIELDCAPTION("Location Code"));
        #4..62

        IF "Document Type" = "Document Type"::"Return Order" THEN
          ValidateReturnReasonCode(FIELDNO("Location Code"));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..65

        // iCepts BRB 10.12.09 - Update Sigma
        //IF (Quantity <> 0) AND ("No." <> '') THEN   //08.31.11 DXD RFM7282
        //  SendToSigma(FALSE);                       //08.31.11 DXD RFM7282

        // iCepts BRB 10.22.09 - Message if changed from NEWOX to another location
        IF (xRec."Location Code" = 'NEWOX') AND ("Location Code" <> 'NEWOX') AND (NOT FromHeader) THEN // iCepts BRB 10.21.10
          MESSAGE('Location Changed\Make sure you manually change/delete the Sigma Order');

        // iCepts BRB 11.23.09 - SetDefaultQty, so the Qty. to Ship is 0
        SetDefaultQuantity;
        */
        //end;


        //Unsupported feature: Code Modification on ""Shipment Date"(Field 10).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        IF CurrFieldNo <> 0 THEN
          AddOnIntegrMgt.CheckReceiptOrderStatus(Rec);
        #4..12
          THEN
            CheckItemAvailable(FIELDNO("Shipment Date"));

          IF ("Shipment Date" < WORKDATE) AND (Type <> Type::" ") THEN
            IF NOT (HideValidationDialog OR HasBeenShown) AND GUIALLOWED THEN BEGIN
              MESSAGE(
                Text014,
        #20..33
          "Planned Shipment Date" := CalcPlannedShptDate(FIELDNO("Shipment Date"));
        IF NOT PlannedDeliveryDateCalculated THEN
          "Planned Delivery Date" := CalcPlannedDeliveryDate(FIELDNO("Shipment Date"));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..15
            // >> Shipping Removed message when not manual line
            // IF ("Shipment Date" < WORKDATE) AND (Type <> Type::" ") THEN
            IF ("Shipment Date" < WORKDATE) AND (Type <> Type::" ") AND (CurrFieldNo <> 0) THEN
            // << Shipping
        #17..36
        */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;

        #4..10

        "Quantity (Base)" := CalcBaseQty(Quantity);

        IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN BEGIN
          IF (Quantity * "Return Qty. Received" < 0) OR
             ((ABS(Quantity) < ABS("Return Qty. Received")) AND ("Return Receipt No." = ''))
        #17..54
          InitItemAppl(FALSE);

        IF Type = Type::Item THEN BEGIN
          UpdateUnitPrice(FIELDNO(Quantity));
          IF (xRec.Quantity <> Quantity) OR (xRec."Quantity (Base)" <> "Quantity (Base)") THEN BEGIN
            ReserveSalesLine.VerifyQuantity(Rec,xRec);
            IF NOT "Drop Shipment" THEN
              UpdateWithWarehouseShip;
        #63..87

        CALCFIELDS("Reserved Qty. (Base)");
        VALIDATE("Reserved Qty. (Base)");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..13
        // >> Shipping
        "Std. Pack Quantity" := CalcStdPackQty("Quantity (Base)");
        "Package Quantity" := CalcPackageQty("Std. Pack Quantity");
        // << Shipping

        #14..57
          //iCepts dxd 10.12.09 do not change price when changing qty
          VALIDATE("Unit Price"); // iCepts BRB 10.16.09
          //UpdateUnitPrice(FIELDNO(Quantity)); //was
          IF (xRec."No." <> "No.") THEN
            UpdateUnitPrice(FIELDNO(Quantity));  //iCepts 10.12.09 dxd

          IF (xRec.Quantity <> Quantity) OR (xRec."Quantity (Base)" <> "Quantity (Base)") THEN BEGIN
            // iCepts BRB 11.06.09 - RFM6595 Do not reserve if Lot not there
            IF (NOT FromSigma) OR (FromSigma AND LotInNAV) THEN

        #60..90

        // 08.06.09 BRB - Check to make sure not too much or less
        // iCepts BRB 11.09.09 - RFM6595 Do not check if from Sigma, updating Shipping info.
        IF (Type = Type::Item) AND NOT FromSigma THEN
        BEGIN
         SecondQtyMgt.SecondQtyCheck(Quantity,"Quantity 2","No.");
        END;
        */
        //end;


        //Unsupported feature: Code Modification on ""Qty. to Ship"(Field 18).OnValidate".

        //trigger  to Ship"(Field 18)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetLocation("Location Code");
        IF (CurrFieldNo <> 0) AND
           (Type = Type::Item) AND
        #4..14
        ELSE BEGIN
          "Qty. to Ship (Base)" := CalcBaseQty("Qty. to Ship");
          CheckServItemCreation;
          InitQtyToInvoice;
        END;
        IF ((("Qty. to Ship" < 0) XOR (Quantity < 0)) AND (Quantity <> 0) AND ("Qty. to Ship" <> 0)) OR
        #21..35
          CheckApplFromItemLedgEntry(ItemLedgEntry);

        ATOLink.UpdateQtyToAsmFromSalesLine(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..17
          // >> Shipping
          "Std. Pack Qty. to Ship" := CalcStdPackQty("Qty. to Ship (Base)");
          "Package Qty. to Ship" := CalcPackageQty("Std. Pack Qty. to Ship");
          // << Shipping
        #18..38
        */
        //end;


        //Unsupported feature: Code Modification on ""Unit Price"(Field 22).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;
        IF ("Prepmt. Amt. Inv." <> 0) AND
           ("Unit Price" <> xRec."Unit Price")
        THEN
          FIELDERROR("Unit Price",STRSUBSTNO(Text050,xRec."Unit Price"));
        VALIDATE("Line Discount %");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..6
        //
        IF "Disc. per Qty UM"<>0 THEN   //09.14.17
          VALIDATE("Disc. per Qty UM");//DXD 09.08.17

        VALIDATE("Line Discount %");
        */
        //end;


        //Unsupported feature: Code Modification on ""Shortcut Dimension 2 Code"(Field 41).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
        ATOLink.UpdateAsmDimFromSalesLine(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        // iCepts BRB 06.30.14 - RFM8212 Do not set Dimensions if from EDI :START
        IF FromEDI THEN
          EXIT;
        // iCepts BRB 06.30.14 - RFM8212 Do not set Dimensions if from EDI :END

        ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");

        // iCepts WRW 04.18.12 - Display message if Line Branch is different than Header Branch - Start
        IF SalesHeader2.GET("Document Type","Document No.") THEN
          IF SalesHeader2."Shortcut Dimension 2 Code" <> "Shortcut Dimension 2 Code" THEN
            MESSAGE('Line branch code does not match the header branch code of document.');
        // iCepts WRW 04.18.12 - Display message if Line Branch is different than Header Branch - End

        ATOLink.UpdateAsmDimFromSalesLine(Rec);
        */
        //end;


        //Unsupported feature: Code Modification on ""Drop Shipment"(Field 73).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Document Type","Document Type"::Order);
        TESTFIELD(Type,Type::Item);
        TESTFIELD("Quantity Shipped",0);
        #4..45
          IF NOT FullReservedQtyIsForAsmToOrder THEN
            ReserveSalesLine.VerifyChange(Rec,xRec);
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..48

        // iCepts BRB 11.23.09 - SetDefaultQty, so the Qty. to Ship is 0
        SetDefaultQuantity;

        // Shipping
        // Qty. to Ship has been set to zero for not accidentially shipping the line when posting.
        // This is not a Shipping Specific problem but and general "Feature" in Navision
        IF "Drop Shipment" THEN BEGIN
          SalesSetup.GET;
          IF SalesSetup."Blank Drop Shipm. Qty. to Ship" THEN
            VALIDATE("Qty. to Ship",0);
        END;
        // Shipping
        */
        //end;


        //Unsupported feature: Code Modification on ""Blanket Order Line No."(Field 98).OnValidate".

        //trigger "(Field 98)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Quantity Shipped",0);
        IF "Blanket Order Line No." <> 0 THEN BEGIN
          SalesLine2.GET("Document Type"::"Blanket Order","Blanket Order No.","Blanket Order Line No.");
          SalesLine2.TESTFIELD(Type,Type);
          SalesLine2.TESTFIELD("No.","No.");
          SalesLine2.TESTFIELD("Bill-to Customer No.","Bill-to Customer No.");
          SalesLine2.TESTFIELD("Sell-to Customer No.","Sell-to Customer No.");
          VALIDATE("Location Code",SalesLine2."Location Code");
          VALIDATE("Unit of Measure Code",SalesLine2."Unit of Measure Code");
          VALIDATE("Unit Price",SalesLine2."Unit Price");
          VALIDATE("Line Discount %",SalesLine2."Line Discount %");
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..7
          VALIDATE("Unit Price",SalesLine2."Unit Price");
        END;
        */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on ""Prepayment %"(Field 109).OnValidate".

        //trigger (Variable: GenPostingSetup)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Prepayment %"(Field 109).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        UpdatePrepmtSetupFields;

        IF Type <> Type::" " THEN
          UpdateAmounts;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF ("Prepayment %" <> 0) AND (Type <> Type::" ") THEN BEGIN
          TESTFIELD("Document Type","Document Type"::Order);
          TESTFIELD("No.");
          IF CurrFieldNo = FIELDNO("Prepayment %") THEN
            IF "System-Created Entry" THEN
              FIELDERROR("Prepmt. Line Amount",STRSUBSTNO(Text045,0));
          IF "System-Created Entry" THEN
            "Prepayment %" := 0;
          GenPostingSetup.GET("Gen. Bus. Posting Group","Gen. Prod. Posting Group");
          IF GenPostingSetup."Sales Prepayments Account" <> '' THEN BEGIN
            GLAcc.GET(GenPostingSetup."Sales Prepayments Account");
            VATPostingSetup.GET("VAT Bus. Posting Group",GLAcc."VAT Prod. Posting Group");
          END ELSE
            CLEAR(VATPostingSetup);
          "Prepayment VAT %" := VATPostingSetup."VAT %";
          "Prepmt. VAT Calc. Type" := VATPostingSetup."VAT Calculation Type";
          "Prepayment VAT Identifier" := VATPostingSetup."VAT Identifier";
          CASE "Prepmt. VAT Calc. Type" OF
            "VAT Calculation Type"::"Reverse Charge VAT",
            "VAT Calculation Type"::"Sales Tax":
              "Prepayment VAT %" := 0;
            "VAT Calculation Type"::"Full VAT":
              FIELDERROR("Prepmt. VAT Calc. Type");
          END;
          "Prepayment Tax Group Code" := GLAcc."Tax Group Code";
        END;

        TestStatusOpen;
        IF ("Prepmt. Amt. Inv." <> 0) AND
           ("Prepayment %" <> xRec."Prepayment %")
        THEN
          FIELDERROR("Prepayment %",STRSUBSTNO(Text050,xRec."Prepayment %"));
        IF Type <> Type::" " THEN
          UpdateAmounts;
        */
        //end;


        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 5407).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestJobPlanningLine;
        TestStatusOpen;
        GLSetup.GET;
        #4..56
          Type::"G/L Account",Type::"Fixed Asset",Type::"Charge (Item)",Type::" ":
            "Qty. per Unit of Measure" := 1;
        END;
        VALIDATE(Quantity);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..59

        // << Shipping
        CASE Type OF
          Type::Item:
            BEGIN
              "Dimmed Weight" := Item."Dimmed Weight" * "Qty. per Unit of Measure";
            END;
          Type::Resource:
            BEGIN
              Res.GET("No.");
              "Gross Weight" := Res."Gross Weight";
              "Net Weight" := Res."Net Weight";
              "Dimmed Weight" := Res."Dimmed Weight";
              "Unit Volume" := Res."Unit Volume";
            END;
        END;
        // >> Shipping

        VALIDATE(Quantity);
        */
        //end;


        //Unsupported feature: Code Modification on ""Planned Delivery Date"(Field 5794).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        IF "Planned Delivery Date" <> 0D THEN BEGIN
          PlannedDeliveryDateCalculated := TRUE;
        #4..9
          IF "Planned Shipment Date" > "Planned Delivery Date" THEN
            "Planned Delivery Date" := "Planned Shipment Date";
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..12

        // iCepts DXD 11.10.09 - Set Planned Shipment Date = Shipment Date iCepts 1.21
        //"Planned Shipment Date" := "Shipment Date";  //Changed mind 11.11.09
        */
        //end;


        //Unsupported feature: Code Modification on ""Planned Shipment Date"(Field 5795).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        IF "Planned Shipment Date" <> 0D THEN BEGIN
          PlannedShipmentDateCalculated := TRUE;

          IF FORMAT("Outbound Whse. Handling Time") <> '' THEN
            VALIDATE(
              "Shipment Date",
              CalendarMgmt.CalcDateBOC2(
                FORMAT("Outbound Whse. Handling Time"),
                "Planned Shipment Date",
                CalChange."Source Type"::Location,
                "Location Code",
                '',
                CalChange."Source Type"::"Shipping Agent",
                "Shipping Agent Code",
                "Shipping Agent Service Code",
                FALSE))
          ELSE
            VALIDATE(
        #20..27
                "Location Code",
                '',
                FALSE));
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
          { // iCepts BRB 12.03.08 - Do not update Shipment Date
        #5..10
        #14..16
        #11..13
        #17..30

          }

        END;
        */
        //end;


        //Unsupported feature: Code Modification on ""Shipping Agent Code"(Field 5796).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        IF "Shipping Agent Code" <> xRec."Shipping Agent Code" THEN
          VALIDATE("Shipping Agent Service Code",'');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3

        // >> Shipping
        IF ("Shipping Agent Code" <> xRec."Shipping Agent Code") AND
           (CurrFieldNo = FIELDNO("Shipping Agent Code"))
        THEN
          VALIDATE("E-Ship Agent Code","Shipping Agent Code");
        // << Shipping
        */
        //end;
        field(50001; "Quantity 2"; Decimal)
        {
            Caption = 'Cust. Order Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
                ItemUOM: Record "Item Unit of Measure";
            begin
                // iCepts BRB 10.11.11 - TestStatusOpen;
                //iCepts 12.21.09 Add Original Quantity 2 dxd iCepts1.24
                if "Original Quantity 2" = 0 then
                    "Original Quantity 2" := "Quantity 2"; // Icepts1.24 12.21.09 dxd

                if ItemUOM.Get("No.", "Unit of Measure 2") then begin
                    Validate(Quantity, "Quantity 2" * ItemUOM."Qty. per Unit of Measure");
                    if "Original Quantity" = 0 then // iCepts BRB 10.30.09 - Do not change if it was already set
                        "Original Quantity" := Quantity;
                end;

                // iCepts BRB 10.30.09 - RFM6595 Do not check if from Sigma, updating Shipping info.
                if (Type = Type::Item) and not FromSigma then begin
                    SecondQtyMgt.SecondQtyCheck(Quantity, "Quantity 2", "No.");
                end;

                // iCepts BRB 10.29.09 - Update from Sigma "Qty. to Ship 2" := "Quantity 2";

                UpdateAmounts; // iCepts BRB 07.10.08 - Make sure amounts are updated

                InitOutstanding; // iCepts BRB 09.22.09

                // iCepts BRB 10.12.09 - Update Sigma
                //IF (Quantity <> 0) AND ("No." <> '') THEN     //08.31.11 DXD RFM7282
                //  SendToSigma(FALSE);                         //08.31.11 DXD RFM7282
            end;
        }
        field(50002; "Unit of Measure 2"; Text[10])
        {
            Caption = 'Cust. Order UOM';
        }
        field(50003; "Qty. to Ship 2"; Decimal)
        {
            Caption = 'Cust. Order Qty. to Ship';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
            begin
                // iCepts BRB 10.11.11 - TestStatusOpen;

                // iCepts BRB 10.30.09 - RFM6595 Do not check if from Sigma, updating Shipping info.
                if (Type = Type::Item) and not FromSigma then begin
                    SecondQtyMgt.SecondQtyCheck("Qty. to Ship", "Qty. to Ship 2", "No.");
                end;
            end;
        }
        field(50004; "Original Quantity"; Decimal)
        {
            Caption = 'Original Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                ItemLedgEntry: Record "Item Ledger Entry";
            begin
                TestStatusOpen;
                Quantity := "Original Quantity";
            end;
        }
        field(50005; "Quantity Shipped 2"; Decimal)
        {
        }
        field(50006; "Outstanding Quantity 2"; Decimal)
        {
        }
        field(50009; "Establishment No."; Code[10])
        {
        }
        field(50010; "Expiration Date"; Date)
        {
        }
        field(50012; "Report Code"; Code[10])
        {
            TableRelation = "Report Code Table";
        }
        field(50013; "Broker Commission"; Boolean)
        {
        }
        field(50030; "Original Quantity 2"; Decimal)
        {
            Description = 'iCepts1.24';

            trigger OnValidate()
            var
                ItemUOM: Record "Item Unit of Measure";
            begin
                // iCepts BRB 03.13.12 - Use same logic as Quantity 2
                TestStatusOpen;
                if ItemUOM.Get("No.", "Unit of Measure 2") then begin
                    "Original Quantity" := ("Original Quantity 2" * ItemUOM."Qty. per Unit of Measure");
                end;
            end;
        }
        field(50031; "Shelf Life"; Option)
        {
            Description = 'iCepts1.25';
            OptionMembers = " ",A,B,C;
        }
        field(50040; TransferDate; Date)
        {
            Caption = 'Transfer Date';
            Description = 'RFM7405';
        }
        field(50041; SortDate; Date)
        {
            Caption = 'Sort Date';
            Description = 'RFM7405';
        }
        field(50050; "Sigma Updated"; Boolean)
        {
        }
        field(50051; SigmaVWDocNo; Code[20])
        {
        }
        field(50052; SigmaVWLineNo; Integer)
        {
        }
        field(50053; SigmaVWCustID; Code[20])
        {
        }
        field(50054; SigmaVWOrderDate; Date)
        {
        }
        field(50055; SigmaVWProduct; Code[20])
        {
        }
        field(50056; SigmaVWQty; Decimal)
        {
        }
        field(50057; SigmaVWPONo; Code[20])
        {
        }
        field(50058; SigmaVWLastInserted; DateTime)
        {
        }
        field(50059; SigmaVWLastInsUser; Code[20])
        {
        }
        field(50060; SigmaVWLastModified; DateTime)
        {
        }
        field(50061; SigmaVWLastModUser; Code[20])
        {
        }
        field(50065; CAT2CFSCreated; Boolean)
        {
        }
        field(50066; "Disc. per Qty UM"; Decimal)
        {
            Description = 'RFM8253';

            trigger OnValidate()
            begin
                TestStatusOpen;
                "Line Discount Amount" :=
                    ROUND(Quantity * "Disc. per Qty UM", Currency."Amount Rounding Precision");

                //09.08.17 dxd
                if ROUND(Quantity * "Unit Price", Currency."Amount Rounding Precision") <> 0 then
                    "Line Discount %" :=
                      ROUND(
                        "Line Discount Amount" / ROUND(Quantity * "Unit Price", Currency."Amount Rounding Precision") * 100,
                        0.00001)
                else
                    "Line Discount %" := 0;
                //09.08.17 DXD

                Validate("Line Discount Amount");
                UpdateAmounts;
            end;
        }

    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Property Modification (SumIndexFields) on ""Document Type",Type,"No.","Variant Code","Drop Shipment","Location Code","Shipment Date"(Key)".
        // 
        // 
        // //Unsupported feature: Property Modification (SumIndexFields) on ""Document Type",Type,"No.","Variant Code","Drop Shipment","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Location Code","Shipment Date"(Key)".
        // 
        // 
        // //Unsupported feature: Property Insertion (SumIndexFields) on ""Document Type","Blanket Order No.","Blanket Order Line No."(Key)".
        // 
        // 
        // //Unsupported feature: Property Deletion (Enabled) on ""Document Type",Type,"No.","Variant Code","Drop Shipment","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Location Code","Shipment Date"(Key)".
        // 
        // key(Key1;"Document Type","Document No.",Type,"No.","Variant Code","Drop Shipment",Pack,"Location Code")
        // {
        // MaintainSIFTIndex = false;
        // SumIndexFields = "Qty. to Ship (Base)","Outstanding Qty. (Base)","Return Qty. to Receive (Base)";
        // }
        // Unsupported feature: Key containing base fields
        // key(Key2;"Document Type","Document No.",Type,"EDI Code")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key3;"Shipment Date","Document No.")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key4;"Document Type","Planned Shipment Date")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key5;Type,"No.","Variant Code","Drop Shipment","Location Code","Qty. to Ship","Document Type","Shipment Date")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key6;"Document Type","Shipment Date")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key7;Type,"No.","Variant Code","Drop Shipment","Location Code",SortDate)
        // {
        // }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestStatusOpen;
    IF NOT StatusCheckSuspended AND (SalesHeader.Status = SalesHeader.Status::Released) AND
       (Type IN [Type::"G/L Account",Type::"Charge (Item)",Type::Resource])
    #4..15
    END;

    IF ("Document Type" = "Document Type"::Order) AND (Quantity <> "Quantity Invoiced") THEN
      TESTFIELD("Prepmt. Amt. Inv.","Prepmt Amt Deducted");

    CheckAssocPurchOrder('');
    NonstockItemMgt.DelNonStockSales(Rec);
    #23..39

    CapableToPromise.RemoveReqLines("Document No.","Line No.",0,FALSE);

    IF "Line No." <> 0 THEN BEGIN
      SalesLine2.RESET;
      SalesLine2.SETRANGE("Document Type","Document Type");
    #46..57
    IF NOT SalesCommentLine.ISEMPTY THEN
      SalesCommentLine.DELETEALL;

    IF ("Line No." <> 0) AND ("Attached to Line No." = 0) THEN BEGIN
      SalesLine2.RESET;
      SalesLine2.SETRANGE("Document Type","Document Type");
      SalesLine2.SETRANGE("Document No.","Document No.");
    #65..67
        SalesLine2.MODIFY;
      END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
      TESTFIELD("Prepmt. Amt. Inv.",0);
    #20..42
    // Order Status
    GetSalesHeader;
    IF SalesHeader."Order Status Required" THEN
      EDISalesOrderStatusSend.CheckSalesLineDelete(SalesHeader,Rec);
    // Order Status

    #43..60
    IF "Line No." <> 0 THEN BEGIN
    #62..70

    // iCepts BRB 10.12.09 - Delete Sigma
    SendToSigma(TRUE);
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF ("Document Type" = "Document Type"::"Blanket Order") AND
       ((Type <> xRec.Type) OR ("No." <> xRec."No."))
    THEN BEGIN
    #4..13

    IF ((Quantity <> 0) OR (xRec.Quantity <> 0)) AND ItemExists(xRec."No.") AND NOT FullReservedQtyIsForAsmToOrder THEN
      ReserveSalesLine.VerifyChange(Rec,xRec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..16

    // Order Status
    GetSalesHeader;
    IF SalesHeader."Order Status Required" THEN
      "EDI Status Pending" := TRUE;
    // Order Status
    */
    //end;


    //Unsupported feature: Code Modification on "InitOutstanding(PROCEDURE 16)".

    //procedure InitOutstanding();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN BEGIN
      "Outstanding Quantity" := Quantity - "Return Qty. Received";
      "Outstanding Qty. (Base)" := "Quantity (Base)" - "Return Qty. Received (Base)";
      "Return Qty. Rcd. Not Invd." := "Return Qty. Received" - "Quantity Invoiced";
      "Ret. Qty. Rcd. Not Invd.(Base)" := "Return Qty. Received (Base)" - "Qty. Invoiced (Base)";
    END ELSE BEGIN
      "Outstanding Quantity" := Quantity - "Quantity Shipped";
      "Outstanding Qty. (Base)" := "Quantity (Base)" - "Qty. Shipped (Base)";
      "Qty. Shipped Not Invoiced" := "Quantity Shipped" - "Quantity Invoiced";
      "Qty. Shipped Not Invd. (Base)" := "Qty. Shipped (Base)" - "Qty. Invoiced (Base)";
    END;
    CALCFIELDS("Reserved Quantity");
    Planned := "Reserved Quantity" = "Outstanding Quantity";
    "Completely Shipped" := (Quantity <> 0) AND ("Outstanding Quantity" = 0);
    InitOutstandingAmount;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
      "Outstanding Quantity 2" := "Quantity 2" - "Quantity Shipped 2"; //Icepts 1.03
    #8..15
    */
    //end;


    //Unsupported feature: Code Modification on "InitQtyToShip(PROCEDURE 15)".

    //procedure InitQtyToShip();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetSalesSetup;
    IF (SalesSetup."Default Quantity to Ship" = SalesSetup."Default Quantity to Ship"::Remainder) OR
       ("Document Type" = "Document Type"::Invoice)
    THEN BEGIN
      "Qty. to Ship" := "Outstanding Quantity";
      "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";
    END ELSE
      IF "Qty. to Ship" <> 0 THEN
        "Qty. to Ship (Base)" := CalcBaseQty("Qty. to Ship");

    CheckServItemCreation;

    InitQtyToInvoice;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // >> Shipping
    // Qty. to Ship has been set to zero for not accidentially shipping the line when posting.
    // This is not a Shipping Specific problem but and general "Feature" in Navision
    // "Qty. to Ship" := "Outstanding Quantity";
    // "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";
    IF "Drop Shipment" THEN BEGIN
      SalesSetup.GET;
      IF SalesSetup."Blank Drop Shipm. Qty. to Ship" AND (CurrFieldNo <> FIELDNO("Qty. to Ship"))
      THEN BEGIN
        "Qty. to Ship" := 0;
        "Qty. to Ship (Base)" := 0;
      END ELSE BEGIN
        "Qty. to Ship" := "Outstanding Quantity";
        "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";
      END;
    END ELSE BEGIN
      "Qty. to Ship" := "Outstanding Quantity";
      "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";
    END;

    "Std. Pack Qty. to Ship" := CalcStdPackQty("Qty. to Ship (Base)");
    "Package Qty. to Ship" := CalcPackageQty("Std. Pack Qty. to Ship");
    // << Shipping
    #10..13
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateAmounts(PROCEDURE 3)".

    //procedure UpdateAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF CurrFieldNo <> FIELDNO("Allow Invoice Disc.") THEN
      TESTFIELD(Type);
    GetSalesHeader;
    #4..43
            ("Qty. per Unit of Measure" <> xRec."Qty. per Unit of Measure")) AND // ...continued condition
       ("Document Type" <= "Document Type"::Invoice) AND
       (("Outstanding Amount" + "Shipped Not Invoiced") > 0)
    THEN
      CustCheckCreditLimit.SalesLineCheck(Rec);

    IF Type = Type::"Charge (Item)" THEN
      UpdateItemChargeAssgnt;
    #52..60
      END;
    END;
    CalcPrepaymentToDeduct;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..46
    //THEN
    //  CustCheckCreditLimit.SalesLineCheck(Rec);
    THEN BEGIN
      // iCepts BRB 10.26.09 - Only check one time
      IF NOT CreditChecked THEN BEGIN
        CustCheckCreditLimit.SalesLineCheck(Rec);
        CreditChecked := TRUE;
      END;
    END;
    #49..63
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateVATAmounts(PROCEDURE 38)".

    //procedure UpdateVATAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetSalesHeader;
    SalesLine2.SETRANGE("Document Type","Document Type");
    SalesLine2.SETRANGE("Document No.","Document No.");
    SalesLine2.SETFILTER("Line No.",'<>%1',"Line No.");
    IF "Line Amount" = 0 THEN
      IF xRec."Line Amount" >= 0 THEN
        SalesLine2.SETFILTER(Amount,'>%1',0)
      ELSE
        SalesLine2.SETFILTER(Amount,'<%1',0)
    ELSE
      IF "Line Amount" > 0 THEN
        SalesLine2.SETFILTER(Amount,'>%1',0)
      ELSE
        SalesLine2.SETFILTER(Amount,'<%1',0);
    SalesLine2.SETRANGE("VAT Identifier","VAT Identifier");
    SalesLine2.SETRANGE("Tax Group Code","Tax Group Code");

    IF "Line Amount" = "Inv. Discount Amount" THEN BEGIN
      Amount := 0;
      "VAT Base Amount" := 0;
      "Amount Including VAT" := 0;
    END ELSE BEGIN
      TotalLineAmount := 0;
      TotalInvDiscAmount := 0;
      TotalAmount := 0;
      TotalAmountInclVAT := 0;
      TotalQuantityBase := 0;
      IF ("VAT Calculation Type" = "VAT Calculation Type"::"Sales Tax") OR
         (("VAT Calculation Type" IN
           ["VAT Calculation Type"::"Normal VAT","VAT Calculation Type"::"Reverse Charge VAT"]) AND ("VAT %" <> 0))
      THEN
        IF NOT SalesLine2.ISEMPTY THEN BEGIN
          SalesLine2.CALCSUMS("Line Amount","Inv. Discount Amount",Amount,"Amount Including VAT","Quantity (Base)");
          TotalLineAmount := SalesLine2."Line Amount";
          TotalInvDiscAmount := SalesLine2."Inv. Discount Amount";
          TotalAmount := SalesLine2.Amount;
          TotalAmountInclVAT := SalesLine2."Amount Including VAT";
          TotalQuantityBase := SalesLine2."Quantity (Base)";
        END;

      IF SalesHeader."Prices Including VAT" THEN
        CASE "VAT Calculation Type" OF
          "VAT Calculation Type"::"Normal VAT",
          "VAT Calculation Type"::"Reverse Charge VAT":
            BEGIN
              Amount :=
                ROUND(
                  (TotalLineAmount - TotalInvDiscAmount + "Line Amount" - "Inv. Discount Amount") / (1 + "VAT %" / 100),
                  Currency."Amount Rounding Precision") -
                TotalAmount;
              "VAT Base Amount" :=
                ROUND(
                  Amount * (1 - SalesHeader."VAT Base Discount %" / 100),
                  Currency."Amount Rounding Precision");
              "Amount Including VAT" :=
                TotalLineAmount + "Line Amount" -
                ROUND(
                  (TotalAmount + Amount) * (SalesHeader."VAT Base Discount %" / 100) * "VAT %" / 100,
                  Currency."Amount Rounding Precision",Currency.VATRoundingDirection) -
                TotalAmountInclVAT - TotalInvDiscAmount - "Inv. Discount Amount";
            END;
          "VAT Calculation Type"::"Full VAT":
            BEGIN
              Amount := 0;
              "VAT Base Amount" := 0;
            END;
          "VAT Calculation Type"::"Sales Tax":
            BEGIN
              SalesHeader.TESTFIELD("VAT Base Discount %",0);
              Amount :=
                SalesTaxCalculate.ReverseCalculateTax(
                  "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
                  TotalAmountInclVAT + "Amount Including VAT",TotalQuantityBase + "Quantity (Base)",
                  SalesHeader."Currency Factor") -
                TotalAmount;
              IF Amount <> 0 THEN
                "VAT %" :=
                  ROUND(100 * ("Amount Including VAT" - Amount) / Amount,0.00001)
              ELSE
                "VAT %" := 0;
              Amount := ROUND(Amount,Currency."Amount Rounding Precision");
              "VAT Base Amount" := Amount;
            END;
        END
      ELSE
        CASE "VAT Calculation Type" OF
          "VAT Calculation Type"::"Normal VAT",
          "VAT Calculation Type"::"Reverse Charge VAT":
            BEGIN
              Amount := ROUND("Line Amount" - "Inv. Discount Amount",Currency."Amount Rounding Precision");
              "VAT Base Amount" :=
                ROUND(Amount * (1 - SalesHeader."VAT Base Discount %" / 100),Currency."Amount Rounding Precision");
              "Amount Including VAT" :=
                TotalAmount + Amount +
                ROUND(
                  (TotalAmount + Amount) * (1 - SalesHeader."VAT Base Discount %" / 100) * "VAT %" / 100,
                  Currency."Amount Rounding Precision",Currency.VATRoundingDirection) -
                TotalAmountInclVAT;
            END;
          "VAT Calculation Type"::"Full VAT":
            BEGIN
              Amount := 0;
              "VAT Base Amount" := 0;
              "Amount Including VAT" := "Line Amount" - "Inv. Discount Amount";
            END;
          "VAT Calculation Type"::"Sales Tax":
            BEGIN
              Amount := ROUND("Line Amount" - "Inv. Discount Amount",Currency."Amount Rounding Precision");
              "VAT Base Amount" := Amount;
              "Amount Including VAT" :=
                TotalAmount + Amount +
                ROUND(
                  SalesTaxCalculate.CalculateTax(
                    "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
                    TotalAmount + Amount,TotalQuantityBase + "Quantity (Base)",
                    SalesHeader."Currency Factor"),Currency."Amount Rounding Precision") -
                TotalAmountInclVAT;
              IF "VAT Base Amount" <> 0 THEN
                "VAT %" :=
                  ROUND(100 * ("Amount Including VAT" - "VAT Base Amount") / "VAT Base Amount",0.00001)
              ELSE
                "VAT %" := 0;
            END;
        END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..30
      THEN BEGIN
        IF SalesLine2.FINDSET THEN
          REPEAT
            TotalLineAmount := TotalLineAmount + SalesLine2."Line Amount";
            TotalInvDiscAmount := TotalInvDiscAmount + SalesLine2."Inv. Discount Amount";
            TotalAmount := TotalAmount + SalesLine2.Amount;
            TotalAmountInclVAT := TotalAmountInclVAT + SalesLine2."Amount Including VAT";
            TotalQuantityBase := TotalQuantityBase + SalesLine2."Quantity (Base)";
          UNTIL SalesLine2.NEXT = 0;
      END;
    #40..125
    */
    //end;


    //Unsupported feature: Code Modification on "CheckItemAvailable(PROCEDURE 4)".

    //procedure CheckItemAvailable();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF Reserve = Reserve::Always THEN
      EXIT;

    #4..8
        VALIDATE("Shipment Date",WORKDATE);
    END;

    IF ((CalledByFieldNo = CurrFieldNo) OR (CalledByFieldNo = FIELDNO("Shipment Date"))) AND GUIALLOWED AND
       ("Document Type" IN ["Document Type"::Order,"Document Type"::Invoice]) AND
       (Type = Type::Item) AND ("No." <> '') AND
       ("Outstanding Quantity" > 0) AND
       ("Job Contract Entry No." = 0) AND
       NOT (Nonstock OR "Special Order")
    THEN BEGIN
      CalledByDateField :=
        CalledByFieldNo IN [FIELDNO("Shipment Date"),FIELDNO("Requested Delivery Date"),FIELDNO("Promised Delivery Date"),
                            FIELDNO("Planned Shipment Date"),FIELDNO("Planned Delivery Date")];
      IF ItemCheckAvail.SalesLineCheck(Rec,CalledByDateField) THEN
        ItemCheckAvail.RaiseUpdateInterruptedError;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    //IF ((CalledByFieldNo = CurrFieldNo) OR (CalledByFieldNo = FIELDNO("Shipment Date"))) AND GUIALLOWED AND
    IF ((CalledByFieldNo = CurrFieldNo) OR (CalledByFieldNo = FIELDNO("Shipment Date")) OR (CurrFieldNo = FIELDNO("Quantity 2")))
       AND GUIALLOWED AND
    #13..17
    THEN
      IF ItemCheckAvail.SalesLineCheck(Rec) THEN
        ItemCheckAvail.RaiseUpdateInterruptedError;
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 26)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.GET;
    TableID[1] := Type1;
    No[1] := No1;
    #4..14
        SalesHeader."Dimension Set ID",DATABASE::Customer);
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    ATOLink.UpdateAsmDimFromSalesLine(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // >> EDI
    IF EDITemp THEN
      EXIT;
    // << EDI

    // iCepts BRB 06.30.14 - RFM8212 Do not set Dimensions if from EDI :START
    IF FromEDI THEN
      EXIT;
    // iCepts BRB 06.30.14 - RFM8212 Do not set Dimensions if from EDI :END

    #1..17

    // iCepts WRW 04.18.12 - Display message if Line Branch is different than Header Branch - Start
    IF SalesHeader2.GET("Document Type","Document No.") THEN
      IF SalesHeader2."Shortcut Dimension 2 Code" <> "Shortcut Dimension 2 Code" THEN
        MESSAGE('Line branch code does not match the header branch code of document.');
    // iCepts WRW 04.18.12 - Display message if Line Branch is different than Header Branch - End
    */
    //end;


    //Unsupported feature: Code Modification on "ValidateShortcutDimCode(PROCEDURE 29)".

    //procedure ValidateShortcutDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // >> EDI
    IF EDITemp THEN
      EXIT;
    // << EDI

    DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
    */
    //end;


    //Unsupported feature: Code Modification on "LookupShortcutDimCode(PROCEDURE 28)".

    //procedure LookupShortcutDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.LookupDimValueCode(FieldNumber,ShortcutDimCode);
    ValidateShortcutDimCode(FieldNumber,ShortcutDimCode);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // >> EDI
    IF EDITemp THEN
      EXIT;
    // << EDI

    DimMgt.LookupDimValueCode(FieldNumber,ShortcutDimCode);
    ValidateShortcutDimCode(FieldNumber,ShortcutDimCode);
    */
    //end;


    //Unsupported feature: Code Modification on "ShowShortcutDimCode(PROCEDURE 27)".

    //procedure ShowShortcutDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.GetShortcutDimensions("Dimension Set ID",ShortcutDimCode);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // >> EDI
    IF EDITemp THEN
      EXIT;
    // << EDI

    DimMgt.GetShortcutDimensions("Dimension Set ID",ShortcutDimCode);
    */
    //end;



    procedure DuplicateItem(): Boolean
    var
        LSalesLine: Record "Sales Line";
    begin
        // iCepts BRB 02.19.09 - Check to make sure no duplicate items
        LSalesLine.Reset;
        LSalesLine.SetCurrentkey(Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Document Type", "Shipment Date");
        LSalesLine.SetRange(Type, LSalesLine.Type::Item);
        LSalesLine.SetRange("No.", "No.");
        LSalesLine.SetRange("Document Type", "Document Type");
        LSalesLine.SetRange("Document No.", "Document No.");
        if LSalesLine.FindFirst then
            exit(true);
    end;

    procedure SetFromSigma()
    begin
        // iCepts BRB 10.30.09 - RFM6595 Set from Sigma
        FromSigma := true;
    end;

    procedure SigmaLotNotInNAV(var locLotInNAV: Boolean)
    begin
        // iCepts BRB 11.06.09 - RFM6595 Do not Reserve if lot not there
        LotInNAV := locLotInNAV;
    end;

    procedure SetFromHeader()
    begin
        // iCepts BRB 10.21.10 - If From header, do not show location message
        FromHeader := true;
    end;

    procedure SendToSigma(DeleteLine: Boolean)
    var
        SigmaCustomerID: Code[20];
        Customer: Record Customer;
        ShipToAddress: Record "Ship-to Address";
        SigmaVw: Record SigmaVW;
        locCAT2: Boolean;
        locLocation: Record Location;
    begin
        // iCepts BRB 10.12.09 - RFM6595 Update to Sigma
        if "Document Type" <> "document type"::Order then
            exit;
        if Type <> Type::Item then
            exit;
        if not (CAT2CFSCreated) and DeleteLine then
            exit;


        // iCepts BRB 06.26.13 - RFM7895 Use Location flag to determine download to CAT2 :START
        if not locLocation.Get("Location Code") then
            Clear(locLocation);
        if locLocation.DownloadToCAT2 then
            locCAT2 := true
        else
            exit;
        // iCepts BRB 06.26.13 - RFM7895 Use Location flag to determine download to CAT2 :END

        // iCepts BRB 07.26.13 - Get and check for CAT2WarehouseCode
        if locLocation.CAT2WarehouseCode = '' then
            Error('CAT2 Warehouse Code needs to be setup for Location %1', "Location Code");

        // iCepts BRB 10.30.09 - RFM6595 Do not resend Sigma, updating Shipping info.
        if FromSigma then
            exit;

        // iCepts BRB 11.17.09 - Make sure Line No. is set
        if "Line No." = 0 then
            exit;
        GetSalesHeader;

        SigmaCustomerID := '';

        // iCepts BRB 07.10.12 - SigmaCustomerID not needed :START
        if Customer.Get("Sell-to Customer No.") then
            SigmaCustomerID := Customer."Sigma Customer ID";
        if SalesHeader."Ship-to Code" <> '' then
            if ShipToAddress.Get(SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code") then
                SigmaCustomerID := ShipToAddress."Sigma Customer ID";
        //IF SigmaCustomerID = '' THEN
        //  ERROR('Sigma Customer ID is not setup for:\Customer: %1\Ship-to: %2',"Sell-to Customer No.","Ship-to Code");
        // iCepts BRB 07.10.12 - SigmaCustomerID not needed :END

        // iCepts BRB 08.16.12 - Error if no CAT2 ship-to
        if ShipToAddress."CAT Ship-to Code" = 0 then
            Error('CAT2 Ship-to Code is not set for:\\Customer: %1\Ship-to: %2', "Sell-to Customer No.", ShipToAddress."CAT Ship-to Code");

        if SigmaVw.Get("Document No.", "Line No.") then begin
            SigmaVw.CustomerCode := CopyStr("Sell-to Customer No.", 1, 10); // iCepts BRB 01.15.13 - max 10 characters
            SigmaVw.ShipToCode := Format(ShipToAddress."CAT Ship-to Code"); // iCepts BRB 08.10.12 - "Ship-to Code";
            SigmaVw.OrderDate := "Shipment Date"; // iCepts BRB 10.07.09 - was SalesHeader."Order Date";
            SigmaVw.CompanyCode := '30';
            // iCepts BRB 05.16.13 - Make sure to update the warehouse code all the time
            SigmaVw.WarehouseCode := locLocation.CAT2WarehouseCode; // iCepts BRB 07.26.13 - Set Code on Location table

            SigmaVw.Product := "No.";
            SigmaVw.StatusFlag := 'U';
            if DeleteLine then begin
                SigmaVw.Quantity := 0;
                SigmaVw.StatusItem := 'S';
            end else
                SigmaVw.Quantity := "Quantity 2";
            SigmaVw.PONumber := SalesHeader."External Document No.";
            SigmaVw.InterfaceCreate := CurrentDatetime;

            // iCepts WRW 03.28.16 - RFM8742 Requested Delivery Date and Shipment Date to CAT2 Download - Start
            if "Shipment Date" <> 0D then
                SigmaVw.ShipmentDate := "Shipment Date"
            else
                if SalesHeader."Shipment Date" <> 0D then
                    SigmaVw.ShipmentDate := SalesHeader."Shipment Date"
                else
                    SigmaVw.ShipmentDate := 0D;

            if "Requested Delivery Date" <> 0D then
                SigmaVw.RequestedDeliveryDate := "Requested Delivery Date"
            else
                if SalesHeader."Requested Delivery Date" <> 0D then
                    SigmaVw.RequestedDeliveryDate := SalesHeader."Requested Delivery Date"
                else
                    SigmaVw.RequestedDeliveryDate := 0D;
            // iCepts WRW 03.28.16 - RFM8742 Requested Delivery Date and Shipment Date to CAT2 Download - End

            SigmaVw.Modify;
            if not DeleteLine then begin
                SigmaVWDocNo := "Document No.";
                SigmaVWLineNo := "Line No.";
                SigmaVWCustID := "Sell-to Customer No.";
                SigmaVWOrderDate := "Shipment Date";
                SigmaVWProduct := "No.";
                SigmaVWQty := "Quantity 2";
                SigmaVWPONo := SalesHeader."External Document No.";
                SigmaVWLastInserted := CurrentDatetime;
                SigmaVWLastInsUser := UserId;
                CAT2CFSCreated := true; // iCepts BRB 04.17.13

                // iCepts WRW 03.28.16 - RFM8742 Requested Delivery Date and Shipment Date to CAT2 Download - Start
                if "Shipment Date" <> 0D then
                    SigmaVw.ShipmentDate := "Shipment Date"
                else
                    if SalesHeader."Shipment Date" <> 0D then
                        SigmaVw.ShipmentDate := SalesHeader."Shipment Date"
                    else
                        SigmaVw.ShipmentDate := 0D;

                if "Requested Delivery Date" <> 0D then
                    SigmaVw.RequestedDeliveryDate := "Requested Delivery Date"
                else
                    if SalesHeader."Requested Delivery Date" <> 0D then
                        SigmaVw.RequestedDeliveryDate := SalesHeader."Requested Delivery Date"
                    else
                        SigmaVw.RequestedDeliveryDate := 0D;
                // iCepts WRW 03.28.16 - RFM8742 Requested Delivery Date and Shipment Date to CAT2 Download - End

                Modify;
            end;
        end else begin
            SigmaVw.Init;
            SigmaVw.UniqueRec := "Document No.";
            SigmaVw.Identity := "Line No.";
            SigmaVw.CompanyCode := '30';
            SigmaVw.WarehouseCode := locLocation.CAT2WarehouseCode; // iCepts BRB 07.26.13 - Set Code on Location table

            SigmaVw.InterfaceCreate := CurrentDatetime;
            SigmaVw.StatusFlag := 'U';
            SigmaVw.DocumentNo := "Document No.";
            SigmaVw.LineNo := "Line No.";
            SigmaVw.Product := "No.";
            SigmaVw.StatusOrder := 'U';
            if DeleteLine then begin
                SigmaVw.Quantity := 0;
                SigmaVw.StatusItem := 'S';
            end else
                SigmaVw.Quantity := "Quantity 2";
            SigmaVw.CustomerCode := CopyStr("Sell-to Customer No.", 1, 10); // iCepts BRB 01.15.13 - max 10 characters
            SigmaVw.ShipToCode := Format(ShipToAddress."CAT Ship-to Code"); // iCepts BRB 08.10.12 - "Ship-to Code";
            SigmaVw.OrderDate := "Shipment Date"; // iCepts BRB 10.07.09 - was SalesHeader."Order Date";
            SigmaVw.TypeOfOrder := 'D';
            SigmaVw.PONumber := SalesHeader."External Document No.";
            SigmaVw.StatusItem := 'U';
            SigmaVw.OrderClass := 'C';

            // iCepts WRW 03.28.16 - RFM8742 Requested Delivery Date and Shipment Date to CAT2 Download - Start
            if "Shipment Date" <> 0D then
                SigmaVw.ShipmentDate := "Shipment Date"
            else
                if SalesHeader."Shipment Date" <> 0D then
                    SigmaVw.ShipmentDate := SalesHeader."Shipment Date"
                else
                    SigmaVw.ShipmentDate := 0D;

            if "Requested Delivery Date" <> 0D then
                SigmaVw.RequestedDeliveryDate := "Requested Delivery Date"
            else
                if SalesHeader."Requested Delivery Date" <> 0D then
                    SigmaVw.RequestedDeliveryDate := SalesHeader."Requested Delivery Date"
                else
                    SigmaVw.RequestedDeliveryDate := 0D;
            // iCepts WRW 03.28.16 - RFM8742 Requested Delivery Date and Shipment Date to CAT2 Download - End

            SigmaVw.Insert;
            if not DeleteLine then begin
                SigmaVWDocNo := "Document No.";
                SigmaVWLineNo := "Line No.";
                SigmaVWCustID := "Sell-to Customer No.";
                SigmaVWOrderDate := "Shipment Date";
                SigmaVWProduct := "No.";
                SigmaVWQty := "Quantity 2";
                SigmaVWPONo := SalesHeader."External Document No.";
                SigmaVWLastInserted := CurrentDatetime;
                SigmaVWLastInsUser := UserId;
                CAT2CFSCreated := true; // iCepts BRB 04.17.13

                // iCepts WRW 03.28.16 - RFM8742 Requested Delivery Date and Shipment Date to CAT2 Download - Start
                if "Shipment Date" <> 0D then
                    SigmaVw.ShipmentDate := "Shipment Date"
                else
                    if SalesHeader."Shipment Date" <> 0D then
                        SigmaVw.ShipmentDate := SalesHeader."Shipment Date"
                    else
                        SigmaVw.ShipmentDate := 0D;

                if "Requested Delivery Date" <> 0D then
                    SigmaVw.RequestedDeliveryDate := "Requested Delivery Date"
                else
                    if SalesHeader."Requested Delivery Date" <> 0D then
                        SigmaVw.RequestedDeliveryDate := SalesHeader."Requested Delivery Date"
                    else
                        SigmaVw.RequestedDeliveryDate := 0D;
                // iCepts WRW 03.28.16 - RFM8742 Requested Delivery Date and Shipment Date to CAT2 Download - End

                Modify;
            end;
        end;
    end;


    procedure SetFromEDI()
    begin
        // iCepts BRB 06.30.14 - RFM8212 Set from EDI
        FromEDI := true;
    end;

    //Unsupported feature: Deletion (VariableCollection) on "CheckItemAvailable(PROCEDURE 4).CalledByDateField(Variable 1001)".


    var
        GenPostingSetup: Record "General Posting Setup";
        GLAcc: Record "G/L Account";

        ShippingAgent: Record "Shipping Agent";
        SalesHeader: Record "Sales Header";
        Currency: Record Currency;

        RunFromEDI: Boolean;
        EDITemp: Boolean;

        SecondQtyMgt: Codeunit SecondQtyManagement;
        CreditChecked: Boolean;
        FromSigma: Boolean;
        LotInNAV: Boolean;
        FromHeader: Boolean;
        SalesHeader2: Record "Sales Header";
        FromEDI: Boolean;
        TextDuplicate: label 'Item %1 is already on this document\Do you want to continue?';
}

