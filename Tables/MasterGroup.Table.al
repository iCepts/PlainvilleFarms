Table 50006 "Master Group"
{
    // // iCepts BRB 04.29.09 - Master Group with Item iCepts1.00

    LookupPageID = "Master Group List";

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

