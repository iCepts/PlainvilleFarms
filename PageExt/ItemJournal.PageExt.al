PageExtension 50103 pageextension50103 extends "Item Journal" 
{
    layout
    {
        addafter("Posting Date")
        {
            field("Line No.";"Line No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Unit Amount")
        {
            field("Quantity 2";"Quantity 2")
            {
                ApplicationArea = Basic;
            }
            field("Unit of Measure Code 2";"Unit of Measure Code 2")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

