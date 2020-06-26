Table 50097 "InterCompany Code"
{
    // // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments iCepts1.00


    fields
    {
        field(1;"IC Code";Code[10])
        {
            Description = 'RFM8650';
        }
        field(2;Description;Text[30])
        {
            Description = 'RFM8650';
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
}

