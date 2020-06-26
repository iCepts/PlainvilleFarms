TableExtension 50129 tableextension50129 extends "Value Entry" 
{
    fields
    {
        field(50000;"Item Category Code";Code[10])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
        }
        field(50001;"Product Group Code";Code[10])
        {
            TableRelation = "Product Group".Code where ("Item Category Code"=field("Item Category Code"));
        }
        field(50002;"Broker Code";Code[10])
        {
            Description = 'RFM7914';
            TableRelation = "Broker/Cust Svc Rep".Code;
        }
        field(50012;"Product Group Total Code";Code[20])
        {
            TableRelation = "Product Group Total".Code;
        }
        field(50015;"Ship-to Code";Code[10])
        {
            Description = 'RFM8314';
            Editable = false;
            FieldClass = Normal;
        }
        field(50016;"Ship-to Name";Text[50])
        {
            Description = 'RFM8314';
            Editable = false;
            FieldClass = Normal;
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Property Insertion (Enabled) on ""Source Type","Source No.","Global Dimension 1 Code","Global Dimension 2 Code","Item No.","Posting Date","Entry Type",Adjustment(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Item No.","Posting Date","Item Ledger Entry Type","Entry Type","Variance Type","Item Charge No.","Location Code","Variant Code"(Key)".
        // 
        // key(Key1;"Item No.","Posting Date","Item Ledger Entry Type","Entry Type","Variance Type","Item Charge No.","Location Code","Variant Code","Source No.")
        // {
        // SumIndexFields = "Invoiced Quantity","Sales Amount (Expected)","Sales Amount (Actual)","Cost Amount (Expected)","Cost Amount (Actual)","Cost Amount (Non-Invtbl.)","Purchase Amount (Actual)","Expected Cost Posted to G/L","Cost Posted to G/L","Item Ledger Entry Quantity";
        // }
        // Unsupported feature: Key containing base fields
        // key(Key2;"Source Type","Source No.","Product Group Code","Item No.")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key3;"Source Type","Source No.","Product Group Total Code","Product Group Code","Item No.")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key4;"Source Type","Source No.","Item Ledger Entry Type","Item No.","Ship-to Code","Document No.","Posting Date")
        // {
        // }
    }
}

