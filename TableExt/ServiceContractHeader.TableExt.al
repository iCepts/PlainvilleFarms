TableExtension 50131 tableextension50131 extends "Service Contract Header" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Salesperson Code"(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;
            MODIFY;

            CreateDim(
              DATABASE::"Salesperson/Purchaser","Salesperson Code",
              DATABASE::Customer,"Bill-to Customer No.",
              DATABASE::"Responsibility Center","Responsibility Center",
              DATABASE::"Service Contract Template","Template No.",
              DATABASE::"Service Order Type","Service Order Type");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF (Status <> Status::Canceled) AND
               (NOT SuspendChangeStatus)
            THEN
              TESTFIELD("Change Status","Change Status"::Open);
            #2..9
            */
        //end;


        //Unsupported feature: Code Modification on ""Bill-to Customer No."(Field 16).OnValidate".

        //trigger "(Field 16)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;
            IF xRec."Bill-to Customer No." <> "Bill-to Customer No." THEN
              IF xRec."Bill-to Customer No." <> '' THEN BEGIN
                IF HideValidationDialog THEN
            #5..47
              DATABASE::"Responsibility Center","Responsibility Center",
              DATABASE::"Service Contract Template","Template No.",
              DATABASE::"Service Order Type","Service Order Type");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF (Status <> Status::Canceled) AND
               (NOT SuspendChangeStatus)
            THEN
              TESTFIELD("Change Status","Change Status"::Open);

            #2..50
            */
        //end;


        //Unsupported feature: Code Modification on ""Starting Date"(Field 35).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;

            IF "Last Invoice Date" <> 0D THEN
              ERROR(
            #5..46
                  VALIDATE("Last Invoice Date");
              VALIDATE("Service Period");
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF (Status <> Status::Canceled) AND
               NOT SuspendChangeStatus
            THEN
              TESTFIELD("Change Status","Change Status"::Open);
            #2..49
            */
        //end;


        //Unsupported feature: Code Modification on ""Expiration Date"(Field 36).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;

            IF "Expiration Date" <> xRec."Expiration Date" THEN BEGIN
              IF "Expiration Date" <> 0D THEN BEGIN
            #5..42
              END;
              VALIDATE("Invoice Period");
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF (Status <> Status::Canceled) AND
               NOT SuspendChangeStatus
            THEN
              TESTFIELD("Change Status","Change Status"::Open);
            #2..45
            */
        //end;


        //Unsupported feature: Code Modification on ""Response Time (Hours)"(Field 55).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;

            IF "Response Time (Hours)" <> xRec."Response Time (Hours)" THEN BEGIN
              ServContractLine.RESET;
            #5..12
                THEN
                  ServContractLine.MODIFYALL("Response Time (Hours)","Response Time (Hours)",TRUE);
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF (Status <> Status::Canceled) AND
               NOT SuspendChangeStatus
            THEN
              TESTFIELD("Change Status","Change Status"::Open);
            #2..15
            */
        //end;


        //Unsupported feature: Code Modification on ""Shortcut Dimension 1 Code"(Field 67).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;
            ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            MODIFY;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            MODIFY;
            */
        //end;


        //Unsupported feature: Code Modification on ""Shortcut Dimension 2 Code"(Field 68).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;
            ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            MODIFY;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            MODIFY;
            */
        //end;
        field(50000;"Troubleshooting Code";Code[20])
        {
            TableRelation = "Troubleshooting Header";
        }
    }


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CheckChangeStatus;
        IF ("Contract Type" = "Contract Type"::Contract) AND ("Contract No." <> '') THEN BEGIN
          ServMgtSetup.GET;
          IF ServMgtSetup."Register Contract Changes" THEN
        #5..14
        THEN
          ContractGainLossEntry.AddEntry(4,"Contract Type",
            "Contract No.","Annual Amount" - xRec."Annual Amount",'');
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF (Status <> Status::Canceled) AND
           NOT SuspendChangeStatus
        THEN
          TESTFIELD("Change Status","Change Status"::Open);
        #2..17
        */
    //end;
}

