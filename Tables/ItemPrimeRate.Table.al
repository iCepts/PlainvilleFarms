Table 50008 "Item Prime Rate"
{
    // // iCepts BRB 10.09.08 - RFM6230 for Turkey Grower Settlement iCepts1.00


    fields
    {
        field(1;"Item No.";Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;

            trigger OnValidate()
            begin
                CalcFields(Description,"Description 2");
            end;
        }
        field(2;"Conv or ABF";Option)
        {
            OptionMembers = Conv,ABF;
        }
        field(3;Breed;Option)
        {
            OptionCaption = 'Hybrid,Nicholas';
            OptionMembers = Hybrid,Nicholas;
        }
        field(4;Description;Text[30])
        {
            CalcFormula = lookup(Item.Description where ("No."=field("Item No.")));
            Caption = 'Type';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;"Description 2";Text[30])
        {
            CalcFormula = lookup(Item."Description 2" where ("No."=field("Item No.")));
            Caption = 'Vendor';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;Poultry;Decimal)
        {
            AutoFormatType = 2;
        }
        field(7;Feed;Decimal)
        {
            AutoFormatType = 2;
        }
        field(8;Medicine;Decimal)
        {
            AutoFormatType = 2;
        }
    }

    keys
    {
        key(Key1;"Item No.","Conv or ABF",Breed)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLSetupRead: Boolean;
        GLSetup: Record "General Ledger Setup";

        procedure GetCurrencyCode(): Code[10]
    begin
        if not GLSetupRead then begin
          GLSetup.Get;
          GLSetupRead := true;
        end;
        exit(GLSetup."Additional Reporting Currency");
    end;

    local procedure GetGLSetup()
    begin
        if not GLSetupRead then
          GLSetup.Get;
        GLSetupRead := true;
    end;
}

