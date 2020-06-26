TableExtension 50103 tableextension50103 extends "Cust. Ledger Entry" 
{
    fields
    {
        field(50000;"Cust Name";Text[50])
        {
            CalcFormula = lookup(Customer.Name where ("No."=field("Customer No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"External Document No.","Customer No.","Document Type")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key2;"Document Type","Document No.","Customer No.")
        // {
        // }
    }
}

