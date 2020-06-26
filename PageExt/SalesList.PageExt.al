PageExtension 50104 pageextension50104 extends "Sales List"
{
    layout
    {

        addafter("No.")
        {
            field("Ship Status"; "Ship Status")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Sell-to Customer Name")
        {
            field("Requested Delivery Date"; "Requested Delivery Date")
            {
                ApplicationArea = Basic;
            }
            field("Shipment Date"; "Shipment Date")
            {
                ApplicationArea = Basic;
            }
        }
    }



}

