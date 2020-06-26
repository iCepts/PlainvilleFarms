TableExtension 50117 tableextension50117 extends "Purch. Cr. Memo Line" 
{
    fields
    {
        field(50001;"Quantity 2";Decimal)
        {
            Caption = 'Quantity 2';
            DecimalPlaces = 0:5;
        }
        field(50002;"Unit of Measure Code 2";Code[10])
        {
            Caption = 'Unit of Measure Code 2';
            TableRelation = if (Type=const(Item)) "Item Unit of Measure".Code where ("Item No."=field("No."))
                            else "Unit of Measure";
        }
    }
}

