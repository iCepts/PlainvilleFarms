TableExtension 50122 tableextension50122 extends "Job Queue Log Entry" 
{
    fields
    {
        field(50000;"Sigma Error";Option)
        {
            Description = 'RFM6595';
            OptionMembers = " ",Shipment,Production,Receipts;
        }
        field(50001;"Document No.";Code[20])
        {
            Description = 'RFM6595';
        }
        field(50002;"Line No.";Integer)
        {
            Description = 'RFM6595';
        }
        field(50003;"Item No.";Code[20])
        {
            Description = 'RFM6595';
        }
        field(50004;"Quantity Lbs.";Decimal)
        {
            Description = 'RFM6595';
        }
        field(50005;"Quantity Case";Decimal)
        {
            Description = 'RFM6595';
        }
        field(50006;"Lot No.";Code[20])
        {
            Description = 'RFM6595';
        }
        field(50007;"Produced Date Time";DateTime)
        {
            Description = 'RFM6595';
        }
        field(50008;Printed;Boolean)
        {
            Description = 'RFM6595';
        }
        field(50009;"Produced Date";Date)
        {
            Description = 'RFM6595';
        }
    }
}

