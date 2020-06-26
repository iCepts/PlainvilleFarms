Page 50006 "Master Group List"
{
    // // iCepts BRB 04.29.09 - Master Group List iCepts1.00

    PageType = List;
    SourceTable = "Master Group";

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

