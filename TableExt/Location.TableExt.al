TableExtension 50101 tableextension50101 extends Location
{
    fields
    {

        //Unsupported feature: Code Insertion on ""Country/Region Code"(Field 5720)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        // >> Shipping
        IF "Country/Region Code" <> xRec."Country/Region Code" THEN
          IF "E-Ship Agent Code" <> '' THEN BEGIN
            xRec."E-Ship Agent Code" := '';
            VALIDATE("E-Ship Agent Code");
          END;
        // << Shipping
        */
        //end;
        field(50000; DownloadToCAT2; Boolean)
        {
            Caption = 'Download To CAT2';
            Description = 'RFM7895';
        }
        field(50001; CAT2WarehouseCode; Code[3])
        {
            Caption = 'CAT2 Warehouse Code';
        }

    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WMSCheckWarehouse;

    TransferRoute.SETRANGE("Transfer-from Code",Code);
    #4..14
        WorkCenter.VALIDATE("Location Code",'');
        WorkCenter.MODIFY(TRUE);
      UNTIL WorkCenter.NEXT = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..17

    // >> Shipping
    ShippingAccount.RESET;
    ShippingAccount.SETRANGE("Ship-to Type",ShippingAccount."Ship-to Type"::Location);
    ShippingAccount.SETRANGE("Ship-to No.",Code);
    ShippingAccount.SETRANGE("Ship-to Code",'');
    ShippingAccount.DELETEALL;
    // << Shipping
    */
    //end;

    var
        ShippingAgent: Record "Shipping Agent";

}

