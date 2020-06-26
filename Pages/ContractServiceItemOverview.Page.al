Page 50027 "Contract Service Item Overview"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Service Contract Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contract Type";"Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field("Contract No.";"Contract No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status";"Contract Status")
                {
                    ApplicationArea = Basic;
                }
                field("Service Item No.";"Service Item No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Service Period";"Service Period")
                {
                    ApplicationArea = Basic;
                }
                field("Next Planned Service Date";"Next Planned Service Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Planned Service Date";"Last Planned Service Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Service Date";"Last Service Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Preventive Maint. Date";"Last Preventive Maint. Date")
                {
                    ApplicationArea = Basic;
                }
                field("Line Value";"Line Value")
                {
                    ApplicationArea = Basic;
                }
                field("Starting Date";"Starting Date")
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

