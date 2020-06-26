PageExtension 50118 pageextension50118 extends "Deposit Subform" 
{
    layout
    {
        addafter("Reason Code")
        {
            field("InterCompany Code";"InterCompany Code")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

