TableExtension 50115 tableextension50115 extends "Sales Invoice Header"
{
    fields
    {
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
            Description = 'iCepts1.03';
            OptionMembers = " ",A,B,C;
        }
        field(50020; "Ordr Class"; Option)
        {
            OptionCaption = ' ,Holiday';
            OptionMembers = " ",Holiday;
        }

    }
    keys
    {

    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnDelete".

    //trigger (Variable: EDIDiscountSummary)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TESTFIELD("No. Printed");
    LOCKTABLE;
    PostSalesLinesDelete.DeleteSalesInvLines(Rec);
    #4..6
    SalesCommentLine.DELETEALL;

    ApprovalsMgt.DeletePostedApprovalEntry(DATABASE::"Sales Invoice Header","No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // iCepts BRB 11.15.10 - Do not allow to delete :START
    ERROR('You are not allowed to delete Posted Invoices\Create a Credit Memo');
    // iCepts BRB 11.15.10 - Do not allow to delete :END

    #1..9

    // >> EDI
    EDIDiscountSummary.RESET;
    EDIDiscountSummary.SETRANGE("Internal Doc. No.","EDI Internal Doc. No.");
    EDIDiscountSummary.SETRANGE("Document No.","No.");
    EDIDiscountSummary.DELETEALL;
    // << EDI
    */
    //end;


}

