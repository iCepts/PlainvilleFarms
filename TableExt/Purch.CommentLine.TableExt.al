TableExtension 50110 tableextension50110 extends "Purch. Comment Line" 
{
    fields
    {
        field(14000901;"Include in E-Mail";Boolean)
        {
            Caption = 'Include in E-Mail';
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"Document Type","No.","Line No.")
        // {
        // }
    }
}

