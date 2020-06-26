tableextension 50136 SalesShipmentLine extends "Sales Shipment Line"
{
    fields
    {
        field(50001; "Quantity 2"; Decimal)
        {

        }
        field(50002; "Unit of Measure 2"; Code[10])
        {
            TableRelation = IF (Type = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No.")) ELSE
            "Unit of Measure";
        }
        field(50003; "Shelf Life"; Option)
        {
            OptionMembers = " ",A,B,C;
        }
    }

}