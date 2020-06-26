PageExtension 50114 pageextension50114 extends "Purchase Order Archive Subform"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("ShortcutDimCode[3]"; ShortcutDimCode[3])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,3';
                Visible = false;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    //LookupShortcutDimCode(3,ShortcutDimCode[3]);
                end;
            }
            field("ShortcutDimCode[4]"; ShortcutDimCode[4])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,4';
                Visible = false;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    //LookupShortcutDimCode(4,ShortcutDimCode[4]);
                end;
            }
            field("ShortcutDimCode[5]"; ShortcutDimCode[5])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,5';
                Visible = false;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    //LookupShortcutDimCode(5,ShortcutDimCode[5]);
                end;
            }
            field("ShortcutDimCode[6]"; ShortcutDimCode[6])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,6';
                Visible = false;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    //LookupShortcutDimCode(6,ShortcutDimCode[6]);
                end;
            }
            field("ShortcutDimCode[7]"; ShortcutDimCode[7])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,7';
                Visible = false;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    //LookupShortcutDimCode(7,ShortcutDimCode[7]);
                end;
            }
            field("ShortcutDimCode[8]"; ShortcutDimCode[8])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,8';
                Visible = false;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    //LookupShortcutDimCode(8,ShortcutDimCode[8]);
                end;
            }
        }
    }

    var
        ShortcutDimCode: array[8] of Code[20];


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    */
    //end;


    //Unsupported feature: Code Insertion on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //begin
    /*
     CLEAR(ShortcutDimCode);
    */
    //end;
}

