TableExtension 50114 tableextension50114 extends "Sales Shipment Header"
{
    fields
    {
        field(50003; "Cust Service Rep"; Code[10])
        {
            TableRelation = "Broker/Cust Svc Rep";
        }
        field(50004; "Shelf Life"; Option)
        {
            Description = 'iCepts1.01';
            OptionMembers = " ",A,B,C;
        }

    }
    keys
    {

    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TESTFIELD("No. Printed");
    LOCKTABLE;
    PostSalesLinesDelete.DeleteSalesShptLines(Rec);
    #4..9

    IF CertificateOfSupply.GET(CertificateOfSupply."Document Type"::"Sales Shipment","No.") THEN
      CertificateOfSupply.DELETE(TRUE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    // iCepts BRB 11.15.10 - Do not allow to delete :START
    ERROR('You are not allowed to delete Posted Shipments\Select to Undo the Shipment');
    // iCepts BRB 11.15.10 - Do not allow to delete :END

    #1..12
    */
    //end;
}

