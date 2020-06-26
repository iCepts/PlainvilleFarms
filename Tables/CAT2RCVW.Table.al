Table 50019 CAT2RCVW
{
    // // iCepts WRW 04.07.15 - NAV2015 Upgrade, Change Table to Linked Object iCepts1.01
    // // iCepts BRB 11.08.13 - RFM7988 New Table pointing to SQL View iCepts1.00

    Caption = 'CAT2RCVW';
    DataPerCompany = false;
    LinkedInTransaction = false;
    LinkedObject = true;

    fields
    {
        field(1;RecordID;Code[40])
        {
        }
        field(2;CompanyCode;Code[3])
        {
        }
        field(3;WarehouseCode;Code[4])
        {
        }
        field(4;HdrRecordID;Code[40])
        {
        }
        field(5;LineNumber;Integer)
        {
        }
        field(6;ItemCode;Code[40])
        {
        }
        field(7;PurchasedQty;Decimal)
        {
        }
        field(8;DateReceived;DateTime)
        {
        }
        field(9;ERP_RecordID;Code[20])
        {
        }
        field(10;StatusFlag;Code[10])
        {
        }
    }

    keys
    {
        key(Key1;RecordID)
        {
            Clustered = true;
        }
        key(Key2;ERP_RecordID,LineNumber)
        {
        }
    }

    fieldgroups
    {
    }
}

