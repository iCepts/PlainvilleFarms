Page 50098 "InterCompany Branch Setup"
{
    // // iCepts WRW 05.10.16 - RFM8763 Get the Tolerance Branch for the IC Deposit Dimension to Payment Tolerance iCepts1.01
    // // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments iCepts1.00

    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "InterCompany Branch Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IC Code";"IC Code")
                {
                    ApplicationArea = Basic;
                }
                field("Journal Template Name";"Journal Template Name")
                {
                    ApplicationArea = Basic;
                }
                field("Journal Batch Name";"Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Description";"Posting Description")
                {
                    ApplicationArea = Basic;
                }
                field("Reason Code";"Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Due To Account Type";"Due To Account Type")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    HideValue = false;
                    Visible = false;
                }
                field("Due To Account No.";"Due To Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Due To Dimension 1 Code";"Due To Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    HideValue = false;
                    Visible = false;
                }
                field("Due To Dimension 2 Code";"Due To Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Due From Account Type";"Due From Account Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Due From Account No.";"Due From Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Due From Dimension 1 Code";"Due From Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Due From Dimension 2 Code";"Due From Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tolerance Branch";"Tolerance Branch")
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

