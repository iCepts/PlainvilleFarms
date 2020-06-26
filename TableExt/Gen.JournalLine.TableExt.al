TableExtension 50111 tableextension50111 extends "Gen. Journal Line" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Applies-to Doc. No."(Field 36).OnLookup".

        //trigger  No()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            xRec.Amount := Amount;
            xRec."Currency Code" := "Currency Code";
            xRec."Posting Date" := "Posting Date";
            #4..11
              AccType::Vendor:
                LookUpAppliesToDocVend(AccNo);
            END;
            SetJournalLineFieldsFromApplication;

            IF xRec.Amount <> 0 THEN
              IF NOT PaymentToleranceMgt.PmtTolGenJnl(Rec) THEN
                EXIT;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..14
            #16..19
            */
        //end;
        field(50000;"InterCompany Code";Code[10])
        {
            Description = 'RFM8650';
            TableRelation = "InterCompany Code"."IC Code";
        }
        field(50001;"Send Check Overnight";Boolean)
        {
            Description = 'RFM8761';
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"Journal Template Name","Journal Batch Name","Posting Date","External Document No.")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key2;"Journal Template Name","Journal Batch Name","Posting Date","Account No.","External Document No.")
        // {
        // }
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnModify".

    //trigger (Variable: DontCheckIfPrinted)()
    //Parameters and return type have not been exported.
    //begin
        /*
        */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TESTFIELD("Check Printed",FALSE);
        IF ("Applies-to ID" = '') AND (xRec."Applies-to ID" <> '') THEN
          ClearCustVendApplnEntry;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        //iCepts CJB 06.01.16 - RFM8761 Begin
        GenJnlTemplateLoc.GET("Journal Template Name");
        DontCheckIfPrinted:= FALSE;
        IF (GenJnlTemplateLoc.Type = GenJnlTemplateLoc.Type::Payments) THEN
          IF (OnlyChgdSendCheckOvaNight()) = TRUE THEN
            DontCheckIfPrinted:= TRUE;

        IF NOT(DontCheckIfPrinted) THEN
        //iCepts CJB 06.01.16 - RFM8761 End
          TESTFIELD("Check Printed",FALSE);

        IF ("Applies-to ID" = '') AND (xRec."Applies-to ID" <> '') THEN
          ClearCustVendApplnEntry;
        */
    //end;


    //Unsupported feature: Code Modification on "LookUpAppliesToDocCust(PROCEDURE 35)".

    //procedure LookUpAppliesToDocCust();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(CustLedgEntry);
        CustLedgEntry.SETCURRENTKEY("Customer No.",Open,Positive,"Due Date");
        IF AccNo <> '' THEN
        #4..38
            ELSE
              VALIDATE("Account No.",AccNo);
          END;
          SetAmountWithCustLedgEntry;
          "Applies-to Doc. Type" := CustLedgEntry."Document Type";
          "Applies-to Doc. No." := CustLedgEntry."Document No.";
          "Applies-to ID" := '';
        END;
        GetCreditCard;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..41
          IF "Currency Code" <> CustLedgEntry."Currency Code" THEN
            IF Amount = 0 THEN BEGIN
              FromCurrencyCode := GetShowCurrencyCode("Currency Code");
              ToCurrencyCode := GetShowCurrencyCode(CustLedgEntry."Currency Code");
              IF NOT
                 CONFIRM(
                   Text003,TRUE,FIELDCAPTION("Currency Code"),TABLECAPTION,FromCurrencyCode,ToCurrencyCode)
              THEN
                ERROR(Text005);
              VALIDATE("Currency Code",CustLedgEntry."Currency Code");
            END ELSE
              GenJnlApply.CheckAgainstApplnCurrency(
                "Currency Code",CustLedgEntry."Currency Code",
                GenJnlLine."Account Type"::Customer,TRUE);
          IF Amount = 0 THEN BEGIN
            CustLedgEntry.CALCFIELDS("Remaining Amount");
            IF CustLedgEntry."Amount to Apply" <> 0 THEN BEGIN
              IF PaymentToleranceMgt.CheckCalcPmtDiscGenJnlCust(Rec,CustLedgEntry,0,FALSE) THEN BEGIN
                IF ABS(CustLedgEntry."Amount to Apply") >=
                   ABS(CustLedgEntry."Remaining Amount" - CustLedgEntry."Remaining Pmt. Disc. Possible")
                THEN
                  Amount := -(CustLedgEntry."Remaining Amount" -
                              CustLedgEntry."Remaining Pmt. Disc. Possible")
                ELSE
                  Amount := -CustLedgEntry."Amount to Apply";
              END ELSE
                Amount := -CustLedgEntry."Amount to Apply";
            END ELSE BEGIN
              IF PaymentToleranceMgt.CheckCalcPmtDiscGenJnlCust(Rec,CustLedgEntry,0,FALSE) THEN
                Amount := -(CustLedgEntry."Remaining Amount" - CustLedgEntry."Remaining Pmt. Disc. Possible")
              ELSE
                Amount := -CustLedgEntry."Remaining Amount";
            END;
            IF "Bal. Account Type" IN ["Bal. Account Type"::Customer,"Bal. Account Type"::Vendor] THEN
              Amount := -Amount;
            VALIDATE(Amount);
          END;
        #43..47
        */
    //end;


    //Unsupported feature: Code Modification on "LookUpAppliesToDocVend(PROCEDURE 36)".

    //procedure LookUpAppliesToDocVend();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(VendLedgEntry);
        VendLedgEntry.SETCURRENTKEY("Vendor No.",Open,Positive,"Due Date");
        IF AccNo <> '' THEN
        #4..43
            ELSE
              VALIDATE("Account No.",AccNo);
          END;
          SetAmountWithVendLedgEntry;
          "Applies-to Doc. Type" := VendLedgEntry."Document Type";
          "Applies-to Doc. No." := VendLedgEntry."Document No.";
          "Applies-to ID" := '';
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..46
          IF "Currency Code" <> VendLedgEntry."Currency Code" THEN
            IF Amount = 0 THEN BEGIN
              FromCurrencyCode := GetShowCurrencyCode("Currency Code");
              ToCurrencyCode := GetShowCurrencyCode(VendLedgEntry."Currency Code");
              IF NOT
                 CONFIRM(
                   Text003,TRUE,FIELDCAPTION("Currency Code"),TABLECAPTION,FromCurrencyCode,ToCurrencyCode)
              THEN
                ERROR(Text005);
              VALIDATE("Currency Code",VendLedgEntry."Currency Code");
            END ELSE
              GenJnlApply.CheckAgainstApplnCurrency(
                "Currency Code",VendLedgEntry."Currency Code",GenJnlLine."Account Type"::Vendor,TRUE);
          IF Amount = 0 THEN BEGIN
            VendLedgEntry.CALCFIELDS("Remaining Amount");
            IF VendLedgEntry."Amount to Apply" <> 0 THEN BEGIN
              IF PaymentToleranceMgt.CheckCalcPmtDiscGenJnlVend(Rec,VendLedgEntry,0,FALSE) THEN BEGIN
                IF ABS(VendLedgEntry."Amount to Apply") >=
                   ABS(VendLedgEntry."Remaining Amount" - VendLedgEntry."Remaining Pmt. Disc. Possible")
                THEN
                  Amount := -(VendLedgEntry."Remaining Amount" -
                              VendLedgEntry."Remaining Pmt. Disc. Possible")
                ELSE
                  Amount := -VendLedgEntry."Amount to Apply";
              END ELSE
                Amount := -VendLedgEntry."Amount to Apply";
            END ELSE BEGIN
              IF PaymentToleranceMgt.CheckCalcPmtDiscGenJnlVend(Rec,VendLedgEntry,0,FALSE) THEN
                Amount := -(VendLedgEntry."Remaining Amount" -
                            VendLedgEntry."Remaining Pmt. Disc. Possible")
              ELSE
                Amount := -VendLedgEntry."Remaining Amount";
            END;
            IF "Bal. Account Type" IN
               ["Bal. Account Type"::Customer,"Bal. Account Type"::Vendor]
            THEN
              Amount := -Amount;
            VALIDATE(Amount);
          END;
        #48..51
        */
    //end;

    local procedure OnlyChgdSendCheckOvaNight(): Boolean
    var
        GjnLnLoc: Record "Gen. Journal Line";
        RecRef1: RecordRef;
        RecRef2: RecordRef;
        FldRef1: FieldRef;
        FldRef2: FieldRef;
        i: Integer;
    begin
        //iCepts CJB 06.01.16 - RFM8761 Begin
        if (Rec."Send Check Overnight" = xRec."Send Check Overnight") then
          exit(false);//Other fields must've changed that caused the OnModify trigger to run.
        GjnLnLoc:= Rec;
        GjnLnLoc."Send Check Overnight":= xRec."Send Check Overnight";
        //See if the "Send Check Overnight" field is the ONLY one the changed
        //At this point, for this to be true, all fields should be equal between two recs.
        RecRef1.GetTable(GjnLnLoc);
        RecRef2.GetTable(xRec);

        for i:= 1 to RecRef1.FieldCount do begin
          FldRef1:= RecRef1.FieldIndex(i);
          FldRef2:= RecRef2.FieldIndex(i);
          if (FldRef1.Value <> FldRef2.Value) then
            exit(false);//Found another field that was changed.
        end;
        exit(true);//All field were same.
        //iCepts CJB 06.01.16 - RFM8761 End
    end;

    var
        DontCheckIfPrinted: Boolean;
        GenJnlTemplateLoc: Record "Gen. Journal Template";
}

