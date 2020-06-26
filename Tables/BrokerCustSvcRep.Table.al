Table 50003 "Broker/Cust Svc Rep"
{
    // //iCepts1.01 - Change table name from Broker Commission to Broker/Cust Svc Rep

    LookupPageID = "Broker/Cust Svc Rep List";

    fields
    {
        field(1;"Code";Code[10])
        {
        }
        field(2;Name;Text[30])
        {
        }
        field(3;Commission;Decimal)
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

