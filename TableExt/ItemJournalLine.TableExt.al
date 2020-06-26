TableExtension 50112 tableextension50112 extends "Item Journal Line" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Item No."(Field 3).OnValidate".

        //trigger "(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Item No." <> xRec."Item No." THEN BEGIN
              "Variant Code" := '';
              "Bin Code" := '';
            #4..28
            IF "Value Entry Type" = "Value Entry Type"::Revaluation THEN
              Item.TESTFIELD("Inventory Value Zero",FALSE);
            Description := Item.Description;
            "Inventory Posting Group" := Item."Inventory Posting Group";
            "Item Category Code" := Item."Item Category Code";
            "Product Group Code" := Item."Product Group Code";
            #35..145
                DATABASE::"Work Center","Work Center No.");

            ReserveItemJnlLine.VerifyChange(Rec,xRec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..31
            //Description2 := Item."Description 2";//iCepts 06.17.15 DXD//06.19
            #32..148

            // RFM6066 06/10/08
            "Unit of Measure Code 2" := Item."Base Unit of Measure 2";
            */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Entry Type" <= "Entry Type"::Transfer THEN
              TESTFIELD("Item No.");

            IF ("Value Entry Type" = "Value Entry Type"::"Direct Cost") AND
               ("Item Charge No." = '') AND
               ("No." = '')
            #7..31
            VALIDATE("Unit of Measure Code");

            ReserveItemJnlLine.VerifyChange(Rec,xRec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #4..34
            */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ("Entry Type" <= "Entry Type"::Transfer) AND (Quantity <> 0) THEN
              TESTFIELD("Item No.");

            IF NOT PhysInvtEntered THEN
              TESTFIELD("Phys. Inventory",FALSE);

            #7..40

            IF Item."Item Tracking Code" <> '' THEN
              ReserveItemJnlLine.VerifyQuantity(Rec,xRec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #4..43
            */
        //end;


        //Unsupported feature: Code Modification on ""Order No."(Field 91).OnValidate".

        //trigger "(Field 91)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CASE "Order Type" OF
              "Order Type"::Production,"Order Type"::Assembly:
                BEGIN
            #4..19
                        ProdOrder.GET(ProdOrder.Status::Released,"Order No.");
                        ProdOrder.TESTFIELD(Blocked,FALSE);
                        Description := ProdOrder.Description;
                      END;
                    "Order Type"::Assembly:
                      BEGIN
                        AssemblyHeader.GET(AssemblyHeader."Document Type"::Order,"Order No.");
                        Description := AssemblyHeader.Description;
                      END;
                  END;

            #31..60
              "Order Type"::Transfer,"Order Type"::Service,"Order Type"::" ":
                ERROR(Text002,FIELDCAPTION("Order No."),FIELDCAPTION("Order Type"),"Order Type");
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..22
                        Description2 := ProdOrder."Description 2"; //06.17.15 dxd
            #23..27
                        Description2 := AssemblyHeader."Description 2" //06.17.15 DXD
            #28..63
            */
        //end;


        //Unsupported feature: Code Modification on ""Variant Code"(Field 5402).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Entry Type" IN ["Entry Type"::Consumption,"Entry Type"::Output] THEN
              WhseValidateSourceLine.ItemLineVerifyChange(Rec,xRec);

            #4..25
            IF "Variant Code" <> '' THEN BEGIN
              ItemVariant.GET("Item No.","Variant Code");
              Description := ItemVariant.Description;
            END ELSE BEGIN
              GetItem;
              Description := Item.Description;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..28
              //Description2 := ItemVariant."Description 2";//06.17.15 DXD //06.19.15

            #29..31
              //Description2 :=Item."Description 2";//06.17.15DXD //06.19.15dxd
            END;
            */
        //end;


        //Unsupported feature: Code Modification on ""No."(Field 5831).OnValidate".

        //trigger "(Field 5831)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF Type = Type::Resource THEN
              TESTFIELD("Entry Type","Entry Type"::"Assembly Output")
            ELSE
            #4..20
                  WorkCenter.TESTFIELD(Blocked,FALSE);
                  "Work Center No." := WorkCenter."No.";
                  Description := WorkCenter.Name;
                  "Gen. Prod. Posting Group" := WorkCenter."Gen. Prod. Posting Group";
                  "Unit Cost Calculation" := WorkCenter."Unit Cost Calculation";
                END;
            #27..29
                  MachineCenter.TESTFIELD(Blocked,FALSE);
                  "Work Center No." := MachineCenter."Work Center No.";
                  Description := MachineCenter.Name;
                  WorkCenter.GET("Work Center No.");
                  WorkCenter.TESTFIELD(Blocked,FALSE);
                  "Gen. Prod. Posting Group" := MachineCenter."Gen. Prod. Posting Group";
            #36..53
                DATABASE::"Salesperson/Purchaser","Salespers./Purch. Code");
              UpdateDimForProdJnlLine;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..23
                  //Description2 := WorkCenter."Name 2";//06.17.15dxd//06.19.15
            #24..32
                  //Description2 := MachineCenter."Name 2";//06.17.15dxd//06.19.15
            #33..56
            */
        //end;
        field(50001;"Quantity 2";Decimal)
        {
            Caption = 'Quantity 2';
            DecimalPlaces = 0:5;

            trigger OnValidate()
            begin
                if "Phys. Inventory" = false then
                   SecondQtyMgt.SecondQtyCheck(Quantity,"Quantity 2","Item No.");
            end;
        }
        field(50002;"Unit of Measure Code 2";Code[10])
        {
            Caption = 'Unit of Measure Code 2';
            TableRelation = "Item Unit of Measure".Code where ("Item No."=field("Item No."));
        }
        field(50003;"Output Quantity 2";Decimal)
        {
            DecimalPlaces = 0:5;

            trigger OnValidate()
            begin
                TestField("Entry Type","entry type"::Output);
                // iCepts BRB 08.16.11 - Set Hide Message
                if "Phys. Inventory" = false then begin
                  if HideMessage then
                    SecondQtyMgt.SetHideMessage;
                  SecondQtyMgt.SecondQtyCheck("Output Quantity","Output Quantity 2","Item No.")
                end;
            end;
        }
        field(50004;"Qty. (Calculated) 2";Decimal)
        {
            Caption = 'Qty. (Calculated) 2';
            DecimalPlaces = 0:5;
            Editable = false;

            trigger OnValidate()
            begin
                Validate("Qty. (Phys. Inventory) 2");
            end;
        }
        field(50005;"Qty. (Phys. Inventory) 2";Decimal)
        {
            Caption = 'Qty. (Phys. Inventory) 2';
            DecimalPlaces = 0:5;

            trigger OnValidate()
            begin
                TestField("Phys. Inventory",true);

                SecondQtyMgt.SecondQtyCheck("Qty. (Phys. Inventory)","Qty. (Phys. Inventory) 2","Item No.");

                "Quantity 2" := 0;
                if "Qty. (Phys. Inventory) 2" >= "Qty. (Calculated) 2" then begin
                  Validate("Quantity 2","Qty. (Phys. Inventory) 2" - "Qty. (Calculated) 2");
                end else begin
                  Validate("Quantity 2","Qty. (Calculated) 2" - "Qty. (Phys. Inventory) 2");
                end;
            end;
        }
        field(50010;"Shelf No.";Code[10])
        {
            Description = 'iCepts1.00';
        }
        field(50012;"Broker Code";Code[10])
        {
            Description = 'RFM7914';
            TableRelation = "Broker/Cust Svc Rep".Code;
        }
        field(50015;"Ship-to Code";Code[10])
        {
            Description = 'RFM8314';
            Editable = false;
        }
        field(50016;"Ship-to Name";Text[50])
        {
            Description = 'RFM8314';
            Editable = false;
        }
        field(50017;Description2;Text[50])
        {
        }
        field(14000351;"EDI Internal Doc. No.";Code[10])
        {
            Caption = 'EDI Internal Doc. No.';
        }
    }
    keys
    {
        key(Key1;"EDI Internal Doc. No.")
        {
        }
        // Unsupported feature: Key containing base fields
        // key(Key2;"Journal Template Name","Journal Batch Name","Shelf No.","Item No.")
        // {
        // }
    }

    procedure SetHideMessage()
    begin
        // iCepts BRB 08.16.11 - Set HideMessage
        HideMessage := true;
    end;

    var
        SecondQtyMgt: Codeunit SecondQtyManagement;
        HideMessage: Boolean;
}

