Page 50010 "Sales Item Ledger Entries"
{
    // //iCepts 09.15.14 DXD - Sales Item Ledger Entries                     iCepts1.00

    ApplicationArea = Basic;
    Caption = 'Sales Item Ledger Entries';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    Permissions = TableData "Item Ledger Entry"=r;
    SourceTable = "Item Ledger Entry";
    SourceTableView = sorting("Country/Region Code","Entry Type","Posting Date")
                      where("Entry Type"=const(Sale));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry Type";"Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Item No.";"Item No.")
                {
                    ApplicationArea = Basic;
                }
              /*   field("Product Group Code";"Product Group Code")
                {
                    ApplicationArea = Basic;
                } */
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Sales Amount (Actual)";"Sales Amount (Actual)")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity 2";"Quantity 2")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Source No.";"Source No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Quantity";"Remaining Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Invoiced Quantity";"Invoiced Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to Entry";"Applies-to Entry")
                {
                    ApplicationArea = Basic;
                }
                field(Open;Open)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Positive;Positive)
                {
                    ApplicationArea = Basic;
                }
                field("Source Type";"Source Type")
                {
                    ApplicationArea = Basic;
                }
                field("Drop Shipment";"Drop Shipment")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Type";"Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field("Transport Method";"Transport Method")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No.";"External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reserved Quantity";"Reserved Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Line No.";"Document Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. per Unit of Measure";"Qty. per Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("Cross-Reference No.";"Cross-Reference No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

