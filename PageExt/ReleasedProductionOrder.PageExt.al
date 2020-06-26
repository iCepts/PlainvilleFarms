PageExtension 50120 pageextension50120 extends "Released Production Order" 
{
    layout
    {

        //Unsupported feature: Property Modification (Level) on ""Starting Time"(Control 28)".


        //Unsupported feature: Property Modification (Level) on ""Starting Date"(Control 30)".


        //Unsupported feature: Property Modification (Level) on ""Ending Time"(Control 32)".


        //Unsupported feature: Property Modification (Level) on ""Ending Date"(Control 34)".

        addafter("Description 2")
        {
            field("<Location Code->";"Location Code")
            {
                ApplicationArea = Basic;
                Importance = Promoted;
            }
            field("<Shortcut Dimension 2 Code->";"Shortcut Dimension 2 Code")
            {
                ApplicationArea = Basic;

                trigger OnValidate()
                begin
                 //   ShortcutDimension2CodeOnAfterV;
                end;
            }
        }
        addafter("Last Date Modified")
        {
            field("Creation Date";"Creation Date")
            {
                ApplicationArea = Basic;
            }
            field("Sigma Creation Dte";"Sigma Creation Dte")
            {
                ApplicationArea = Basic;
            }
        }
        addfirst(Schedule)
        {
            group(Control1000000004)
            {
            }
        }
        addafter("Ending Date")
        {
            group(Control1000000005)
            {
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Kill Dates/lbs.")
            {
                Caption = 'Kill Dates/lbs.';
                field("Kill Date";"Kill Date")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill Date 2";"Kill Date 2")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill Date 3";"Kill Date 3")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill Date 4";"Kill Date 4")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill Date 5";"Kill Date 5")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill Date 6";"Kill Date 6")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill lbs";"Kill lbs")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill lbs 2";"Kill lbs 2")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill lbs 3";"Kill lbs 3")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill lbs 4";"Kill lbs 4")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill lbs 5";"Kill lbs 5")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
                field("Kill lbs 6";"Kill lbs 6")
                {
                    ApplicationArea = Basic;
                    ShowCaption = false;
                }
            }
        }
        addafter(Posting)
        {
            group(Custom)
            {
                Caption = 'Custom';
                group(Control1000000021)
                {
                    field("Vendor No.";"Vendor No.")
                    {
                        ApplicationArea = Basic;

                        trigger OnValidate()
                        begin
                            VendorNoOnAfterValidate;
                        end;
                    }
                    group("Vendor Information")
                    {
                        Caption = 'Vendor Information';
                        field("VendorAddress[1]";VendorAddress[1])
                        {
                            ApplicationArea = Basic;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field("VendorAddress[2]";VendorAddress[2])
                        {
                            ApplicationArea = Basic;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field("VendorAddress[3]";VendorAddress[3])
                        {
                            ApplicationArea = Basic;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field("VendorAddress[4]";VendorAddress[4])
                        {
                            ApplicationArea = Basic;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field("VendorAddress[5]";VendorAddress[5])
                        {
                            ApplicationArea = Basic;
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                }
                group(Control1000000031)
                {
                    group(Control1000000029)
                    {
                        field("Head Adjusted";"Head Adjusted")
                        {
                            ApplicationArea = Basic;
                        }
                        field("Vendor.""Farm Number""";Vendor."Farm Number")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Farm Number';
                            Editable = false;
                        }
                        field("Grower Condemns Lbs";"Grower Condemns Lbs")
                        {
                            ApplicationArea = Basic;
                        }
                        field("Grower Condemns Each";"Grower Condemns Each")
                        {
                            ApplicationArea = Basic;
                        }
                        field("DOA Lbs";"DOA Lbs")
                        {
                            ApplicationArea = Basic;
                        }
                        field("DOA Each";"DOA Each")
                        {
                            ApplicationArea = Basic;
                        }
                        field("Plant Condemns Lbs";"Plant Condemns Lbs")
                        {
                            ApplicationArea = Basic;
                        }
                        field("Plant Condemns Each";"Plant Condemns Each")
                        {
                            ApplicationArea = Basic;
                        }
                        field(Breed;Breed)
                        {
                            ApplicationArea = Basic;
                        }
                    }
                }
            }
        }
        moveafter("No.";"Source Type")
        moveafter("Due Date";Blocked)
    }
    actions
    {
       /*  addafter("Shortage List")
        {
            action("Turkey Grower Settlement Sheet")
            {
                ApplicationArea = Basic;
                Caption = 'Turkey Grower Settlement Sheet';

                trigger OnAction()
                var
                    ProdOrder: Record "Production Order";
                    TurkeyGrowerSettlementSheet: Report "Turkey Grower Settlement Sheet";
                begin
                    ProdOrder.Reset;
                    ProdOrder.SetRange(Status,Status);
                    ProdOrder.SetRange("No.","No.");
                    Clear(TurkeyGrowerSettlementSheet);
                    TurkeyGrowerSettlementSheet.SetTableview(ProdOrder);
                    TurkeyGrowerSettlementSheet.Run;
                end;
            }
        } */
    }

    var
        Vendor: Record Vendor;
        FormatAddress: Codeunit "Format Address";
        VendorAddress: array [8] of Text[50];


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //begin
        /*
        // iCepts BRB 10.27.08 - Get Vendor Information
        CLEAR(VendorAddress);
        IF Vendor.GET("Vendor No.") THEN
          FormatAddress.Vendor(VendorAddress,Vendor);
        */
    //end;

    local procedure VendorNoOnAfterValidate()
    begin
        // iCepts BRB 10.27.08 - Get Vendor Information
        Clear(VendorAddress);
        if Vendor.Get("Vendor No.") then
          FormatAddress.Vendor(VendorAddress,Vendor);
    end;
}

