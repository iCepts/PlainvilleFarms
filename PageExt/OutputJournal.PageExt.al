PageExtension 50119 pageextension50119 extends "Output Journal" 
{
    layout
    {

        //Unsupported feature: Code Modification on ""Order No."(Control 60).OnValidate".

        //trigger "(Control 60)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ItemJnlMgt.GetOutput(Rec,ProdOrderDescription,OperationName);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ItemJnlMgt.GetOutput(Rec,ProdOrderDescription,OperationName);

            // iCepts BRB 10.12.12 - Get Description 2 from Production Order
            IF NOT ProdOrder.GET(ProdOrder.Status::Released,"Order No.") THEN
              CLEAR(ProdOrder);
            */
        //end;
        addafter("Order No.")
        {
            field("Routing No.";"Routing No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Description)
        {
            field("ProdOrder.""Description 2""";ProdOrder."Description 2")
            {
                ApplicationArea = Basic;
                Caption = 'Description 2';
            }
        }
        addafter("Unit of Measure Code")
        {
            field("Output Quantity 2";"Output Quantity 2")
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
        VALIDATE("Entry Type","Entry Type"::Output);
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

