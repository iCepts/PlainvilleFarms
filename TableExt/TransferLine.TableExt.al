TableExtension 50126 tableextension50126 extends "Transfer Line"
{
    fields
    {

        //Unsupported feature: Code Modification on ""Item No."(Field 3).OnValidate".

        //trigger "(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Quantity Shipped",0);
        IF CurrFieldNo <> 0 THEN
          TestStatusOpen;
        #4..30
        "Item Category Code" := Item."Item Category Code";
        "Product Group Code" := Item."Product Group Code";

        CreateDim(DATABASE::Item,"Item No.");
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..33
        //RFM6066 DRS 06/16/2008
        "Unit of Measure Code 2" := Item."Base Unit of Measure 2";

        CreateDim(DATABASE::Item,"Item No.");
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        field(50001; "Qty. to Ship 2"; Decimal)
        {
            Caption = 'Qty. to Ship 2';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                SecondQtyMgt.SecondQtyCheck("Qty. to Ship", "Qty. to Ship 2", "Item No.");
            end;
        }
        field(50002; "Qty. to Receive 2"; Decimal)
        {
            Caption = 'Qty. to Receive 2';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                SecondQtyMgt.SecondQtyCheck("Qty. to Receive", "Qty. to Receive 2", "Item No.");
            end;
        }
        field(50003; "Unit of Measure Code 2"; Code[10])
        {
            Caption = 'Unit of Measure Code 2';
            Editable = false;

            trigger OnValidate()
            var
                UnitOfMeasure: Record "Unit of Measure";
                UOMMgt: Codeunit "Unit of Measure Management";
            begin
            end;
        }
        field(14000351; "EDI Segment Group"; Integer)
        {
            Caption = 'EDI Segment Group';
            Editable = false;
        }
        field(14000701; "E-Ship Whse. Outst. Qty (Base)"; Decimal)
        {
            CalcFormula = sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" where("Activity Type" = filter(Pick),
                                                                                         "Source Type" = const(5741),
                                                                                         "Source Subtype" = const(0),
                                                                                         "Source No." = field("Document No."),
                                                                                         "Source Line No." = field("Line No."),
                                                                                         "Action Type" = filter(" " | Take),
                                                                                         "Breakbulk No." = filter(0)));
            Caption = 'E-Ship Whse. Outst. Qty (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(14000702; "E-Ship Whse. Outstanding Qty."; Decimal)
        {
            CalcFormula = sum ("Warehouse Activity Line"."Qty. Outstanding" where("Activity Type" = filter(Pick),
                                                                                  "Source Type" = const(5741),
                                                                                  "Source Subtype" = const(0),
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
            CalcFormula = sum ("Warehouse Shipment Line"."Qty. to Ship (Base)" where("Source Type" = const(5741),
                                                                                     "Source Subtype" = const(0),
                                                                                     "Source No." = field("Document No."),
                                                                                     "Source Line No." = field("Line No.")));
            Caption = 'E-Ship Whse. Ship. Qty (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(14000704; "E-Ship Whse. Shipment Qty."; Decimal)
        {
            CalcFormula = sum ("Warehouse Shipment Line"."Qty. to Ship" where("Source Type" = const(5741),
                                                                              "Source Subtype" = const(0),
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
                                                                                         "Source Type" = const(5741),
                                                                                         "Source Subtype" = const(0),
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
                                                                                  "Source Type" = const(5741),
                                                                                  "Source Subtype" = const(0),
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

        //Unsupported feature: Property Modification (SumIndexFields) on ""Transfer-to Code",Status,"Derived From Line No.","Item No.","Variant Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Receipt Date","In-Transit Code"(Key)".


        //Unsupported feature: Property Modification (SumIndexFields) on ""Transfer-from Code",Status,"Derived From Line No.","Item No.","Variant Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Shipment Date","In-Transit Code"(Key)".

    }


    //Unsupported feature: Code Modification on "InitQtyToReceive(PROCEDURE 2)".

    //procedure InitQtyToReceive();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Qty. to Receive" := "Qty. in Transit";
    "Qty. to Receive (Base)" := "Qty. in Transit (Base)";
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Qty. to Receive" := "Qty. in Transit";
    "Qty. to Receive (Base)" := "Qty. in Transit (Base)";
    InitQtyToReceive2;
    */
    //end;

    procedure CalcEShipWhseOutstQtyBase(LocationPacking: Boolean; LocationCode: Code[10]) QtyBase: Decimal
    var
        TransferLine: Record "Transfer Line";
    begin
        QtyBase := 0;

        TransferLine.Copy(Rec);
        if LocationPacking then
            TransferLine.SetRange("Transfer-from Code", LocationCode);
        if TransferLine.Find('-') then
            repeat
                TransferLine.CalcFields("E-Ship Invt. Outst. Qty (Base)");
                if (TransferLine."Qty. to Ship (Base)" = 0) or
                   (TransferLine."E-Ship Invt. Outst. Qty (Base)" <> 0)
                then begin
                    TransferLine.CalcFields(
                      "E-Ship Whse. Outst. Qty (Base)", "E-Ship Whse. Ship. Qty (Base)");
                    QtyBase :=
                      QtyBase +
                      TransferLine."E-Ship Whse. Outst. Qty (Base)" +
                      TransferLine."E-Ship Whse. Ship. Qty (Base)" +
                      TransferLine."E-Ship Invt. Outst. Qty (Base)";
                end;
            until TransferLine.Next = 0;
    end;

    procedure InitQtyToReceive2()
    begin
        "Qty. to Receive 2" := "Qty. to Ship 2";
    end;

    var
        SecondQtyMgt: Codeunit SecondQtyManagement;
}

