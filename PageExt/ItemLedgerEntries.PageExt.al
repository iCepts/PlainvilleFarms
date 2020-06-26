PageExtension 50102 pageextension50102 extends "Item Ledger Entries" 
{

    //Unsupported feature: Property Insertion (Permissions) on ""Item Ledger Entries"(Page 38)".

    layout
    {
        modify("Posting Date")
        {
            Editable = false;
        }
        modify("Entry Type")
        {
            Editable = false;
        }
        modify("Document Type")
        {
            Editable = false;
        }
        modify("Document No.")
        {
            Editable = false;
        }
        modify("Document Line No.")
        {
            Editable = false;
        }
        modify("Item No.")
        {
            Editable = false;
        }
        modify("Variant Code")
        {
            Editable = false;
        }
        modify(Description)
        {
            Editable = false;
        }
        modify("Return Reason Code")
        {
            Editable = false;
        }
        modify("Global Dimension 1 Code")
        {
            Editable = false;
        }
        modify("Global Dimension 2 Code")
        {
            Editable = false;
        }
        modify("Expiration Date")
        {
            Editable = false;
        }
        modify("Serial No.")
        {
            Editable = false;
        }
        modify("Lot No.")
        {
            Editable = false;
        }
        modify("Location Code")
        {
            Editable = false;
        }
        modify(Quantity)
        {
            Editable = false;
        }
        modify("Invoiced Quantity")
        {
            Editable = false;
        }
        modify("Remaining Quantity")
        {
            Editable = false;
        }
        modify("Shipped Qty. Not Returned")
        {
            Editable = false;
        }
        modify("Reserved Quantity")
        {
            Editable = false;
        }
        modify("Qty. per Unit of Measure")
        {
            Editable = false;
        }
        modify("Sales Amount (Expected)")
        {
            Editable = false;
        }
        modify("Sales Amount (Actual)")
        {
            Editable = false;
        }
        modify("Cost Amount (Expected)")
        {
            Editable = false;
        }
        modify("Cost Amount (Actual)")
        {
            Editable = false;
        }
        modify("Cost Amount (Non-Invtbl.)")
        {
            Editable = false;
        }
        modify("Cost Amount (Expected) (ACY)")
        {
            Editable = false;
        }
        modify("Cost Amount (Actual) (ACY)")
        {
            Editable = false;
        }
        modify("Cost Amount (Non-Invtbl.)(ACY)")
        {
            Editable = false;
        }
        modify("Completely Invoiced")
        {
            Editable = false;
        }
        modify(Open)
        {
            Editable = false;
        }
        modify("Drop Shipment")
        {
            Editable = false;
        }
        modify("Assemble to Order")
        {
            Editable = false;
        }
        modify("Applied Entry to Adjust")
        {
            Editable = false;
        }
        modify("Order Type")
        {
            Editable = false;
        }
        modify("Order No.")
        {
            Editable = false;
        }
        modify("Order Line No.")
        {
            Editable = false;
        }
        modify("Prod. Order Comp. Line No.")
        {
            Editable = false;
        }
        modify("Entry No.")
        {
            Editable = false;
        }
        modify("Job No.")
        {
            Editable = false;
        }
        modify("Job Task No.")
        {
            Editable = false;
        }
        addafter("Document Type")
        {
            field("External Document No.";"External Document No.")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
        addafter(Description)
        {
            field("Source No.";"Source No.")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            /* field("Product Group Code";"Product Group Code")
            {
                ApplicationArea = Basic;
                Editable = false;
            } */
        }
        addafter("Remaining Quantity")
        {
            field("Quantity 2";"Quantity 2")
            {
                ApplicationArea = Basic;
                Editable = Quantity2Editable;
            }
            field("Unit of Measure Code 2";"Unit of Measure Code 2")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
    }

    var
        UserSetup: Record "User Setup";
        [InDataSet]
        Quantity2Editable: Boolean;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
        /*
        // iCepts BRB 02.08.12 - Check if allowed to make change
        IF UserSetup.GET(USERID) THEN BEGIN
          IF UserSetup."Allow Qty 2 Change" THEN
            Quantity2Editable := TRUE
          ELSE
            Quantity2Editable := FALSE;
        END;
        */
    //end;

    //Unsupported feature: Property Deletion (Editable).

}

