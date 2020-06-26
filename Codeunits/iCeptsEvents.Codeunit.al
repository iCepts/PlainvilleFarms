Codeunit 50020 iCeptsEvents
{
    // //iCepts 05.26.20 dxd Change unit price calculation w add't price allowance to 4 decimals


    trigger OnRun()
    begin
    end;

        procedure AddAllowancesToSalesOrder(SalesHeader: Record "Sales Header")
    var
        Allowance: Record Allowance;
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange(SalesLine."Document Type",SalesHeader."Document Type");
        SalesLine.SetFilter("Document No.",SalesHeader."No.");

        if SalesLine.FindSet() then
          repeat
            Allowance.SetFilter(CustomerNo,SalesHeader."Sell-to Customer No.");
            Allowance.SetFilter(ItemNo,SalesLine."No.");
            Allowance.SetFilter(BeginDate,'<=%1',SalesHeader."Order Date");
            Allowance.SetFilter(EndDate,'>=%1',SalesHeader."Order Date");

            if Allowance.FindSet() then
              repeat
                 AddAllowanceSalesLine(Allowance,SalesLine);
              until(Allowance.Next = 0);
          until(SalesLine.Next() = 0)
    end;

    local procedure AddAllowanceSalesLine(pAllowance: Record Allowance;pSalesLine: Record "Sales Line")
    var
        SalesLine: Record "Sales Line";
        LastLineNo: Integer;
    begin
        LastLineNo := 0;

        SalesLine.SetRange("Document Type",pSalesLine."Document Type");
        SalesLine.SetFilter("Document No.",pSalesLine."Document No.");
        if SalesLine.FindLast() then
          LastLineNo := SalesLine."Line No.";

        SalesLine.Init();
        SalesLine."Document Type" := pSalesLine."Document Type";
        SalesLine."Document No." := pSalesLine."Document No.";
        SalesLine."Line No." := LastLineNo + 10000;
        SalesLine.Type := SalesLine.Type::"G/L Account";
        SalesLine.Validate("No.", pAllowance."G/LAccountNo");
        SalesLine.Description := pAllowance.Description;
        SalesLine."Unit of Measure" := pSalesLine."Unit of Measure";
        SalesLine.Validate(Quantity, -pSalesLine."Qty. to Ship");
        SalesLine.Validate("Qty. to Ship", -pSalesLine."Qty. to Ship");
        //SalesLine.VALIDATE("Unit Price", ROUND(pSalesLine."Unit Price" * (pAllowance.Rate / 100),0.01));
        SalesLine.Validate("Unit Price", ROUND(pSalesLine."Unit Price" * (pAllowance.Rate / 100),0.0001));   //05.26.20 DXD/SLD
        SalesLine.Insert(true);
    end;
}

