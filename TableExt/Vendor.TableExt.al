TableExtension 50104 tableextension50104 extends Vendor
{
    fields
    {

        //Unsupported feature: Code Insertion on ""Shipping Agent Code"(Field 31)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        // >> Shipping
        PurchSetup.GET;
        IF ("Shipping Agent Code" <> xRec."Shipping Agent Code") AND PurchSetup."Enable Shipping" THEN
          IF "Shipping Agent Code" = '' THEN
            "E-Ship Agent Service" := ''
          ELSE BEGIN
            ShippingAgent.GET("Shipping Agent Code");
            VALIDATE(
              "E-Ship Agent Service",
              EShipAgentService.DefaultShipAgentService(ShippingAgent,"Country/Region Code"));
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
          PurchSetup.GET;

          IF PurchSetup."Enable E-Mail" THEN
            EMailListEntry.InsertNewEMailListEntry(Contact,"E-Mail",DATABASE::Vendor,0,"No.",'',TRUE);
        END;
        // << Shipping
        */
        //end;
        field(50000; "Vendor Type"; Text[30])
        {
        }
        field(50001; "Farm Number"; Code[20])
        {
        }

    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MoveEntries.MoveVendorEntries(Rec);

    CommentLine.SETRANGE("Table Name",CommentLine."Table Name"::Vendor);
    #4..14
    ItemCrossReference.SETRANGE("Cross-Reference Type No.","No.");
    ItemCrossReference.DELETEALL;

    PurchOrderLine.SETCURRENTKEY("Document Type","Pay-to Vendor No.");
    PurchOrderLine.SETFILTER(
      "Document Type",'%1|%2',
    #21..43
    ItemVendor.SETRANGE("Vendor No.","No.");
    ItemVendor.DELETEALL(TRUE);

    IF NOT SocialListeningSearchTopic.ISEMPTY THEN BEGIN
      SocialListeningSearchTopic.FindSearchTopic(SocialListeningSearchTopic."Source Type"::Vendor,"No.");
      SocialListeningSearchTopic.DELETEALL;
    END;

    PurchPrice.SETCURRENTKEY("Vendor No.");
    PurchPrice.SETRANGE("Vendor No.","No.");
    PurchPrice.DELETEALL(TRUE);
    #55..61
    PurchPrepmtPct.DELETEALL(TRUE);

    VATRegistrationLogMgt.DeleteVendorLog(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..17
    // >> Shipping
    EMailListEntry.RESET;
    EMailListEntry.SETRANGE("Table ID",DATABASE::Vendor);
    EMailListEntry.SETRANGE(Type,0);
    EMailListEntry.SETRANGE(Code,"No.");
    EMailListEntry.SETRANGE("Code 2",'');
    EMailListEntry.DELETEALL;

    ShippingAccount.RESET;
    ShippingAccount.SETRANGE("Ship-to Type",ShippingAccount."Ship-to Type"::Vendor);
    ShippingAccount.SETRANGE("Ship-to No.","No.");
    ShippingAccount.DELETEALL;
    // << Shipping

    #18..46
    #52..64
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Date Modified" := TODAY;

    IF (Name <> xRec.Name) OR
    #4..22
    THEN BEGIN
      MODIFY;
      UpdateContFromVend.OnModify(Rec);
      IF FIND THEN;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..25
      FIND;
    END;
    */
    //end;

    var
        ShippingAgent: Record "Shipping Agent";



}