Table 50007 "Production Department"
{
    // // iCepts BRB 01.19.09 - New Report link with Item Card and Daily Stock Report iCepts1.00

    LookupPageID = "Production Department List";

    fields
    {
        field(1;"Code";Code[10])
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

