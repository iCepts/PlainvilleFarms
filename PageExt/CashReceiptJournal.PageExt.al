PageExtension 50112 pageextension50112 extends "Cash Receipt Journal" 
{
    layout
    {
        addafter("Direct Debit Mandate ID")
        {
            field("InterCompany Code";"InterCompany Code")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

