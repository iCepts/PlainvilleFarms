Page 50017 Allowances
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Allowance;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CustomerNo;CustomerNo)
                {
                    ApplicationArea = Basic;
                }
                field(ItemNo;ItemNo)
                {
                    ApplicationArea = Basic;
                }
                field(BeginDate;BeginDate)
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;EndDate)
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("G/LAccountNo";"G/LAccountNo")
                {
                    ApplicationArea = Basic;
                }
                field(Rate;Rate)
                {
                    ApplicationArea = Basic;
                }
                field(CustomerItemNo;CustomerItemNo)
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

