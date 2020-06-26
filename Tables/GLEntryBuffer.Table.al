Table 50012 "G/L Entry Buffer"
{
    // //iCepts DXD 06.12.12 RFM7538 G/L Entry Buffer create for report 50003       iCepts1.00


    fields
    {
        field(4;"Posting Date";Date)
        {
            Caption = 'Posting Date';
            ClosingDates = true;
        }
        field(6;"Document No.";Code[20])
        {
            Caption = 'Document No.';
        }
        field(24;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
    }

    keys
    {
        key(Key1;"Posting Date","Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

