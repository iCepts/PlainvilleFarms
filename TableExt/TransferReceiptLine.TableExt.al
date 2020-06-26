TableExtension 50128 tableextension50128 extends "Transfer Receipt Line" 
{
    fields
    {
        field(50001;"Quantity 2";Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0:5;
        }
        field(50002;"Unit of Measure Code 2";Code[10])
        {
            Caption = 'Unit of Measure';
        }
        field(14000351;"EDI Segment Group";Integer)
        {
            Caption = 'EDI Segment Group';
            Editable = false;
        }
    }
}

