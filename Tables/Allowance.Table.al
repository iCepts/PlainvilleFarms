Table 50020 Allowance
{

    fields
    {
        field(1;CustomerNo;Code[20])
        {
            TableRelation = Customer;
        }
        field(2;ItemNo;Code[20])
        {
            TableRelation = Item;
        }
        field(3;BeginDate;Date)
        {
        }
        field(4;EndDate;Date)
        {
        }
        field(5;Type;Option)
        {
            OptionMembers = Swell,Leaker;
        }
        field(6;"G/LAccountNo";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(7;Rate;Decimal)
        {
        }
        field(8;CustomerItemNo;Text[20])
        {
        }
        field(9;Description;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;CustomerNo,ItemNo,BeginDate,EndDate,Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

