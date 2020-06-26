PageExtension 50111 pageextension50111 extends "Posted Purchase Invoice" 
{
    layout
    {
        modify("Electronic Invoice")
        {
            Visible = false;
        }
        modify("Fiscal Invoice Number PAC")
        {
            Visible = false;
        }
         addafter("Shipment Method Code")
        {
            field("Requested Receipt Date";"Requested Receipt Date")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        } 
        addafter("Expected Receipt Date")
        {
            field("Reason Code";"Reason Code")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
       
   
        
    }
    actions
    {
     
       
    }

    var
       
    
}

