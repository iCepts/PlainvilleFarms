Codeunit 50003 "Well Fargo Export Payments"
{
    // ICEPTS CJB RFM8761 052016  Custom logic for Hain/Wells Fargo AP Payment export.  This is the CU OBJECT ID to be
    //   specified in the table "Bank Export/Import Setup", for record 'WFAPPAYMENTS', in the field 'Processing Codeunit ID'.

    TableNo = "Gen. Journal Line";

    trigger OnRun()
    begin
        Rec.SetRange("Account Type",Rec."account type"::"Bank Account");
        Rec.SetRange("Document Type",Rec."document type"::Payment);
        //Rec.SETRANGE("Bank Payment Type",Rec."Bank Payment Type"::"Electronic Payment");
        Rec.SetFilter("Payment Method Code",'%1|%2|%3','CHECK','ACH','');//For Pymt Meth Cd of '', will look at offset lines to see if Check, or ACH.

        Report.Run(50108,true,true,Rec);
    end;
}

