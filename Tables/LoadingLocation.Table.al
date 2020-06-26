Table 50016 "Loading Location"
{
    // // iCepts BRB 02.07.13 - Loading Location iCepts1.00

    DrillDownPageID = "Loading Locations";
    LookupPageID = "Loading Locations";

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

