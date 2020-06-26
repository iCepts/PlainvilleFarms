TableExtension 50116 tableextension50116 extends "Sales Invoice Line"
{
    fields
    {
        field(50001; "Quantity 2"; Decimal)
        {
            Caption = 'Quantity 2';
            DecimalPlaces = 0 : 5;
        }
        field(50002; "Unit of Measure Code 2"; Code[10])
        {
            Caption = 'Unit of Measure Code 2';
            TableRelation = if (Type = const(Item)) "Item Unit of Measure".Code where("Item No." = field("No."))
            else
            "Unit of Measure";
        }
        field(50004; "Original Quantity"; Decimal)
        {
            Caption = 'Original Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(50009; "Establishment No."; Code[10])
        {
        }
        field(50010; "Expiration Date"; Date)
        {
        }
        field(50012; "Report Code"; Code[10])
        {
            TableRelation = "Report Code Table";
        }
        field(50013; "Broker Commission"; Boolean)
        {
        }
        field(50020; "EDI Invoice UOM"; Code[10])
        {
            Caption = 'Invoice UOM';
            Description = 'RFM7382';
        }
        field(50021; "EDI Invoice Price"; Decimal)
        {
            Caption = 'Invoice Price';
            Description = 'RFM7382';
        }
        field(50022; "EDI Invoice Qty."; Decimal)
        {
            Caption = 'Invoice Qty.';
            Description = 'RFM7382';
        }
        field(50030; "Original Quantity 2"; Decimal)
        {
        }
        field(50031; "Shelf Life"; Option)
        {
            Description = 'iCepts1.06';
            OptionMembers = " ",A,B,C;
        }
        field(50040; TransferDate; Date)
        {
            Caption = 'Transfer Date';
            Description = 'RFM7405';
        }
        field(50041; SortDate; Date)
        {
            Caption = 'Sort Date';
            Description = 'RFM7405';
        }
        field(50050; "Sigma Updated"; Boolean)
        {
        }
        field(50051; SigmaVWDocNo; Code[20])
        {
        }
        field(50052; SigmaVWLineNo; Integer)
        {
        }
        field(50053; SigmaVWCustID; Code[20])
        {
        }
        field(50054; SigmaVWOrderDate; Date)
        {
        }
        field(50055; SigmaVWProduct; Code[20])
        {
        }
        field(50056; SigmaVWQty; Decimal)
        {
        }
        field(50057; SigmaVWPONo; Code[20])
        {
        }
        field(50058; SigmaVWLastInserted; DateTime)
        {
        }
        field(50059; SigmaVWLastInsUser; Code[20])
        {
        }
        field(50060; SigmaVWLastModified; DateTime)
        {
        }
        field(50061; SigmaVWLastModUser; Code[20])
        {
        }
        field(50066; "Disc. per Qty UM"; Decimal)
        {
            Description = 'RFM8382';
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;Type,"No.","Variant Code","Drop Shipment","Location Code","Shipment Date")
        // {
        // }
        // Unsupported feature: Key containing base fields
        // key(Key2;Type,"No.","Variant Code","Drop Shipment","Location Code",SortDate)
        // {
        // }
    }

    procedure GetBrokerCode(): Code[10]
    var
        SalesInvHeader: Record "Sales Invoice Header";
    begin
        // iCepts BRB 07.25.13 - RFM7914 Broker Code
        if SalesInvHeader.Get("Document No.") then begin
            if "Broker Commission" = true then
                exit(SalesInvHeader."Broker Code");
        end;
        exit('');
    end;
}

