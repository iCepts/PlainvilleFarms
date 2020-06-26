PageExtension 50121 pageextension50121 extends "Consumption Journal" 
{
    layout
    {
        addafter(Description)
        {
            field(Description2;Description2)
            {
                ApplicationArea = Basic;
                Caption = 'Description 2';
                Editable = false;
            }
            field(Amount;Amount)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Unit of Measure Code")
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

    var
        ProdOrder: Record "Production Order";


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ShowShortcutDimCode(ShortcutDimCode);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ShowShortcutDimCode(ShortcutDimCode);

        // iCepts BRB 10.12.12 - Get Description 2 from Production Order
        IF NOT ProdOrder.GET(ProdOrder.Status::Released,"Order No.") THEN
          CLEAR(ProdOrder);
        */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetUpNewLine(xRec);
        VALIDATE("Entry Type","Entry Type"::Consumption);
        CLEAR(ShortcutDimCode);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        CLEAR(ProdOrder);
        */
    //end;
}

