XmlPort 50027 "Export CAT2 Vendor"
{
    // //iCepts WRW 03/25/15 - RFM8431 NAV 2015 XMLPorts  iCepts1.00

    Direction = Export;
    FieldSeparator = '|';
    Format = VariableText;

    schema
    {
        textelement(ExportCAT2Vendor)
        {
            tableelement(Vendor;Vendor)
            {
                XmlName = 'Vendor';
                fieldelement("No.";Vendor."No.")
                {
                }
                textelement(CompCode)
                {

                    trigger OnBeforePassVariable()
                    begin
                        CompCode := '10';
                    end;
                }
                textelement(WhseCode)
                {

                    trigger OnBeforePassVariable()
                    begin
                        WhseCode := 'PVF';
                    end;
                }
                textelement(VendNo)
                {

                    trigger OnBeforePassVariable()
                    begin
                        VendNo := Vendor."No.";
                    end;
                }
                fieldelement(Name;Vendor.Name)
                {
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
        Window.Open('Exporting data through the Export CAT2 Vendor Export\#1###### records processed.');
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

