PageExtension 50110 pageextension50110 extends "Posted Sales Cr. Memo Subform" 
{
    layout
    {
        addafter(Description)
        {
            field("Description 2";"Description 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Unit Price")
        {
            field("Disc. per Qty UM";"Disc. per Qty UM")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

