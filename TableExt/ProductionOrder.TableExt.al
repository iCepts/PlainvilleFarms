TableExtension 50124 tableextension50124 extends "Production Order" 
{
    fields
    {
        field(50001;"Start Date";Date)
        {
        }
        field(50002;"Kill Date";Date)
        {
        }
        field(50003;"Kill Date 2";Date)
        {
            Description = 'RFM6230';
        }
        field(50004;"Kill Date 3";Date)
        {
            Description = 'RFM6230';
        }
        field(50005;"Kill Date 4";Date)
        {
            Description = 'RFM6230';
        }
        field(50006;"Kill lbs";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50007;"Kill lbs 2";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50008;"Kill lbs 3";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50009;"Kill lbs 4";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50010;"Vendor No.";Code[20])
        {
            Description = 'RFM6230';
            TableRelation = Vendor;

            trigger OnValidate()
            var
                Vendor: Record Vendor;
            begin
                // iCepts BRB 10.07.08 - RFM6230 Update Desc. 2 from Vendor
                if Vendor.Get("Vendor No.") then
                  "Description 2" := Vendor.Name;
            end;
        }
        field(50011;"Head Adjusted";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50012;"Grower Condemns Lbs";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50013;"Grower Condemns Each";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50014;"DOA Lbs";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50015;"DOA Each";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50016;"Plant Condemns Lbs";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50017;"Plant Condemns Each";Decimal)
        {
            Description = 'RFM6230';
        }
        field(50018;Breed;Option)
        {
            Description = 'RFM6230';
            OptionCaption = 'Hybrid,Nicholas';
            OptionMembers = Hybrid,Nicholas;
        }
        field(50019;"Kill Date 5";Date)
        {
        }
        field(50020;"Kill Date 6";Date)
        {
        }
        field(50021;"Kill lbs 5";Decimal)
        {
        }
        field(50022;"Kill lbs 6";Decimal)
        {
        }
        field(50050;"Sigma Creation Dte";Date)
        {
            Caption = 'CAT2/CFS Produced';
            Description = 'RFM6595';
            Editable = false;
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"Source Type","Source No.","Creation Date")
        // {
        // }
    }
}

