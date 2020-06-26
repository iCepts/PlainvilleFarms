Table 50011 SigmaPDBuffer
{
    // // iCepts BRB 09.19.11 - Change to use DateTime iCepts1.01
    // // iCepts BRB 08.12.11 - RFM7265 Used to make sure Duplicates happen iCepts1.00


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

