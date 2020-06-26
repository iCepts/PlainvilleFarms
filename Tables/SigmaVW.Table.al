Table 50002 SigmaVW
{
    // // iCepts WRW 03.28.16 - RFM8742 Requested Delivery Date and Shipment Date to CAT2 Download iCepts1.03
    // // iCepts WRW 04.07.15 - NAV2015 Upgrade, Change Table to Linked Object iCepts1.02
    // // iCepts BRB 05.20.14 - Increase PONumber to 20 iCepts1.01
    // // iCepts BRB 10.29.09 - RFM6595 NAV to Sigma Sales Orders iCepts1.00

    DataPerCompany = false;
    LinkedInTransaction = false;
    LinkedObject = true;

    fields
    {
        field(1;UniqueRec;Code[40])
        {
        }
        field(2;Identity;Integer)
        {
        }
        field(3;CompanyCode;Code[3])
        {
        }
        field(4;WarehouseCode;Code[3])
        {
        }
        field(5;InterfaceCreate;DateTime)
        {
        }
        field(6;StatusFlag;Code[1])
        {
        }
        field(7;DocumentNo;Code[20])
        {
        }
        field(8;LineNo;Integer)
        {
        }
        field(9;Product;Code[9])
        {

            trigger OnValidate()
            var
                ICPartner: Record "IC Partner";
                ItemCrossReference: Record "Item Cross Reference";
                PrepaymentMgt: Codeunit "Prepayment Mgt.";
                KitUnitPrice: Decimal;
            begin
            end;
        }
        field(10;Quantity;Decimal)
        {
        }
        field(11;CustomerCode;Code[10])
        {
        }
        field(12;ShipToCode;Code[10])
        {
        }
        field(13;OrderDate;Date)
        {
        }
        field(14;TypeOfOrder;Code[1])
        {
        }
        field(15;StatusOrder;Code[1])
        {
        }
        field(16;PONumber;Code[20])
        {
        }
        field(17;StatusItem;Code[1])
        {
        }
        field(18;OrderClass;Code[1])
        {
        }
        field(19;ShipmentDate;Date)
        {
        }
        field(20;RequestedDeliveryDate;Date)
        {
        }
    }

    keys
    {
        key(Key1;UniqueRec,Identity)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

