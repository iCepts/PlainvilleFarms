TableExtension 50118 tableextension50118 extends "Ship-to Address"
{
    fields
    {

        //Unsupported feature: Code Insertion on "Code(Field 2)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF "CAT Ship-to Code" = 0 THEN BEGIN
          ShipToAddress.RESET;
          ShipToAddress.SETCURRENTKEY("CAT Ship-to Code");
          ShipToAddress.SETRANGE("Customer No.","Customer No.");
          IF ShipToAddress.FINDLAST THEN
            "CAT Ship-to Code" := ShipToAddress."CAT Ship-to Code" + 1
          ELSE
            "CAT Ship-to Code" := 1;
        END;
        */
        //end;


        //Unsupported feature: Code Modification on ""Shipping Agent Code"(Field 31).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Shipping Agent Code" <> xRec."Shipping Agent Code" THEN
          VALIDATE("Shipping Agent Service Code",'');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        // >> Shipping
        SalesSetup.GET;
        IF ("Shipping Agent Code" <> xRec."Shipping Agent Code") AND SalesSetup."Enable Shipping" THEN
          IF "Shipping Agent Code" = '' THEN
            "E-Ship Agent Service" := ''
          ELSE BEGIN
            ShippingAgent.GET("Shipping Agent Code");
            VALIDATE(
              "E-Ship Agent Service",
              EShipAgentService.DefaultShipAgentService(ShippingAgent,"Country/Region Code"));

            IF CurrFieldNo = FIELDNO("Shipping Agent Code") THEN
              EShipAgentService.CheckNameAddressShipToAddress(ShippingAgent,Rec);
          END;
        // << Shipping

        IF "Shipping Agent Code" <> xRec."Shipping Agent Code" THEN
          VALIDATE("Shipping Agent Service Code",'');
        */
        //end;


        //Unsupported feature: Code Insertion on ""Country/Region Code"(Field 35)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        // >> Shipping
        IF "Country/Region Code" <> xRec."Country/Region Code" THEN
          IF "Shipping Agent Code" <> '' THEN BEGIN
            xRec."Shipping Agent Code" := '';
            VALIDATE("Shipping Agent Code");
          END;
        // << Shipping
        */
        //end;


        //Unsupported feature: Code Insertion on ""E-Mail"(Field 102)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        // >> Shipping
        IF "E-Mail" <> '' THEN BEGIN
          SalesSetup.GET;

          IF SalesSetup."Enable E-Mail" THEN
            EMailListEntry.InsertNewEMailListEntry(
              Contact,"E-Mail",DATABASE::"Ship-to Address",0,"Customer No.",Code,TRUE);
        END;
        // << Shipping
        */
        //end;
        field(50010; "Sigma Customer ID"; Code[20])
        {
            Description = 'RFM6595';
        }
        field(50011; "CAT Ship-to Code"; Integer)
        {
            Caption = 'CAT2 Ship-to Code';
            MinValue = 1;
        }
        field(50012; CFSCustomerID; Code[10])
        {
            Caption = 'CFS Customer ID';
            Description = 'RFM7626';
        }

    }
    keys
    {
        key(Key2; "Sigma Customer ID")
        {
        }
        key(Key3; "CAT Ship-to Code")
        {
        }
    }


    //Unsupported feature: Code Insertion on "OnDelete".

    //trigger OnDelete()
    //begin
    /*
    // >> Shipping
    EMailListEntry.RESET;
    EMailListEntry.SETRANGE("Table ID",DATABASE::"Ship-to Address");
    EMailListEntry.SETRANGE(Type,0);
    EMailListEntry.SETRANGE(Code,"Customer No.");
    EMailListEntry.SETRANGE("Code 2",Code);
    EMailListEntry.DELETEALL;

    ShippingAccount.RESET;
    ShippingAccount.SETRANGE("Ship-to Type",ShippingAccount."Ship-to Type"::Customer);
    ShippingAccount.SETRANGE("Ship-to No.","Customer No.");
    ShippingAccount.SETRANGE("Ship-to Code",Code);
    ShippingAccount.DELETEALL;
    // << Shipping
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Cust.GET("Customer No.");
    Name := Cust.Name;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    Cust.GET("Customer No.");
    Name := Cust.Name;

    // >> Shipping
    "Shipping Agent Code" := Cust."Shipping Agent Code";
    "E-Ship Agent Service" := Cust."E-Ship Agent Service";
    "Free Freight" := Cust."Free Freight";
    "Residential Delivery" := Cust."Residential Delivery";
    "Blind Shipment" := Cust."Blind Shipment";
    "Double Blind Ship-from Cust No" := Cust."Double Blind Ship-from Cust No";
    "Double Blind Shipment" := Cust."Double Blind Shipment";
    "No Free Freight Lines on Order" := Cust."No Free Freight Lines on Order";
    "Packing Rule Code" := Cust."Packing Rule Code";
    "Shipping Payment Type" := Cust."Shipping Payment Type";
    "Shipping Insurance" := Cust."Shipping Insurance";
    // << Shipping
    */
    //end;

    var
        ShippingAgent: Record "Shipping Agent";
        SalesSetup: Record "Sales & Receivables Setup";
        ShipToAddress: Record "Ship-to Address";
}

