Table 50098 "InterCompany Branch Setup"
{
    // // iCepts WRW 05.10.16 - RFM8763 Get the Tolerance Branch for the IC Deposit Dimension to Payment Tolerance iCepts1.01
    // // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments iCepts1.00


    fields
    {
        field(1;"IC Code";Code[10])
        {
            Description = 'RFM8650';
            TableRelation = "InterCompany Code"."IC Code";
        }
        field(2;"Journal Template Name";Code[10])
        {
            Caption = 'Journal Template Name';
            Description = 'RMF8650';
            NotBlank = true;
            TableRelation = "Gen. Journal Template";
        }
        field(3;"Journal Batch Name";Code[10])
        {
            Caption = 'Journal Batch Name';
            Description = 'RFM8650';
            NotBlank = true;
            TableRelation = "Gen. Journal Batch".Name where ("Journal Template Name"=field("Journal Template Name"));
        }
        field(4;"Posting Description";Text[50])
        {
            Description = 'RFM8650';
            NotBlank = true;
        }
        field(5;"Reason Code";Code[10])
        {
            Description = 'RFM8650';
            NotBlank = true;
            TableRelation = "Reason Code";
        }
        field(6;"Due To Account Type";Option)
        {
            Caption = 'Due To Account Type';
            Description = 'RFM8650';
            InitValue = "G/L Account";
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account",,"IC Partner";
        }
        field(7;"Due To Account No.";Code[20])
        {
            Caption = 'Due To Account No.';
            Description = 'RFM8650';
            NotBlank = true;
            TableRelation = if ("Due To Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Due To Account Type"=const(Customer)) Customer
                            else if ("Due To Account Type"=const(Vendor)) Vendor
                            else if ("Due To Account Type"=const("Bank Account")) "Bank Account"
                            else if ("Due To Account Type"=const("IC Partner")) "IC Partner";
        }
        field(8;"Due To Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            Description = 'RFM8650';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(9;"Due To Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'RFM8650';
            NotBlank = true;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(10;"Due From Account Type";Option)
        {
            Caption = 'Due From Account Type';
            Description = 'RFM8650';
            InitValue = "G/L Account";
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account",,"IC Partner";
        }
        field(11;"Due From Account No.";Code[20])
        {
            Caption = 'Due From Account No.';
            Description = 'RFM8650';
            NotBlank = true;
            TableRelation = if ("Due From Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Due From Account Type"=const(Customer)) Customer
                            else if ("Due From Account Type"=const(Vendor)) Vendor
                            else if ("Due From Account Type"=const("Bank Account")) "Bank Account"
                            else if ("Due From Account Type"=const("IC Partner")) "IC Partner";
        }
        field(12;"Due From Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            Description = 'RFM8650';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(13;"Due From Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'RFM8650';
            NotBlank = true;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(14;"Tolerance Branch";Code[20])
        {
            Description = 'RFM8763';
            NotBlank = true;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
    }

    keys
    {
        key(Key1;"IC Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Text001: label '%1 cannot be Blank';
}

