TableExtension 50105 tableextension50105 extends Item
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Sales (Qty.)"(Field 72)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Sales (LCY)"(Field 78)".


        //Unsupported feature: Property Modification (CalcFormula) on ""COGS (LCY)"(Field 83)".

        modify("Sales Unit of Measure")
        {
            TableRelation = "Item Unit of Measure".Code where("Item No." = field("No."));
        }
        modify("Purch. Unit of Measure")
        {
            TableRelation = "Item Unit of Measure".Code where("Item No." = field("No."));
        }
        modify("Put-away Unit of Measure Code")
        {
            TableRelation = "Item Unit of Measure".Code where("Item No." = field("No."));
        }

        //Unsupported feature: Code Modification on ""Item Category Code"(Field 5702).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Item Category Code" <> xRec."Item Category Code" THEN BEGIN
          IF ItemCategory.GET("Item Category Code") THEN BEGIN
            IF "Gen. Prod. Posting Group" = '' THEN
        #4..14
            VALIDATE("Costing Method",ItemCategory."Def. Costing Method");
          END;

          IF NOT ProductGrp.GET("Item Category Code","Product Group Code") THEN
            VALIDATE("Product Group Code",'')
          ELSE
            VALIDATE("Product Group Code");
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..17
          // iCepts BRB 11.10.10 - Update Master Group too
          IF NOT ProductGrp.GET("Item Category Code","Master Group Code","Product Group Code") THEN BEGIN
            VALIDATE("Product Group Code",'');
            VALIDATE("Master Group Code",'');
          END ELSE BEGIN
            VALIDATE("Product Group Code");
            VALIDATE("Master Group Code");
          END;
        END;

        CALCFIELDS(ItemCategoryCodeDesc); // iCepts BRB 11.10.10 - update description
        */
        //end;


        //Unsupported feature: Code Insertion on ""Product Group Code"(Field 5704)".

        //trigger OnLookup(var Text: Text): Boolean
        //begin
        /*
        // iCepts BRB 11.10.10 - Use lookup to bring in Master Group Code and Product Group Code
        CLEAR(ProductGroups);
        ProductGrp.RESET;
        ProductGrp.SETRANGE("Item Category Code","Item Category Code");
        ProductGroups.SETTABLEVIEW(ProductGrp);
        ProductGroups.SETRECORD(ProductGrp);
        ProductGroups.LOOKUPMODE := TRUE;
        IF ProductGroups.RUNMODAL = ACTION::LookupOK THEN BEGIN
          ProductGroups.GETRECORD(ProductGrp);
          "Master Group Code" := ProductGrp."Master Group Code";
          VALIDATE("Product Group Code",ProductGrp.Code);
        END;
        */
        //end;


        //Unsupported feature: Code Insertion on ""Product Group Code"(Field 5704)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        "Product Group Total Code" := COPYSTR("Product Group Code",1,2);
        CALCFIELDS("Product Group Code Desc"); // iCepts BRB 11.10.10 - update description
        */
        //end;
        field(50001; "Inventory 2"; Decimal)
        {
            CalcFormula = sum ("Item Ledger Entry"."Quantity 2" where("Item No." = field("No."),
                                                                      "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                      "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                      "Location Code" = field("Location Filter"),
                                                                      "Drop Shipment" = field("Drop Shipment Filter"),
                                                                      "Variant Code" = field("Variant Filter"),
                                                                      "Lot No." = field("Lot No. Filter"),
                                                                      "Serial No." = field("Serial No. Filter")));
            Caption = 'Quantity on Hand 2';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Base Unit of Measure 2"; Code[10])
        {
            Caption = 'Base Unit of Measure 2';
            TableRelation = "Item Unit of Measure".Code where("Item No." = field("No."));
        
            trigger OnValidate()
            var
            ItemUnitOfMeasure:Record "Item Unit of Measure";

            begin
                //TestNoOpenEntriesExist(FIELDCAPTION("Base Unit of Measure"));  DRS Turned off 7/28/09 per Rose

                if "Base Unit of Measure 2" <> '' then begin
                    ItemUnitOfMeasure.Get("No.", "Base Unit of Measure");
                    ItemUnitOfMeasure.TestField("Qty. per Unit of Measure", 1);
                end;
                if CurrFieldNo <> 0 then
                    Modify(true);
            end;
        }
        field(50003; "Second Count"; Boolean)
        {
        }
        field(50004; "Maximum UOM per UOM 2"; Decimal)
        {
        }
        field(50005; "Minimum UOM per UOM 2"; Decimal)
        {
        }
        field(50006; "Maint. Code"; Text[30])
        {
        }
        field(50007; "Qty. on Sales Order 2"; Decimal)
        {
            CalcFormula = sum ("Sales Line"."Outstanding Quantity 2" where("Document Type" = const(Order),
                                                                           Type = const(Item),
                                                                           "No." = field("No."),
                                                                           "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                           "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                           "Location Code" = field("Location Filter"),
                                                                           "Drop Shipment" = field("Drop Shipment Filter"),
                                                                           "Variant Code" = field("Variant Filter"),
                                                                           "Shipment Date" = field("Date Filter")));
            Caption = 'Qty. on Sales Order 2';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50008; "Sales (Qty. 2)"; Decimal)
        {
            CalcFormula = - sum ("Item Ledger Entry"."Quantity 2" where("Entry Type" = const(Sale),
                                                                       "Item No." = field("No."),
                                                                       "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                       "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                       "Location Code" = field("Location Filter"),
                                                                       "Drop Shipment" = field("Drop Shipment Filter"),
                                                                       "Variant Code" = field("Variant Filter"),
                                                                       "Posting Date" = field("Date Filter"),
                                                                       "Source No." = field("Customer Filter")));
            Caption = 'Cust. Order Sales (Qty. )';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50009; "Establishment No."; Code[10])
        {
        }
        field(50010; "Master Group Code"; Code[20])
        {
           /*  TableRelation = "Product Group"."Master Group Code" where("Item Category Code" = field("Item Category Code"));

            trigger OnLookup()
            begin
                // iCepts BRB 11.10.10 - Use lookup to bring in Master Group Code and Product Group Code
                Clear(ProductGroups);
                ProductGrp.Reset;
                ProductGrp.SetRange("Item Category Code", "Item Category Code");
                ProductGroups.SetTableview(ProductGrp);
                ProductGroups.SetRecord(ProductGrp);
                ProductGroups.LookupMode := true;
                if ProductGroups.RunModal = Action::LookupOK then begin
                    ProductGroups.GetRecord(ProductGrp);
                    "Master Group Code" := ProductGrp."Master Group Code";
                    Validate("Product Group Code", ProductGrp.Code);
                end;
            end; */

            trigger OnValidate()
            begin
                CalcFields(MasterGroupCodeDesc); // iCepts BRB 11.10.10 - update description
            end;
        }
        field(50011; "Customer Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Customer."No.";
        }
        field(50012; "Product Group Total Code"; Code[20])
        {
            TableRelation = "Product Group Total".Code;
        }
        field(50014; "Qty. SO To Ship"; Decimal)
        {
            CalcFormula = sum ("Sales Line"."Qty. to Ship" where("Document Type" = const(Order),
                                                                 Type = const(Item),
                                                                 "No." = field("No."),
                                                                 "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                 "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                 "Location Code" = field("Location Filter"),
                                                                 "Drop Shipment" = field("Drop Shipment Filter"),
                                                                 "Variant Code" = field("Variant Filter"),
                                                                 "Shipment Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50015; "Qty. SO To Ship2"; Decimal)
        {
            CalcFormula = sum ("Sales Line"."Qty. to Ship 2" where("Document Type" = const(Order),
                                                                   Type = const(Item),
                                                                   "No." = field("No."),
                                                                   "Shortcut Dimension 1 Code" = field("Global Dimension 1 Code"),
                                                                   "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                   "Location Code" = field("Location Filter"),
                                                                   "Drop Shipment" = field("Drop Shipment Filter"),
                                                                   "Variant Code" = field("Variant Filter"),
                                                                   "Shipment Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50020; "Product Group Code Desc"; Text[30])
        {
           /*  CalcFormula = lookup ("Product Group".Description where("Item Category Code" = field("Item Category Code"),
                                                                    Code = field("Product Group Code")));
            FieldClass = FlowField; */
        }
        field(50021; MasterGroupCodeDesc; Text[50])
        {
            CalcFormula = lookup ("Master Group".Description where(Code = field("Master Group Code")));
            Caption = 'Master Group Code Desc';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50022; ItemCategoryCodeDesc; Text[30])
        {
            CalcFormula = lookup ("Item Category".Description where(Code = field("Item Category Code")));
            Caption = 'Item Category Code Desc';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; ReportCode; Code[10])
        {
            TableRelation = "Report Code Table"."Report Code";
        }
        field(50050; "Production Department"; Code[10])
        {
            TableRelation = "Production Department".Code;
        }
        field(50106; Poultry; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Poults';
        }
        field(50107; Feed; Decimal)
        {
            AutoFormatType = 2;
        }
        field(50108; "Base Grower pay"; Decimal)
        {
            AutoFormatType = 2;
        }
        field(50110; "Special Price"; Decimal)
        {
            DecimalPlaces = 2 : 4;
            Description = 'iCepts1.13';
        }
        field(50111; "Shelf Life (Numeric)"; Decimal)
        {
            AutoFormatType = 2;
            Description = 'iCepts1.14';
        }
        field(50112; "Shelf Life (Text)"; Text[30])
        {
            Description = 'iCepts1.14';
        }

    }
    keys
    {

        key(Key2; "Production Department")
        {
        }
        // Unsupported feature: Key containing base fields
        // key(Key3;"Product Group Code")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key4;"Product Group Total Code","Product Group Code")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key5;"Global Dimension 1 Code","Product Group Code")
        // {
        // }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckJournalsAndWorksheets(0);
    CheckDocuments(0);

    #4..107

    ItemCrossReference.SETRANGE("Item No.","No.");
    ItemCrossReference.DELETEALL;

    IF NOT SocialListeningSearchTopic.ISEMPTY THEN BEGIN
      SocialListeningSearchTopic.FindSearchTopic(SocialListeningSearchTopic."Source Type"::Item,"No.");
      SocialListeningSearchTopic.DELETEALL;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..110
    */
    //end;

    var
     //   ProductGroups: Page "Product Groups";
}

