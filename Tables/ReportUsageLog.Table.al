Table 50099 "Report Usage Log"
{

    fields
    {
        field(1;"No.";Integer)
        {
            AutoIncrement = true;
            MinValue = 1;
        }
        field(2;"User ID";Code[50])
        {
            Caption = 'User ID';
            TableRelation = User.State;
        }
        field(3;"Report ID";Integer)
        {
            Caption = 'Report ID';
        }
        field(4;"Report Name";Text[249])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where ("Object Type"=const(Report),
                                                                           "Object ID"=field("Report ID")));
            Caption = 'Report Name';
            FieldClass = FlowField;
        }
        field(5;"Date Time";DateTime)
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

