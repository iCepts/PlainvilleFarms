PageExtension 50109 pageextension50109 extends "Posted Sales Invoice Subform" 
{
    layout
    {
        addafter("No.")
        {
            field("Shelf Life";"Shelf Life")
            {
                ApplicationArea = Basic;
            }
            field("Report Code";"Report Code")
            {
                ApplicationArea = Basic;
            }
            field("Broker Commission";"Broker Commission")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Description)
        {
            field("Description 2";"Description 2")
            {
                ApplicationArea = Basic;
            }
            field("Establishment No.";"Establishment No.")
            {
                ApplicationArea = Basic;
            }
            field("Expiration Date";"Expiration Date")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Package Tracking No.")
        {
            field("Original Quantity";"Original Quantity")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Unit of Measure Code")
        {
            field("Original Quantity 2";"Original Quantity 2")
            {
                ApplicationArea = Basic;
            }
            field("Quantity 2";"Quantity 2")
            {
                ApplicationArea = Basic;
            }
            field("Unit of Measure Code 2";"Unit of Measure Code 2")
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
            field("EDI Invoice UOM";"EDI Invoice UOM")
            {
                ApplicationArea = Basic;
            }
            field("EDI Invoice Price";"EDI Invoice Price")
            {
                ApplicationArea = Basic;
            }
            field("EDI Invoice Qty.";"EDI Invoice Qty.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Allow Invoice Disc.")
        {
            field(TransferDate;TransferDate)
            {
                ApplicationArea = Basic;
            }
            field("Shipment Date";"Shipment Date")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

