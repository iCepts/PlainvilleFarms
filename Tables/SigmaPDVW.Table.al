Table 50000 SigmaPDVW
{
    // // iCepts WRW 04.07.15 - NAV2015 Upgrade, Change Table to Linked Object iCepts1.02
    // // iCepts BRB 09.19.11 - Change to use DateTime & primary key iCepts1.01
    // // iCepts BRB 11.05.09 - RFM6595 Sigma to NAV Shipments iCepts1.00

    DataPerCompany = false;
    LinkedInTransaction = false;
    LinkedObject = true;

    fields
    {
        field(1;Product;Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            var
                ICPartner: Record "IC Partner";
                ItemCrossReference: Record "Item Cross Reference";
                PrepaymentMgt: Codeunit "Prepayment Mgt.";
                KitUnitPrice: Decimal;
            begin
            end;
        }
        field(2;"Lot Number";Code[20])
        {
        }
        field(3;"Quantity Lbs.";Decimal)
        {
        }
        field(4;"Quantity Case";Decimal)
        {
        }
        field(5;"Produced Date - Time";Date)
        {
        }
    }

    keys
    {
        key(Key1;Product,"Lot Number","Produced Date - Time")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

