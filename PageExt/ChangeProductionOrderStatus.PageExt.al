PageExtension 50123 pageextension50123 extends "Change Production Order Status" 
{
    PromotedActionCategories = 'New,Process,Report,Mark';
    layout
    {
        addfirst(Control1)
        {
            field(Mark;Mark)
            {
                ApplicationArea = Basic;
                Caption = 'Marked';
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Deletion (AccessByPermission) on "Dimensions(Action 54)".

        addafter("Change &Status")
        {
            action(ActionMark)
            {
                ApplicationArea = Basic;
                Caption = 'Mark';
                Image = SelectLineToApply;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //iCepts WRW 04.28.14 - Add Mark and MarkOnly ability on Form
                    Mark(not Mark);
                end;
            }
            action("Marked Only")
            {
                ApplicationArea = Basic;
                Caption = 'Marked Only';
                Image = FilterLines;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //iCepts WRW 04.28.14 - Add Mark and MarkOnly ability on Form
                    MarkedOnly(not MarkedOnly);
                end;
            }
            action("Clear Marks")
            {
                ApplicationArea = Basic;
                Caption = 'Clear Marks';
                Image = ClearFilter;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //iCepts WRW 04.28.14 - Add Mark and MarkOnly ability on Form
                    ClearMarks;
                end;
            }
        }
    }


    //Unsupported feature: Code Modification on "BuildForm(PROCEDURE 1)".

    //procedure BuildForm();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        FILTERGROUP(2);
        SETRANGE(Status,ProdOrderStatus);
        FILTERGROUP(0);

        IF StartingDate <> 0D THEN
          SETFILTER("Starting Date",'..%1',StartingDate)
        #7..12
          SETRANGE("Ending Date");

        CurrPage.UPDATE(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SETRANGE(Status,ProdOrderStatus);
        #4..15
        */
    //end;
}

