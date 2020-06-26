Page 50022 "Purchase Mgr Approv Activities"
{
    // // iCepts SLD 04.08.15 - Purchasing Mgr Approv Activities for Phone App iCepts1.00

    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Purchase Cue";

    layout
    {
        area(content)
        {
            cuegroup("Pre-arrival Follow-up on Purchase Orders")
            {
                Caption = 'Pre-arrival Follow-up on Purchase Orders';
                Visible = false;
                field("To Send or Confirm";"To Send or Confirm")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Purchase Order List";
                    Visible = false;
                }
                field("Upcoming Orders";"Upcoming Orders")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Purchase Order List";
                    Visible = false;
                }

                actions
                {
                    action("New Purchase Quote")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Purchase Quote';
                        RunObject = Page "Purchase Quote";
                        RunPageMode = Create;
                    }
                    action("New Purchase Order")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Purchase Order';
                        RunObject = Page "Purchase Order";
                        RunPageMode = Create;
                    }
                    action("Edit Purchase Journal")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Edit Purchase Journal';
                        RunObject = Page "Purchase Journal";
                    }
                }
            }
            cuegroup("Post Arrival Follow-up")
            {
                Caption = 'Post Arrival Follow-up';
                Visible = false;
                field(OutstandingOrders;"Outstanding Purchase Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Outstanding Purchase Orders';
                    DrillDownPageID = "Purchase Order List";

                    trigger OnDrillDown()
                    begin
                        ShowOrders(FieldNo("Outstanding Purchase Orders"));
                    end;
                }
                field("Purchase Return Orders - All";"Purchase Return Orders - All")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Purchase Return Order List";
                    Visible = false;
                }

                actions
                {
                    action(Navigate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Navigate';
                        Image = Navigate;
                        RunObject = Page Navigate;
                    }
                    action("New Purchase Return Order")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Purchase Return Order';
                        RunObject = Page "Purchase Return Order";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("Purchase Orders - Authorize for Payment")
            {
                Caption = 'Purchase Orders - Authorize for Payment';
                Visible = false;
                field(NotInvoiced;"Not Invoiced")
                {
                    ApplicationArea = Basic;
                    Caption = 'Not Invoiced';
                    DrillDownPageID = "Purchase Order List";
                    Visible = false;

                    trigger OnDrillDown()
                    begin
                        ShowOrders(FieldNo("Not Invoiced"));
                    end;
                }
                field(PartiallyInvoiced;"Partially Invoiced")
                {
                    ApplicationArea = Basic;
                    Caption = 'Partially Invoiced';
                    DrillDownPageID = "Purchase Order List";
                    Visible = false;

                    trigger OnDrillDown()
                    begin
                        ShowOrders(FieldNo("Partially Invoiced"));
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CalculateCueFieldValues;
    end;

    trigger OnOpenPage()
    begin
        Reset;
        if not Get then begin
          Init;
          Insert;
        end;

        SetRespCenterFilter;
        SetFilter("Date Filter",'>=%1',WorkDate);
    end;

    local procedure CalculateCueFieldValues()
    begin
        if FieldActive("Outstanding Purchase Orders") then
          "Outstanding Purchase Orders" := CountOrders(FieldNo("Outstanding Purchase Orders"));

        if FieldActive("Not Invoiced") then
          "Not Invoiced" := CountOrders(FieldNo("Not Invoiced"));

        if FieldActive("Partially Invoiced") then
          "Partially Invoiced" := CountOrders(FieldNo("Partially Invoiced"));
    end;
}

