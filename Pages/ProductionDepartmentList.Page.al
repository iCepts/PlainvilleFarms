Page 50007 "Production Department List"
{
    // // iCepts BRB 01.19.09 - Production Dept. iCepts1.00

    PageType = List;
    SourceTable = "Production Department";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

