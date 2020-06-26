TableExtension 50125 tableextension50125 extends "Product Group" 
{
    fields
    {
        field(50010;"Master Group Code";Code[20])
        {
            TableRelation = "Master Group".Code;
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"Item Category Code","Master Group Code","Code")
        // {
        // }
    }
}

