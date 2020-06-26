Codeunit 50001 SecondQtyManagement
{
    // // iCepts BRB 08.16.11 - Hide Message, if flag set & Display Item infor. if Max. & Min. UOM 2 is blank iCepts1.02
    // // iCepts BRB 11.18.09 - Allow posting if from RevalJournal iCepts1.01
    // //Icepts1.0 RFM6066 DRS 06/13/2008


    trigger OnRun()
    begin
    end;

    var
        Item: Record Item;
        HideMessage: Boolean;

        procedure SecondQtyCheck(var pQuantity: Decimal;var "pQuantity 2": Decimal;var pItemNo: Code[10])
    var
        Item: Record Item;
        iRatio: Decimal;
        iMaxQty: Decimal;
        iMinQty: Decimal;
        iErrorMsg: Text[50];
    begin
        Item.Get(pItemNo);
        if ("pQuantity 2" <> 0) and  (Item."Second Count" = true) then
        begin
          iRatio := pQuantity / "pQuantity 2";
             // iCepts BRB 08.16.11 - Display bad item information
             if Item."Maximum UOM per UOM 2" = 0 then
               Error('Item %1 - %2\Maximum UOM per UOM 2 is 0\Please fill in',Item."No.",Item.Description);
             if Item."Minimum UOM per UOM 2" = 0 then
               Error('Item %1 - %2\Minimum UOM per UOM 2 is 0\Please fill in',Item."No.",Item.Description);
             iMinQty := ROUND(pQuantity /  Item."Maximum UOM per UOM 2",1);
             iMaxQty := ROUND(pQuantity /  Item."Minimum UOM per UOM 2",1);
          if ((pQuantity > 0) and (("pQuantity 2" < iMinQty) or ("pQuantity 2" > iMaxQty))) or
             ((pQuantity < 0) and (("pQuantity 2" > iMinQty) or ("pQuantity 2" < iMaxQty)))then
           begin
            iErrorMsg := 'Valid quantity is from %1 to %2 %3';
            // iCepts BRB 08.16.11 - Hide message
            if not HideMessage then
              Message(iErrorMsg,Format(iMinQty,0,'<Precision,0:0><Standard Format,0>'),Format(iMaxQty,0,'<Precision,0:0><Standard Format,0>'
                ),
             Item."Base Unit of Measure 2");
           end;
        end;
    end;

        procedure ZeroCheck(var ItemJnlLine: Record "Item Journal Line")
    begin
        with ItemJnlLine do begin
        if "Source Code" <> 'INVTADJMT' then
        begin
          Item.Get("Item No.");
          if Item."Second Count" = true then
          begin
            if ("Entry Type" = "entry type"::Output) and ("Output Quantity" <> 0) and ("Output Quantity 2" = 0) then begin
                Error('You must enter an Output Quantity 2');
            end;
            if ("Entry Type" = "entry type"::Consumption) and ("Quantity 2" = 0)  then begin
                Error('You must enter a Consumption Quantity 2');
            end;
            if ("Entry Type" = "entry type"::Sale) and ("Document Type" = "document type"::"Sales Credit Memo") and
              ("Quantity 2" = 0)  then
                Error('You must enter a Quantity 2')
            else
              // iCepts BRB 11.18.09 - Add REVALJNL
              if ("Entry Type" = "entry type"::Sale) and ("Quantity 2" = 0) and ("Source Code" <> 'REVALJNL') and
                 ("Document Type" <> "document type"::"Sales Return Receipt") then //iCepts BCH Add code" <> "Document Type"::"Sales Return Receipt") THEN"
                Error('You must enter a Quantity to Ship 2');
            // iCepts BRB 08.05.2009 - Add REVALJNL check
            if ("Entry Type" = "entry type"::Transfer) and ("Quantity 2" = 0) and ("Source Code" <> 'REVALJNL') then begin
                Error('You must enter a Quantity 2');
            end;
            if ("Entry Type" = "entry type"::Purchase) and ("Document Type" = "document type"::"Purchase Return Shipment") and
              ("Quantity 2" = 0)  then
                Error('You must enter a Return Quantity to Ship 2')
            else
              if ("Entry Type" = "entry type"::Purchase) and ("Quantity 2" = 0) and ("Source Code" <> 'REVALJNL')  then
                Error('You must enter a Quantity to Receive 2');

          end;
        end;
        end;
    end;

    local procedure GetItem(var pItemNo: Code[10])
    begin
    end;

        procedure SetHideMessage()
    begin
        // iCepts BRB 08.16.11 - Set HideMessage
        HideMessage := true;
    end;
}

