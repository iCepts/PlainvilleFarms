Page 50004 "Report Code List"
{
    // //iCepts 1.00 RFM6570 Add Report Code to Item Card / Sale Order Line
    // //iCepts 1.00 DXD 08.05.09

    PageType = List;
    SourceTable = "Report Code Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Report Code";"Report Code")
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

