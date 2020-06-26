TableExtension 50132 tableextension50132 extends "Return Receipt Line" 
{
    fields
    {
        field(50001;"Quantity 2";Decimal)
        {
            Caption = 'Quantity 2';
            DecimalPlaces = 0:5;
            Description = 'icepts1.00';
        }
        field(50002;"Unit of Measure Code 2";Code[10])
        {
            Caption = 'Unit of Measure Code 2';
            Description = 'icepts1.00';
            TableRelation = if (Type=const(Item)) "Item Unit of Measure".Code where ("Item No."=field("No."))
                            else "Unit of Measure";
        }
        field(14000351;"EDI Item Cross Ref.";Code[20])
        {
            Caption = 'EDI Item Cross Ref.';
        }
        field(14000352;"EDI Unit of Measure";Code[10])
        {
            Caption = 'EDI Unit of Measure';
        }
        field(14000353;"EDI Unit Price";Decimal)
        {
            Caption = 'EDI Unit Price';
        }
        field(14000354;"EDI Price Discrepancy";Boolean)
        {
            Caption = 'EDI Price Discrepancy';
        }
        field(14000355;"EDI Segment Group";Integer)
        {
            Caption = 'EDI Segment Group';
            Editable = false;
        }
        field(14000356;"EDI Original Qty.";Decimal)
        {
            Caption = 'EDI Original Qty.';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(14000366;"EDI Code";Code[20])
        {
            Caption = 'EDI Code';
        }
        field(14000602;"Over Receive";Boolean)
        {
            Caption = 'Over Receive';
            Editable = false;
        }
        field(14000603;"Over Receive Verified";Boolean)
        {
            Caption = 'Over Receive Verified';
        }
    }


    //Unsupported feature: Code Modification on "InsertInvLineFromRetRcptLine(PROCEDURE 2)".

    //procedure InsertInvLineFromRetRcptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SETRANGE("Document No.","Document No.");

        TempSalesLine := SalesLine;
        #4..82
            SalesLine."Allow Line Disc." := SalesOrderLine."Allow Line Disc.";
            SalesLine."Allow Invoice Disc." := SalesOrderLine."Allow Invoice Disc.";
            SalesLine.VALIDATE("Line Discount %",SalesOrderLine."Line Discount %");
            IF SalesOrderLine.Quantity = 0 THEN
              SalesLine.VALIDATE("Inv. Discount Amount",0)
            ELSE
              SalesLine.VALIDATE(
                "Inv. Discount Amount",
                ROUND(
                  SalesOrderLine."Inv. Discount Amount" * SalesLine.Quantity / SalesOrderLine.Quantity,
                  Currency."Amount Rounding Precision"));
          END;
          SalesLine."Attached to Line No." :=
            TransferOldExtLines.TransferExtendedText(
        #97..113
          SalesOrderHeader."Get Shipment Used" := TRUE;
          SalesOrderHeader.MODIFY;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..85
            IF NOT SalesSetup."Calc. Inv. Discount" THEN
              SalesLine.VALIDATE("Inv. Discount Amount",SalesOrderLine."Inv. Discount Amount");
        #94..116
        */
    //end;
}

