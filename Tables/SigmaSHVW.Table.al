Table 50001 SigmaSHVW
{
    // // iCepts WRW 04.07.15 - NAV2015 Upgrade, Change Table to Linked Object iCepts1.01
    // // iCepts BRB 10.29.09 - RFM6595 Sigma to NAV Shipments iCepts1.00

    DataPerCompany = false;
    LinkedInTransaction = false;
    LinkedObject = true;

    fields
    {
        field(1;"Document No.";Text[20])
        {
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;Product;Code[20])
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
        field(4;"Quantity Lbs.";Decimal)
        {
        }
        field(5;"Quantity Case";Decimal)
        {
        }
        field(6;"Lot Number";Code[20])
        {
        }
        field(7;Load;Text[20])
        {
        }
        field(8;Carrier;Code[10])
        {
            Caption = 'Carrier';
            TableRelation = "Shipping Agent";
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.","Lot Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

