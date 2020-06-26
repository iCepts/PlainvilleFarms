TableExtension 50109 tableextension50109 extends "Purchase Line"
{
    fields
    {
        modify("Unit of Measure Code")
        {
            TableRelation = if (Type = const(Item)) "Item Unit of Measure".Code where("Item No." = field("No."))
            else
            "Unit of Measure";
        }

        //Unsupported feature: Code Modification on ""No."(Field 6).OnValidate".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        TESTFIELD("Qty. Rcd. Not Invoiced",0);
        TESTFIELD("Quantity Received",0);
        #4..156
                GetItemTranslation;

              "Unit of Measure Code" := Item."Purch. Unit of Measure";
            END;
          Type::"3":
            ERROR(Text003);
        #163..185
            END;
        END;

        IF NOT (Type IN [Type::" ",Type::"Fixed Asset"]) THEN
          VALIDATE("VAT Prod. Posting Group");

        UpdatePrepmtSetupFields;

        IF Type <> Type::" " THEN BEGIN
          Quantity := xRec.Quantity;
          VALIDATE("Unit of Measure Code");
          IF Quantity <> 0 THEN BEGIN
        #198..227
          CreateTempJobJnlLine(TRUE);
          UpdateJobPrices;
        END
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..159

               //RFM6066
              "Unit of Measure Code 2" := Item."Base Unit of Measure 2";
        #160..188
        VALIDATE("Prepayment %");

        IF Type <> Type::" " THEN BEGIN
          IF Type <> Type::"Fixed Asset" THEN
            VALIDATE("VAT Prod. Posting Group");
        #195..230
        */
        //end;


        //Unsupported feature: Code Modification on ""Shortcut Dimension 2 Code"(Field 41).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");

        // iCepts WRW 04.18.12 - Display message if Line Branch is different than Header Branch - Start
        IF PurchaseHeader2.GET("Document Type","Document No.") THEN
          IF PurchaseHeader2."Shortcut Dimension 2 Code" <> "Shortcut Dimension 2 Code" THEN
            MESSAGE('Line branch code does not match the header branch code of document.');
        // iCepts WRW 04.18.12 - Display message if Line Branch is different than Header Branch - End
        */
        //end;


        //Unsupported feature: Code Modification on ""Blanket Order Line No."(Field 98).OnValidate".

        //trigger "(Field 98)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Quantity Received",0);
        IF "Blanket Order Line No." <> 0 THEN BEGIN
          PurchLine2.GET("Document Type"::"Blanket Order","Blanket Order No.","Blanket Order Line No.");
          PurchLine2.TESTFIELD(Type,Type);
          PurchLine2.TESTFIELD("No.","No.");
          PurchLine2.TESTFIELD("Pay-to Vendor No.","Pay-to Vendor No.");
          PurchLine2.TESTFIELD("Buy-from Vendor No.","Buy-from Vendor No.");
          VALIDATE("Location Code",PurchLine2."Location Code");
          VALIDATE("Unit of Measure Code",PurchLine2."Unit of Measure Code");
          VALIDATE("Direct Unit Cost",PurchLine2."Direct Unit Cost");
          VALIDATE("Line Discount %",PurchLine2."Line Discount %");
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..7
          VALIDATE("Direct Unit Cost",PurchLine2."Direct Unit Cost");
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
          GenPostingSetup.GET("Gen. Bus. Posting Group","Gen. Prod. Posting Group");
          IF GenPostingSetup."Purch. Prepayments Account" <> '' THEN BEGIN
            GLAcc.GET(GenPostingSetup."Purch. Prepayments Account");
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
          FIELDERROR("Prepayment %",STRSUBSTNO(Text045,xRec."Prepayment %"));
        IF Type <> Type::" " THEN
          UpdateAmounts;
        */
        //end;
        field(50001; "Quantity 2"; Decimal)
        {
            Caption = 'Quantity 2';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestStatusOpen;

                SecondQtyMgt.SecondQtyCheck(Quantity, "Quantity 2", "No.");
            end;
        }
        field(50002; "Unit of Measure Code 2"; Code[10])
        {
            Caption = 'Unit of Measure Code 2';
            Editable = false;

            trigger OnValidate()
            var
                UnitOfMeasureTranslation: Record "Unit of Measure Translation";
            begin
            end;
        }
        field(50003; "Qty. to Receive 2"; Decimal)
        {
            Caption = 'Qty. to Receive 2';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestStatusOpen;

                SecondQtyMgt.SecondQtyCheck("Qty. to Receive", "Qty. to Receive 2", "No.");
            end;
        }
        field(50004; "Return Qty. to Ship 2"; Decimal)
        {
            Caption = 'Return Qty. to Ship 2';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TestStatusOpen;

                SecondQtyMgt.SecondQtyCheck("Return Qty. to Ship", "Return Qty. to Ship 2", "No.");
            end;
        }
        field(50050; CAT2POVWUpdated; Boolean)
        {
        }
        field(50051; CAT2POVWDocNo; Code[20])
        {
        }
        field(50052; CAT2POVWLineNo; Integer)
        {
        }
        field(50053; CAT2POVWVendID; Code[20])
        {
        }
        field(50054; CAT2POVWOrderDate; Date)
        {
        }
        field(50055; CAT2POVWProduct; Code[20])
        {
        }
        field(50056; CAT2POVWQty; Decimal)
        {
        }
        field(50057; CAT2POVWPONo; Code[20])
        {
        }
        field(50058; CAT2POVWLastInserted; DateTime)
        {
        }
        field(50059; CAT2POVWLastInsUser; Code[20])
        {
        }
        field(50060; CAT2POVWLastModified; DateTime)
        {
        }
        field(50061; CAT2POVWLastModUser; Code[20])
        {
        }
        field(14000351; "EDI Unit Cost"; Decimal)
        {
            Caption = 'EDI Unit Cost';
        }
        field(14000352; "EDI Cost Discrepancy"; Boolean)
        {
            Caption = 'EDI Cost Discrepancy';
        }
        field(14000355; "EDI Segment Group"; Integer)
        {
            Caption = 'EDI Segment Group';
            Editable = false;
        }
        field(14000601; "Shipping Charge"; Boolean)
        {
            Caption = 'Shipping Charge';
        }
        field(14000602; "Over Receive"; Boolean)
        {
            Caption = 'Over Receive';
            Editable = false;
        }
        field(14000603; "Over Receive Verified"; Boolean)
        {
            Caption = 'Over Receive Verified';

            trigger OnValidate()
            begin
                if "Over Receive Verified" then
                    TestField("Over Receive");
            end;
        }
        field(14000701; "E-Ship Whse. Outst. Qty (Base)"; Decimal)
        {
            CalcFormula = sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" where("Activity Type" = filter(Pick),
                                                                                         "Source Type" = const(39),
                                                                                         "Source Subtype" = field("Document Type"),
                                                                                         "Source No." = field("Document No."),
                                                                                         "Source Line No." = field("Line No."),
                                                                                         "Action Type" = filter(" " | Take),
                                                                                         "Breakbulk No." = filter(0)));
            Caption = 'E-Ship Whse. Outst. Qty (Base)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14000702; "E-Ship Whse. Outstanding Qty."; Decimal)
        {
            CalcFormula = sum ("Warehouse Activity Line"."Qty. Outstanding" where("Activity Type" = filter(Pick),
                                                                                  "Source Type" = const(39),
                                                                                  "Source Subtype" = field("Document Type"),
                                                                                  "Source No." = field("Document No."),
                                                                                  "Source Line No." = field("Line No."),
                                                                                  "Action Type" = filter(" " | Take),
                                                                                  "Breakbulk No." = filter(0)));
            Caption = 'E-Ship Whse. Outstanding Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(14000703; "E-Ship Whse. Ship. Qty (Base)"; Decimal)
        {
            CalcFormula = sum ("Warehouse Shipment Line"."Qty. to Ship (Base)" where("Source Type" = const(39),
                                                                                     "Source Subtype" = field("Document Type"),
                                                                                     "Source No." = field("Document No."),
                                                                                     "Source Line No." = field("Line No.")));
            Caption = 'E-Ship Whse. Ship. Qty (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(14000704; "E-Ship Whse. Shipment Qty."; Decimal)
        {
            CalcFormula = sum ("Warehouse Shipment Line"."Qty. to Ship" where("Source Type" = const(39),
                                                                              "Source Subtype" = field("Document Type"),
                                                                              "Source No." = field("Document No."),
                                                                              "Source Line No." = field("Line No.")));
            Caption = 'E-Ship Whse. Shipment Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(14000705; "E-Ship Invt. Outst. Qty (Base)"; Decimal)
        {
            CalcFormula = sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" where("Activity Type" = filter("Invt. Pick"),
                                                                                         "Source Type" = const(39),
                                                                                         "Source Subtype" = field("Document Type"),
                                                                                         "Source No." = field("Document No."),
                                                                                         "Source Line No." = field("Line No."),
                                                                                         "Action Type" = filter(" " | Take),
                                                                                         "Breakbulk No." = filter(0)));
            Caption = 'E-Ship Invt. Outst. Qty (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(14000706; "E-Ship Invt. Outstanding Qty."; Decimal)
        {
            CalcFormula = sum ("Warehouse Activity Line"."Qty. Outstanding" where("Activity Type" = filter("Invt. Pick"),
                                                                                  "Source Type" = const(39),
                                                                                  "Source Subtype" = field("Document Type"),
                                                                                  "Source No." = field("Document No."),
                                                                                  "Source Line No." = field("Line No."),
                                                                                  "Action Type" = filter(" " | Take),
                                                                                  "Breakbulk No." = filter(0)));
            Caption = 'E-Ship Invt. Outstanding Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"Document Type","Document No.",Type,"No.","Variant Code","Drop Shipment","Location Code")
        // {
        // SumIndexFields = "Qty. to Receive (Base)","Outstanding Qty. (Base)","Return Qty. to Ship (Base)";
        // }
        // Unsupported feature: Key containing base fields
        // key(Key2;"Document Type","Expected Receipt Date")
        // {
        // }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestStatusOpen;
    CheckForTaxDifferences;
    IF NOT StatusCheckSuspended AND (PurchHeader.Status = PurchHeader.Status::Released) AND
    #4..17
    END;

    IF ("Document Type" = "Document Type"::Order) AND (Quantity <> "Quantity Invoiced") THEN
      TESTFIELD("Prepmt. Amt. Inv.","Prepmt Amt Deducted");

    IF "Sales Order Line No." <> 0 THEN BEGIN
      LOCKTABLE;
    #25..62
    IF Type = Type::"Charge (Item)" THEN
      DeleteChargeChargeAssgnt("Document Type","Document No.","Line No.");

    IF "Line No." <> 0 THEN BEGIN
      PurchLine2.RESET;
      PurchLine2.SETRANGE("Document Type","Document Type");
    #69..77
    IF NOT PurchCommentLine.ISEMPTY THEN
      PurchCommentLine.DELETEALL;

    IF ("Line No." <> 0) AND ("Attached to Line No." = 0) THEN BEGIN
      PurchLine2.RESET;
      PurchLine2.SETRANGE("Document Type","Document Type");
      PurchLine2.SETRANGE("Document No.","Document No.");
    #85..87
        PurchLine2.MODIFY;
      END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..20
      TESTFIELD("Prepmt. Amt. Inv.",0);
    #22..65
    // iCepts BRB 01.13.14 - Set Qty to 0 and resend to CAT2 :START
    GetPurchHeader;
    IF PurchHeader.SendToCAT2 THEN BEGIN
      Quantity := 0;
      fSendtoCAT2;
    END;
    // iCepts BRB 01.13.14 - Set Qty to 0 and resend to CAT2 :END

    #66..80
    IF "Line No." <> 0 THEN BEGIN
    #82..90
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateVATAmounts(PROCEDURE 38)".

    //procedure UpdateVATAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetPurchHeader;
    PurchLine2.SETRANGE("Document Type","Document Type");
    PurchLine2.SETRANGE("Document No.","Document No.");
    #4..28
         (("VAT Calculation Type" IN
           ["VAT Calculation Type"::"Normal VAT","VAT Calculation Type"::"Reverse Charge VAT"]) AND ("VAT %" <> 0))
      THEN
        IF NOT PurchLine2.ISEMPTY THEN BEGIN
          PurchLine2.CALCSUMS("Line Amount","Inv. Discount Amount",Amount,"Amount Including VAT","Quantity (Base)");
          TotalLineAmount := PurchLine2."Line Amount";
          TotalInvDiscAmount := PurchLine2."Inv. Discount Amount";
          TotalAmount := PurchLine2.Amount;
          TotalAmountInclVAT := PurchLine2."Amount Including VAT";
          TotalQuantityBase := PurchLine2."Quantity (Base)";
        END;

      IF PurchHeader."Prices Including VAT" THEN
        CASE "VAT Calculation Type" OF
    #43..132
            END;
        END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..31
        IF PurchLine2.FINDSET THEN
          REPEAT
            TotalLineAmount := TotalLineAmount + PurchLine2."Line Amount";
            TotalInvDiscAmount := TotalInvDiscAmount + PurchLine2."Inv. Discount Amount";
            TotalAmount := TotalAmount + PurchLine2.Amount;
            TotalAmountInclVAT := TotalAmountInclVAT + PurchLine2."Amount Including VAT";
            TotalQuantityBase := TotalQuantityBase + PurchLine2."Quantity (Base)";
          UNTIL PurchLine2.NEXT = 0;
    #40..135
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
        TableID,No,SourceCodeSetup.Purchases,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        PurchHeader."Dimension Set ID",DATABASE::Vendor);
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..17

    // iCepts WRW 04.18.12 - Display message if Line Branch is different than Header Branch - Start
    GetPurchHeader;
    IF PurchHeader."Shortcut Dimension 2 Code" <> "Shortcut Dimension 2 Code" THEN
      MESSAGE('Line branch code does not match the header branch code of document.');
    // iCepts WRW 04.18.12 - Display message if Line Branch is different than Header Branch - End
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateItemChargeAssgnt(PROCEDURE 5807)".

    //procedure UpdateItemChargeAssgnt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CALCFIELDS("Qty. Assigned","Qty. to Assign");
    IF ABS("Quantity Invoiced") > ABS(("Qty. Assigned" + "Qty. to Assign")) THEN
      ERROR(Text032,FIELDCAPTION("Quantity Invoiced"),FIELDCAPTION("Qty. Assigned"),FIELDCAPTION("Qty. to Assign"));
    #4..25

    IF ItemChargeAssgntPurch.FINDSET THEN BEGIN
      GetPurchHeader;
      TotalAmtToAssign := CalcTotalAmtToAssign(TotalQtyToAssign);
      REPEAT
        ShareOfVAT := 1;
        IF PurchHeader."Prices Including VAT" THEN
    #33..49
      UNTIL ItemChargeAssgntPurch.NEXT = 0;
      CALCFIELDS("Qty. to Assign");
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..28
      IF PurchHeader."Prices Including VAT" THEN
        TotalAmtToAssign :=
          ROUND(("Line Amount" - "Inv. Discount Amount") / (1 + "VAT %" / 100),
            Currency."Amount Rounding Precision")
      ELSE
        TotalAmtToAssign := "Line Amount" - "Inv. Discount Amount";
    #30..52
    */
    //end;

    procedure SetRunFromEDI(Start: Boolean)
    begin
        if Start then
            RunFromEDI := true
        else
            RunFromEDI := false;
    end;

    procedure CalcEShipWhseOutstQtyBase(LocationPacking: Boolean; LocationCode: Code[10]) QtyBase: Decimal
    var
        PurchLine: Record "Purchase Line";
        LineQtyBase: Decimal;
    begin
        QtyBase := 0;

        PurchLine.Copy(Rec);
        if LocationPacking then
            PurchLine.SetRange("Location Code", LocationCode);
        if PurchLine.Find('-') then
            repeat
                if PurchLine."Document Type" = PurchLine."document type"::"Return Order" then
                    LineQtyBase := PurchLine."Return Qty. to Ship (Base)"
                else
                    LineQtyBase := PurchLine."Qty. to Receive (Base)";
                PurchLine.CalcFields("E-Ship Invt. Outst. Qty (Base)");
                if (LineQtyBase = 0) or (PurchLine."E-Ship Invt. Outst. Qty (Base)" <> 0)
                then begin
                    PurchLine.CalcFields(
                      "E-Ship Whse. Outst. Qty (Base)", "E-Ship Whse. Ship. Qty (Base)");
                    QtyBase :=
                      QtyBase +
                      PurchLine."E-Ship Whse. Outst. Qty (Base)" + PurchLine."E-Ship Whse. Ship. Qty (Base)" +
                      PurchLine."E-Ship Invt. Outst. Qty (Base)";
                end;
            until PurchLine.Next = 0;
    end;

    procedure AllowInWarehousePosting(): Boolean
    begin
        exit("Shipping Charge");
    end;

    procedure fSendtoCAT2()
    var
        CAT2POVW: Record CAT2POVW;
        locLocation: Record Location;
        CAT2ImportsVW: Record CAT2ImportsVW;
    begin
        if "Document Type" <> "document type"::Order then
            exit;
        if Type <> Type::Item then
            exit;
        // iCepts BRB 11.17.09 - Make sure Line No. is set
        if "Line No." = 0 then
            exit;
        GetPurchHeader;

        if not locLocation.Get("Location Code") then
            Clear(locLocation);
        if CAT2POVW.Get("Document No." + Format("Line No." / 1000)) then begin
            CAT2POVW.CompanyCode := '30';
            CAT2POVW.WarehouseCode := locLocation.CAT2WarehouseCode;
            CAT2POVW.PONumber := "Document No.";
            // iCepts BRB 03.21.14 - Only send 10 characters of Vendor No. to CAT2
            if StrLen("Buy-from Vendor No.") > 10 then
                CAT2POVW.VendorNumber := CopyStr(CAT2POVW.VendorNumber, 1, 10)
            else
                CAT2POVW.VendorNumber := "Buy-from Vendor No.";
            CAT2POVW.ItemCode := "No.";
            CAT2POVW.PurchasedQty := Quantity;
            CAT2POVW.PurchaseDateDT := "Order Date";
            if PurchHeader."Promised Receipt Date" = 0D then
                PurchHeader."Promised Receipt Date" := Today;
            CAT2POVW.PromiseDateDT := PurchHeader."Promised Receipt Date";
            CAT2POVW.LineNumber := "Line No." / 1000;
            CAT2POVW.ERP_RecordID := "Document No.";
            CAT2POVW.InterfaceCreateDateTime := CurrentDatetime;
            CAT2POVW.Modify;

            CAT2POVWDocNo := "Document No.";
            CAT2POVWLineNo := "Line No." / 1000;
            CAT2POVWVendID := "Buy-from Vendor No.";
            // iCepts BRB 06.04.14 - Only send 10 characters of Vendor No. to CAT2
            if StrLen("Buy-from Vendor No.") > 10 then
                CAT2POVWVendID := CopyStr(CAT2POVWVendID, 1, 10);
            CAT2POVWOrderDate := "Order Date";
            CAT2POVWProduct := "No.";
            CAT2POVWQty := Quantity;
            CAT2POVWLastInserted := CurrentDatetime;
            CAT2POVWLastInsUser := UserId;
            Modify;

        end else begin
            CAT2POVW.Init;
            CAT2POVW.RecordID := "Document No." + Format("Line No." / 1000);
            CAT2POVW.CompanyCode := '30';     //11.15.13dxd
            CAT2POVW.WarehouseCode := locLocation.CAT2WarehouseCode;
            CAT2POVW.PONumber := "Document No.";
            // iCepts BRB 06.04.14 - Only send 10 characters of Vendor No. to CAT2
            if StrLen("Buy-from Vendor No.") > 10 then
                CAT2POVW.VendorNumber := CopyStr(CAT2POVW.VendorNumber, 1, 10)
            else
                CAT2POVW.VendorNumber := "Buy-from Vendor No.";
            CAT2POVW.ItemCode := "No.";
            CAT2POVW.PurchasedQty := Quantity;
            CAT2POVW.PurchaseDateDT := "Order Date";
            if PurchHeader."Promised Receipt Date" = 0D then
                PurchHeader."Promised Receipt Date" := Today;
            CAT2POVW.PromiseDateDT := PurchHeader."Promised Receipt Date";
            CAT2POVW.LineNumber := "Line No." / 1000;
            CAT2POVW.ERP_RecordID := "Document No.";
            CAT2POVW.InterfaceCreateDateTime := CurrentDatetime;
            CAT2POVW.Insert;

            CAT2POVWDocNo := "Document No.";
            CAT2POVWLineNo := "Line No.";
            CAT2POVWVendID := "Buy-from Vendor No.";
            // iCepts BRB 03.21.14 - Only send 10 characters of Vendor No. to CAT2
            if StrLen("Buy-from Vendor No.") > 10 then
                CAT2POVWVendID := CopyStr(CAT2POVWVendID, 1, 10);
            CAT2POVWOrderDate := "Order Date";
            CAT2POVWProduct := "No.";
            CAT2POVWQty := Quantity;
            CAT2POVWLastInserted := CurrentDatetime;
            CAT2POVWLastInsUser := UserId;
            Modify;

        end;

        CAT2ImportsVW.Reset;
        CAT2ImportsVW.SetCurrentkey(processid, status);
        CAT2ImportsVW.SetRange(processid, 'PUO');
        CAT2ImportsVW.SetRange(status, 'R');
        if not CAT2ImportsVW.FindFirst then begin
            CAT2ImportsVW.Init;
            CAT2ImportsVW.recordid := Format(CurrentDatetime);
            CAT2ImportsVW.CompanyCode := '30';
            CAT2ImportsVW.Warehouse := locLocation.CAT2WarehouseCode;
            CAT2ImportsVW.processid := 'PUO';
            CAT2ImportsVW.status := 'R';
            CAT2ImportsVW.InterfaceCreateDateTime := CurrentDatetime;
            CAT2ImportsVW.Insert;
        end;
    end;

    var
        GenPostingSetup: Record "General Posting Setup";
        GLAcc: Record "G/L Account";

        RunFromEDI: Boolean;

        SecondQtyMgt: Codeunit SecondQtyManagement;
        PurchaseHeader2: Record "Purchase Header";

        PurchHeader: Record "Purchase Header";
}

