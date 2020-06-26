XmlPort 50026 "Export CAT2 Item"
{
    // //iCepts WRW 03/25/15 - RFM8431 NAV 2015 XMLPorts  iCepts1.00

    Direction = Export;
    FieldSeparator = '|';
    Format = VariableText;

    schema
    {
        textelement(ExportCAT2Item)
        {
            tableelement(Item;Item)
            {
                RequestFilterFields = "No.","Vendor No.";
                XmlName = 'Item';
                fieldelement("No.";Item."No.")
                {
                }
                textelement(CompCode)
                {

                    trigger OnBeforePassVariable()
                    begin
                        CompCode := '10'
                    end;
                }
                textelement(WhseCode)
                {

                    trigger OnBeforePassVariable()
                    begin
                        WhseCode := 'PVF';
                    end;
                }
                textelement(MaterialCode)
                {

                    trigger OnBeforePassVariable()
                    begin
                        MaterialCode := Item."No.";
                    end;
                }
                fieldelement(Description;Item.Description)
                {
                }
                textelement(MatStat)
                {

                    trigger OnBeforePassVariable()
                    begin
                        MatStat := '1';
                    end;
                }
                textelement(MatType)
                {

                    trigger OnBeforePassVariable()
                    begin
                        MatType := CopyStr(Item."No.",1,1);
                    end;
                }
                fieldelement(BaseUnitofMeasure;Item."Base Unit of Measure")
                {
                }
                textelement(CDateTime)
                {

                    trigger OnBeforePassVariable()
                    begin
                        CDateTime := Format(CurrentDatetime, 14, '<Year4><Month,2><Day,2><Hours24,2><Minutes,2><Seconds,2>');
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    UpdateWindow;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        Window.Close;
    end;

    trigger OnPreXmlPort()
    begin
        Window.Open('Exporting data through the Export CAT2 Item Export\#1###### records processed.');
    end;

    var
        Window: Dialog;
        x: Integer;

        procedure UpdateWindow()
    begin
        x := x + 1;
        if ((ROUND(x/1000,1) - (x/1000)) = 0) then
          Window.Update(1,x);
    end;
}

