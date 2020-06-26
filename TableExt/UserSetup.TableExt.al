TableExtension 50113 tableextension50113 extends "User Setup"
{
    fields
    {
        field(50000; "Allow Qty 2 Change"; Boolean)
        {
        }
        field(50001; "PO Order Nos."; Code[10])
        {
            Description = 'RFM8552';
            TableRelation = "No. Series";
        }
        field(50002; "PO Invoice Nos."; Code[10])
        {
            Description = 'RFM8552';
            TableRelation = "No. Series";
        }
    }
}

