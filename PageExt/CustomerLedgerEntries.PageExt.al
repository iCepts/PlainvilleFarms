PageExtension 50101 pageextension50101 extends "Customer Ledger Entries" 
{
    layout
    {
        modify("Remaining Amt. (LCY)")
        {
            Visible = RemainingAmtLCYVisible;
        }
       /*  addafter("Document Type")
        {
            field("External Document No.";"External Document No.")
            {
                ApplicationArea = Basic;
            }
        } */
        addafter("Customer No.")
        {
            field("Cust Name";"Cust Name")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Remaining Amt. (LCY)")
        {
            field("Pmt. Tolerance (LCY)";"Pmt. Tolerance (LCY)")
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        RemainingAmtLCYVisible: Boolean;


    //Unsupported feature: Code Insertion on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //begin
        /*
        RemainingAmtLCYVisible := FALSE;
        */
    //end;

    procedure SetRemainingAmtLCYToVisible()
    begin
        RemainingAmtLCYVisible := true;
    end;

    procedure GetRemainingAmtLCYVisiblityStatus(): Boolean
    begin
        exit(RemainingAmtLCYVisible);
    end;
}

