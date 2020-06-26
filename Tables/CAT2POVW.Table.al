Table 50017 CAT2POVW
{
    // // iCepts WRW 04.07.15 - NAV2015 Upgrade, Change Table to Linked Object iCepts1.02
    // // iCepts BRB 05.20.14 - Increase PONumber to 20 iCepts1.01
    // // iCepts BRB 11.08.13 - RFM7988 New Table pointing to SQL View iCepts1.00

    Caption = 'CAT2POVW';
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
        field(4;PONumber;Code[20])
        {
        }
        field(5;VendorNumber;Code[10])
        {
        }
        field(6;ItemCode;Code[40])
        {
        }
        field(7;PurchasedQty;Decimal)
        {
        }
        field(8;PurchaseDateDT;Date)
        {
        }
        field(9;PurchaseDate;Integer)
        {
        }
        field(10;PromiseDateDT;Date)
        {
        }
        field(11;PromiseDate;Integer)
        {
        }
        field(12;LineNumber;Integer)
        {
        }
        field(13;ERP_RecordID;Code[20])
        {
        }
        field(14;InterfaceCreateDateTime;DateTime)
        {
        }
    }

    keys
    {
        key(Key1;RecordID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

