Page 50021 "Purchasing Manager Approval"
{
    // // iCepts SLD 04.08.15 - Purchasing Manager Approval for Phone App iCepts1.00

    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1907662708; "Purchase Mgr Approv Activities")
                {
                }
                part(Control1902476008; "My Vendors")
                {
                    Visible = false;
                }
            }
            group(Control1900724708)
            {
                part(Control25; "Purchase Performance")
                {
                    Visible = false;
                }
                part(Control37; "Purchase Performance")
                {
                    Visible = false;
                }
                part(Control21; "Inventory Performance")
                {
                    Visible = false;
                }
                part(Control44; "Inventory Performance")
                {
                    Visible = false;
                }
                part(Control45; "Report Inbox Part")
                {
                    Visible = false;
                }
                part(Control35; "My Job Queue")
                {
                    Visible = false;
                }
                part(Control1905989608; "My Items")
                {
                    Visible = false;
                }
                part(Control1903012608; "Copy Profile")
                {
                    Visible = false;
                }
                systempart(Control43; MyNotes)
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Top __ Vendor List")
            {
                ApplicationArea = Basic;
                Caption = 'Top __ Vendor List';
                RunObject = Report "Top __ Vendor List";
            }
            action("Vendor/Item Statistics")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor/Item Statistics';
                RunObject = Report "Vendor/Item Statistics";
            }
            separator(Action28)
            {
            }
            action("Availability Projection")
            {
                ApplicationArea = Basic;
                Caption = 'Availability Projection';
                RunObject = Report "Availability Projection";
            }
            action("Purchase Order Status")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Order Status';
                RunObject = Report "Purchase Order Status";
            }
            action("Vendor Purchases by Item")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor Purchases by Item';
                RunObject = Report "Vendor Purchases by Item";
            }

            separator(Action1020000)
            {
            }
        }
        area(embedding)
        {
            action("Page Approval Entries")
            {
                ApplicationArea = Basic;
                Caption = 'Approval Entries';
                RunObject = Page "Approval Entries";
            }
            action("Page Approval Request Entries")
            {
                ApplicationArea = Basic;
                Caption = 'Approval Request Entries';
                RunObject = Page "Approval Request Entries";
            }
            action("Purchase Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
            }
            action(Vendors)
            {
                ApplicationArea = Basic;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
            }
            action(Items)
            {
                ApplicationArea = Basic;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
            }
        }
        area(sections)
        {
        }
        area(creation)
        {
            action("Purchase &Order")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase &Order';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            separator(Action24)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Pur&chase Prices")
            {
                ApplicationArea = Basic;
                Caption = 'Pur&chase Prices';
                Image = Price;
                RunObject = Page "Purchase Prices";
            }
            separator(Action36)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic;
                Caption = 'Navi&gate';
                Image = Navigate;
                RunObject = Page Navigate;
            }
        }
    }
}

