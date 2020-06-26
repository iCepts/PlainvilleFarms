TableExtension 50102 tableextension50102 extends Customer 
{
    fields
    {

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
            IF "Shipping Agent Code" <> xRec."Shipping Agent Code" THEN
              VALIDATE("Shipping Agent Service Code",'');
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
                  EShipAgentService.CheckNameAddressCustomer(ShippingAgent,Rec);
              END;
            // << Shipping
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
                EMailListEntry.InsertNewEMailListEntry(Contact,"E-Mail",DATABASE::Customer,0,"No.",'',TRUE);
            END;
            // << Shipping
            */
        //end;
        field(50000;"Print Establishment Info";Boolean)
        {
        }
        field(50001;"Shipping Day";Option)
        {
            OptionMembers = " ",Mon,Tue,Wed,Thu,Fri,Sat,Sun;
        }
        field(50002;"Broker Code";Code[10])
        {
            TableRelation = "Broker/Cust Svc Rep".Code;
        }
        field(50005;"Cust Service Rep";Code[10])
        {
            TableRelation = "Broker/Cust Svc Rep".Code;
        }
        field(50010;"Sigma Customer ID";Code[20])
        {
            Description = 'RFM6595';
        }
        field(50011;"Shelf Life";Option)
        {
            Description = 'iCepts1.04';
            OptionMembers = " ",A,B,C;
        }
        field(50012;CFSCustomerID;Code[10])
        {
            Caption = 'CFS Customer ID';
            Description = 'RFM7626';
        }
     
    }
    keys
    {
        key(Key2;"Sigma Customer ID")
        {
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF DOPaymentCreditCard.FINDFIRST THEN
          DOPaymentCreditCard.DeleteByCustomer(Rec);

        #4..50
        ItemCrossReference.SETRANGE("Cross-Reference Type No.","No.");
        ItemCrossReference.DELETEALL;

        IF NOT SocialListeningSearchTopic.ISEMPTY THEN BEGIN
          SocialListeningSearchTopic.FindSearchTopic(SocialListeningSearchTopic."Source Type"::Customer,"No.");
          SocialListeningSearchTopic.DELETEALL;
        END;

        SalesOrderLine.SETCURRENTKEY("Document Type","Bill-to Customer No.");
        SalesOrderLine.SETFILTER(
        #61..122
        VATRegistrationLogMgt.DeleteCustomerLog(Rec);

        DimMgt.DeleteDefaultDim(DATABASE::Customer,"No.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..53
        // >> Shipping
        EMailListEntry.RESET;
        EMailListEntry.SETRANGE("Table ID",DATABASE::Customer);
        EMailListEntry.SETRANGE(Type,0);
        EMailListEntry.SETRANGE(Code,"No.");
        EMailListEntry.SETRANGE("Code 2",'');
        EMailListEntry.DELETEALL;

        ShippingAccount.RESET;
        ShippingAccount.SETRANGE("Ship-to Type",ShippingAccount."Ship-to Type"::Customer);
        ShippingAccount.SETRANGE("Ship-to No.","No.");
        ShippingAccount.DELETEALL;
        // << Shipping
        #58..125
        */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Last Date Modified" := TODAY;

        IF (Name <> xRec.Name) OR
        #4..23
        THEN BEGIN
          MODIFY;
          UpdateContFromCust.OnModify(Rec);
          IF FIND THEN;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..26
          FIND;
        END;
        */
    //end;

    var
        ShippingAgent: Record "Shipping Agent";
       

}