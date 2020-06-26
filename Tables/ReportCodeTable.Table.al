Table 50004 "Report Code Table"
{
    // //iCepts 1.00 RFM6570 Add Report Code to Item Card / Sale Order Line
    // //iCepts 1.00 DXD 08.05.09

    LookupPageID = "Report Code List";

    fields
    {
        field(1;"Report Code";Code[10])
        {
        }
        field(2;Description;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Report Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

