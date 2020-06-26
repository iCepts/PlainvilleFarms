PageExtension 50107 pageextension50107 extends "Sales Cr. Memo Subform"
{
    layout
    {

        addafter(Description)
        {
            field("Description 2"; "Description 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Unit of Measure Code")
        {
            field("Quantity 2"; "Quantity 2")
            {
                ApplicationArea = Basic;
            }
            field("Unit of Measure 2"; "Unit of Measure 2")
            {
                ApplicationArea = Basic;
            }
            field("Qty. to Ship 2"; "Qty. to Ship 2")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

