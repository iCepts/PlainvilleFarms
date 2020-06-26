Page 50003 "Broker/Cust Svc Rep List"
{
    // //iCepts 12.23.09 Change name from Broker List to Broker/Cust Svc Rep List

    PageType = List;
    SourceTable = "Broker/Cust Svc Rep";

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
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Commission;Commission)
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

