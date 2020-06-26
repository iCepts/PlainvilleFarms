TableExtension 50130 tableextension50130 extends "Service Header" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Bill-to Customer No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF (xRec."Bill-to Customer No." <> "Bill-to Customer No.") AND
               (xRec."Bill-to Customer No." <> '')
            THEN BEGIN
            #4..19
                  ELSE
                    ServLine.TESTFIELD("Shipment No.",'');
                ServLine.RESET
              END ELSE
                "Bill-to Customer No." := xRec."Bill-to Customer No.";
            END;

            GetCust("Bill-to Customer No.");
            #28..94

            IF NOT SkipBillToContact THEN
              UpdateBillToCont("Bill-to Customer No.");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..22
              END ELSE BEGIN
                "Bill-to Customer No." := xRec."Bill-to Customer No.";
                IF "Customer Posting Group" <> '' THEN
                  EXIT;
              END;
            #25..97
            */
        //end;
        field(50000;"Troubleshooting Code";Code[20])
        {
            TableRelation = "Troubleshooting Header";
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"Service Zone Code")
        // {
        // }
    }


    //Unsupported feature: Code Modification on "RecreateServLines(PROCEDURE 2)".

    //procedure RecreateServLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ServLineExists THEN BEGIN
          IF HideValidationDialog OR NOT GUIALLOWED THEN
            Confirmed := TRUE
        #4..51
                  UNTIL TempServDocReg.NEXT = 0;
              END;

              CreateServiceLines(TempServLine,ExtendedTextAdded);
              TempServLine.SETRANGE(Type);
              TempServLine.DELETEALL;
            END;
          END ELSE
            ERROR('');
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..54
              ServLine.INIT;
              ServLine."Line No." := 0;
              TempServLine.FIND('-');
              ExtendedTextAdded := FALSE;
              REPEAT
                IF TempServLine."Attached to Line No." = 0 THEN BEGIN
                  ServLine.INIT;
                  ServLine.SetHideReplacementDialog(TRUE);
                  ServLine.SetHideCostWarning(TRUE);
                  ServLine."Line No." := ServLine."Line No." + 10000;
                  ServLine.VALIDATE(Type,TempServLine.Type);
                  IF TempServLine."No." <> '' THEN BEGIN
                    ServLine.VALIDATE("No.",TempServLine."No.");
                    IF ServLine.Type <> ServLine.Type::" " THEN BEGIN
                      ServLine.VALIDATE("Unit of Measure Code",TempServLine."Unit of Measure Code");
                      ServLine.VALIDATE("Variant Code",TempServLine."Variant Code");
                      IF TempServLine.Quantity <> 0 THEN
                        ServLine.VALIDATE(Quantity,TempServLine.Quantity);
                    END;
                  END;

                  ServLine."Serv. Price Adjmt. Gr. Code" := TempServLine."Serv. Price Adjmt. Gr. Code";
                  ServLine."Document No." := TempServLine."Document No.";
                  ServLine."Service Item No." := TempServLine."Service Item No.";
                  ServLine."Appl.-to Service Entry" := TempServLine."Appl.-to Service Entry";
                  ServLine."Service Item Line No." := TempServLine."Service Item Line No.";
                  ServLine.VALIDATE(Description,TempServLine.Description);
                  ServLine.VALIDATE("Description 2",TempServLine."Description 2");

                  IF TempServLine."No." <> '' THEN BEGIN
                    TempLinkToServItem := "Link Service to Service Item";
                    IF "Link Service to Service Item" THEN BEGIN
                      "Link Service to Service Item" := FALSE;
                      MODIFY(TRUE);
                    END;
                    ServLine."Spare Part Action" := TempServLine."Spare Part Action";
                    ServLine."Component Line No." := TempServLine."Component Line No.";
                    ServLine."Replaced Item No." := TempServLine."Replaced Item No.";
                    ServLine.VALIDATE("Work Type Code",TempServLine."Work Type Code");

                    ServLine."Location Code" := TempServLine."Location Code";
                    IF ServLine.Type <> ServLine.Type::" " THEN BEGIN
                      IF ServLine.Type = ServLine.Type::Item THEN BEGIN
                        ServLine.VALIDATE("Variant Code",TempServLine."Variant Code");
                        IF ServLine."Location Code" <> '' THEN
                          ServLine."Bin Code" := TempServLine."Bin Code";
                      END;
                      ServLine."Fault Reason Code" := TempServLine."Fault Reason Code";
                      ServLine."Exclude Warranty" := TempServLine."Exclude Warranty";
                      ServLine."Exclude Contract Discount" := TempServLine."Exclude Contract Discount";
                      ServLine.VALIDATE("Contract No.",TempServLine."Contract No.");
                      ServLine.VALIDATE(Warranty,TempServLine.Warranty);
                    END;
                    ServLine."Fault Area Code" := TempServLine."Fault Area Code";
                    ServLine."Symptom Code" := TempServLine."Symptom Code";
                    ServLine."Resolution Code" := TempServLine."Resolution Code";
                    ServLine."Fault Code" := TempServLine."Fault Code";
                  END;
                  "Link Service to Service Item" := TempLinkToServItem;

                  ServLine.INSERT;
                  ExtendedTextAdded := FALSE;
                END ELSE
                  IF NOT ExtendedTextAdded THEN BEGIN
                    TransferExtendedText.ServCheckIfAnyExtText(ServLine,TRUE);
                    TransferExtendedText.InsertServExtText(ServLine);
                    ServLine.FIND('+');
                    ExtendedTextAdded := TRUE;
                  END;
                RecreateReservEntry(TempServLine,ServLine."Line No.",FALSE);
              UNTIL TempServLine.NEXT = 0;

        #56..61
        */
    //end;
}

