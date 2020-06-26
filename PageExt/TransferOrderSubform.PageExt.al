PageExtension 50116 pageextension50116 extends "Transfer Order Subform" 
{
    layout
    {
        addafter("Quantity Shipped")
        {
            field("Qty. to Ship 2";"Qty. to Ship 2")
            {
                ApplicationArea = Basic;
            }
            field("Unit of Measure Code 2";"Unit of Measure Code 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Qty. to Receive")
        {
            field("Qty. to Receive 2";"Qty. to Receive 2")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

