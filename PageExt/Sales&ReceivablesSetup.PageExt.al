PageExtension 50113 pageextension50113 extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Background Posting")
        {
            group(Custom)
            {
                Caption = 'Custom';
                field("Sigma Dispatcher User"; "Sigma Dispatcher User")
                {
                    ApplicationArea = Basic;
                }
                field("CFS File Path"; "CFS File Path")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

