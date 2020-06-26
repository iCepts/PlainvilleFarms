Table 50009 "Flock Buffer"
{
    // // iCepts BRB 07.11.08 - Used to Report 50099


    fields
    {
        field(1;EntryNo;Integer)
        {
        }
        field(2;"User ID";Code[20])
        {
        }
        field(3;FlockNo;Code[20])
        {
        }
        field(4;ItemNo;Code[20])
        {
        }
        field(5;PostingDate;Date)
        {
        }
        field(6;Description;Text[50])
        {
        }
        field(7;Quantity;Decimal)
        {
        }
        field(8;UOM;Code[10])
        {
        }
        field(9;UnitCost;Decimal)
        {
        }
        field(10;ExtCost;Decimal)
        {
        }
        field(11;Category;Code[10])
        {
        }
    }

    keys
    {
        key(Key1;EntryNo,"User ID")
        {
            Clustered = true;
        }
        key(Key2;"User ID",ItemNo,PostingDate)
        {
            SumIndexFields = Quantity,ExtCost;
        }
    }

    fieldgroups
    {
    }
}

