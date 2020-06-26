Table 50018 CAT2ImportsVW
{
    // // iCepts WRW 04.07.15 - NAV2015 Upgrade, Change Table to Linked Object iCepts1.01
    // // iCepts BRB 11.08.13 - RFM7988 New Table pointing to SQL View iCepts1.00

    Caption = 'CAT2ImportsVW';
    DataPerCompany = false;
    LinkedInTransaction = false;
    LinkedObject = true;

    fields
    {
        field(1;recordid;Code[40])
        {
        }
        field(2;processid;Code[3])
        {
        }
        field(3;status;Code[1])
        {
        }
        field(4;CompanyCode;Code[3])
        {
        }
        field(5;Warehouse;Code[4])
        {
        }
        field(6;InterfaceCreateDateTime;DateTime)
        {
        }
    }

    keys
    {
        key(Key1;recordid)
        {
            Clustered = true;
        }
        key(Key2;processid,status)
        {
        }
    }

    fieldgroups
    {
    }
}

