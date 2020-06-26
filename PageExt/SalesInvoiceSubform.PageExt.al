PageExtension 50106 pageextension50106 extends "Sales Invoice Subform"
{
    layout
    {

        //Unsupported feature: Code Modification on "Type(Control 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TypeOnAfterValidate;
        NoOnAfterValidate;
        TypeChosen := HasTypeToFillMandatotyFields;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TypeOnAfterValidate;
        NoOnAfterValidate;
        TypeChosen := Type <> Type::" "
        */
        //end;
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
            field("Qty. to Ship 2"; "Qty. to Ship 2")
            {
                ApplicationArea = Basic;
            }
            field("Unit of Measure 2"; "Unit of Measure 2")
            {
                ApplicationArea = Basic;
            }
        }
    }





    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TypeChosen := HasTypeToFillMandatotyFields;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TypeChosen := Type <> Type::" ";
    */
    //end;




}

