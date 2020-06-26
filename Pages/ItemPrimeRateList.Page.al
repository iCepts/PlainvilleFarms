Page 50008 "Item Prime Rate List"
{
    // // iCepts BRB 10.09.08 - RFM6230 Item Prime Rate iCepts1.00

    PageType = List;
    SourceTable = "Item Prime Rate";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No.";"Item No.")
                {
                    ApplicationArea = Basic;
                }
                field("Conv or ABF";"Conv or ABF")
                {
                    ApplicationArea = Basic;
                }
                field(Breed;Breed)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Poultry;Poultry)
                {
                    ApplicationArea = Basic;
                }
                field(Feed;Feed)
                {
                    ApplicationArea = Basic;
                }
                field(Medicine;Medicine)
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

