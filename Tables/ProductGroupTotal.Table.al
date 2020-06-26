Table 50005 "Product Group Total"
{
    // // iCepts BRB 07.16.09 - Product Group Total with Item iCepts1.00

    Caption = 'Product Group Total';
    LookupPageID = "Product Group Total List";

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Description;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

