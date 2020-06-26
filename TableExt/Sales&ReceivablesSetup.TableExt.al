TableExtension 50120 tableextension50120 extends "Sales & Receivables Setup" 
{
    fields
    {
        field(50000;"Sigma Dispatcher User";Code[20])
        {
            TableRelation = "User Setup";
        }
        field(50001;"CFS File Path";Text[250])
        {
            Description = 'RFM7626';
        }
       
    }

    
}

