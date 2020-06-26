Codeunit 70000080 "Sales-Post80"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Sales-Post"(Codeunit 80)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=08262016D;
        //      Time=112358T;
        //      Modified=Yes;
        //      Version List=NAVW18.00.00.38798,NAVNA8.00.00.38798,SE0.60,iCepts1.11;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Sales-Post"(Codeunit 80);
        //    }
        //    CHANGES
        //    {
        //      { Deletion          ;Target=OnRun.SalesLineBackup(Variable 1022);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             SalesLineBackup@1022 : Record "Sales Line";
        //                           }
        //                            }
        //      { Deletion          ;Target=OnRun.RemQtyToInvoiceCurrLine(Variable 1052);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             RemQtyToInvoiceCurrLine@1052 : Decimal;
        //                           }
        //                            }
        //      { Deletion          ;Target=OnRun.RemQtyToInvoiceCurrLineBase(Variable 1053);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             RemQtyToInvoiceCurrLineBase@1053 : Decimal;
        //                           }
        //                            }
        //      { Insertion         ;Target=OnRun;
        //                           InsertAfter=TransactionLogEntryNo(Variable 1024);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             EDITradePartnerItem@1000000001 : Record UnknownRecord14002364;
        //                             ItemUOM@1000000000 : Record "Item Unit of Measure";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF PostingDateExists AND (ReplacePostingDate OR ("Posting Date" = 0D)) THEN BEGIN
        //                                            "Posting Date" := PostingDate;
        //                                            VALIDATE("Currency Code");
        //                                          #4..10
        //                                          ServiceItemTmp2.DELETEALL;
        //                                          ServiceItemCmpTmp2.DELETEALL;
        //                                          WITH SalesHeader DO BEGIN
        //                                            TESTFIELD("On Hold",'');
        //                                            TESTFIELD("Document Type");
        //                                            TESTFIELD("Sell-to Customer No.");
        //                                          #17..287
        //                                            SourceCodeSetup.GET;
        //                                            SrcCode := SourceCodeSetup.Sales;
        //  
        //                                            // Insert shipment header
        //                                            IF Ship THEN BEGIN
        //                                              IF ("Document Type" = "Document Type"::Order) OR
        //                                          #294..313
        //                                                SalesShptHeader."No. Printed" := 0;
        //                                                SalesShptHeader.INSERT;
        //  
        //                                                ApprovalMgt.MoveApprvalEntryToPosted(TempApprovalEntry,DATABASE::"Sales Shipment Header",SalesShptHeader."No.");
        //  
        //                                                IF SalesSetup."Copy Comments Order to Shpt." THEN BEGIN
        //                                          #320..371
        //                                                    "No.",ReturnRcptHeader."No.");
        //                                                  RecordLinkManagement.CopyLinks(Rec,ReturnRcptHeader);
        //                                                END;
        //                                                IF WhseReceive THEN BEGIN
        //                                                  WhseRcptHeader.GET(TempWhseRcptHeader."No.");
        //                                                  WhsePostRcpt.CreatePostedRcptHeader(PostedWhseRcptHeader,WhseRcptHeader,"Return Receipt No.","Posting Date");
        //                                                END;
        //                                                IF WhseShip THEN BEGIN
        //                                                  WhseShptHeader.GET(TempWhseShptHeader."No.");
        //                                                  WhsePostShpt.CreatePostedShptHeader(PostedWhseShptHeader,WhseShptHeader,"Return Receipt No.","Posting Date");
        //                                          #382..466
        //                                                GenJnlLineDocType := GenJnlLine."Document Type"::"Credit Memo";
        //                                                GenJnlLineDocNo := SalesCrMemoHeader."No.";
        //                                                GenJnlLineExtDocNo := SalesCrMemoHeader."External Document No.";
        //                                              END;
        //  
        //                                            UpdateIncomingDocument("Incoming Document Entry No.","Posting Date",GenJnlLineDocNo);
        //                                          #473..545
        //                                            SalesLinesProcessed := FALSE;
        //                                            IF SalesLine.FINDSET THEN
        //                                              REPEAT
        //                                                SalesLine.TESTFIELD(Description);
        //                                                IF SalesLine.Type = SalesLine.Type::Item THEN
        //                                                  DummyTrackingSpecification.CheckItemTrackingQuantity(
        //                                                    DATABASE::"Sales Line",SalesLine."Document Type",SalesLine."Document No.",SalesLine."Line No.",
        //                                          #553..556
        //                                                IF SalesLine."Prepmt. Line Amount" > SalesLine."Prepmt. Amt. Inv." THEN
        //                                                  SalesLine.FIELDERROR("Prepmt. Line Amount",Text27000);
        //                                                IF SalesLine.Type = SalesLine.Type::"Charge (Item)" THEN BEGIN
        //                                                  SalesLine.TESTFIELD(Amount);
        //                                                  SalesLine.TESTFIELD("Job No.",'');
        //                                                  SalesLine.TESTFIELD("Job Contract Entry No.",0);
        //                                                END;
        //                                          #564..626
        //  
        //                                                IF ("Document Type" = "Document Type"::Invoice) AND (SalesLine."Shipment No." <> '') THEN BEGIN
        //                                                  SalesLine."Quantity Shipped" := SalesLine.Quantity;
        //                                                  SalesLine."Qty. Shipped (Base)" := SalesLine."Quantity (Base)";
        //                                                  SalesLine."Qty. to Ship" := 0;
        //                                                  SalesLine."Qty. to Ship (Base)" := 0;
        //                                          #633..849
        //                                                            TempInvoicingSpecification,TempItemLedgEntryNotInvoiced,
        //                                                            TrackingSpecificationExists,HasATOShippedNotInvoiced);
        //  
        //                                                          UpdateRemainingQtyToBeInvoiced(SalesShptLine,RemQtyToInvoiceCurrLine,RemQtyToInvoiceCurrLineBase);
        //  
        //                                                          SalesShptLine.TESTFIELD("Sell-to Customer No.",SalesLine."Sell-to Customer No.");
        //                                                          SalesShptLine.TESTFIELD(Type,SalesLine.Type);
        //                                                          SalesShptLine.TESTFIELD("No.",SalesLine."No.");
        //                                          #858..870
        //  
        //                                                          IF TrackingSpecificationExists OR HasATOShippedNotInvoiced THEN
        //                                                            ItemTrackingMgt.AdjustQuantityRounding(
        //                                                              RemQtyToInvoiceCurrLine,QtyToBeInvoiced,
        //                                                              RemQtyToInvoiceCurrLineBase,QtyToBeInvoicedBase);
        //  
        //                                                          RemQtyToBeInvoiced := RemQtyToBeInvoiced - QtyToBeInvoiced;
        //                                                          RemQtyToBeInvoicedBase := RemQtyToBeInvoicedBase - QtyToBeInvoicedBase;
        //                                                          UpdateInvoicedQtyOnShipmentLine(SalesShptLine,QtyToBeInvoiced,QtyToBeInvoicedBase);
        //                                                          IF SalesLine.Type = SalesLine.Type::Item THEN
        //                                                            PostItemJnlLine(
        //                                                              SalesLine,
        //                                          #883..995
        //                                                  SalesLine.Type::"Charge (Item)":
        //                                                    IF Invoice OR ItemChargeAssgntOnly THEN BEGIN
        //                                                      ItemJnlRollRndg := TRUE;
        //                                                      SalesLineBackup.COPY(SalesLine);
        //                                                      IF FindTempItemChargeAssgntSales(SalesLineBackup."Line No.") THEN
        //                                                        REPEAT
        //                                                          IF ItemChargeAssgntOnly AND (GenJnlLineDocNo = '') THEN
        //                                                            GenJnlLineDocNo := TempItemChargeAssgntSales."Applies-to Doc. No.";
        //                                                          CASE TempItemChargeAssgntSales."Applies-to Doc. Type" OF
        //                                                            TempItemChargeAssgntSales."Applies-to Doc. Type"::Shipment:
        //                                                              BEGIN
        //                                                                PostItemChargePerShpt(SalesLineBackup);
        //                                                                TempItemChargeAssgntSales.MARK(TRUE);
        //                                                              END;
        //                                                            TempItemChargeAssgntSales."Applies-to Doc. Type"::"Return Receipt":
        //                                                              BEGIN
        //                                                                PostItemChargePerRetRcpt(SalesLineBackup);
        //                                                                TempItemChargeAssgntSales.MARK(TRUE);
        //                                                              END;
        //                                                            TempItemChargeAssgntSales."Applies-to Doc. Type"::Order,
        //                                          #1016..1040
        //                                                  SalesShptLine."Posting Date" := "Posting Date";
        //                                                  SalesShptLine."Document No." := SalesShptHeader."No.";
        //                                                  SalesShptLine.Quantity := TempSalesLine."Qty. to Ship";
        //                                                  SalesShptLine."Quantity (Base)" := TempSalesLine."Qty. to Ship (Base)";
        //                                                  IF ABS(TempSalesLine."Qty. to Invoice") > ABS(TempSalesLine."Qty. to Ship") THEN BEGIN
        //                                                    SalesShptLine."Quantity Invoiced" := TempSalesLine."Qty. to Ship";
        //                                          #1047..1181
        //                                                    SalesInvLine."Document No." := SalesInvHeader."No.";
        //                                                    SalesInvLine.Quantity := TempSalesLine."Qty. to Invoice";
        //                                                    SalesInvLine."Quantity (Base)" := TempSalesLine."Qty. to Invoice (Base)";
        //                                                    SalesInvLine.INSERT;
        //                                                    ItemJnlPostLine.CollectValueEntryRelation(TempValueEntryRelation,SalesInvLine.RowID1);
        //                                                  END ELSE BEGIN // Credit Memo
        //                                          #1188..1205
        //                                                END;
        //                                              UNTIL LastLineRetrieved;
        //  
        //                                            IF NOT ("Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"]) THEN BEGIN
        //                                              ReverseAmount(TotalSalesLine);
        //                                              ReverseAmount(TotalSalesLineLCY);
        //                                          #1212..1380
        //                                            IF ICGenJnlLineNo > 0 THEN
        //                                              PostICGenJnl;
        //  
        //                                            IF Ship THEN BEGIN
        //                                              "Last Shipping No." := "Shipping No.";
        //                                              "Shipping No." := '';
        //                                          #1387..1394
        //                                              "Return Receipt No." := '';
        //                                            END;
        //  
        //                                            IF ("Document Type" IN ["Document Type"::Order,"Document Type"::"Return Order"]) AND
        //                                               (NOT EverythingInvoiced)
        //                                            THEN BEGIN
        //                                              MODIFY;
        //                                              // Insert T336 records
        //                                              InsertTrackingSpecification;
        //                                          #1404..1408
        //                                                      SalesLine."Quantity Shipped" :=
        //                                                        SalesLine."Quantity Shipped" +
        //                                                        SalesLine."Qty. to Ship";
        //                                                      SalesLine."Qty. Shipped (Base)" :=
        //                                                        SalesLine."Qty. Shipped (Base)" +
        //                                                        SalesLine."Qty. to Ship (Base)";
        //                                                    END;
        //                                                    IF Receive THEN BEGIN
        //                                                      SalesLine."Return Qty. Received" :=
        //                                                        SalesLine."Return Qty. Received" + SalesLine."Return Qty. to Receive";
        //                                                      SalesLine."Return Qty. Received (Base)" :=
        //                                                        SalesLine."Return Qty. Received (Base)" +
        //                                                        SalesLine."Return Qty. to Receive (Base)";
        //                                          #1422..1466
        //                                                        SalesLine."Qty. to Ship" := 0;
        //                                                        SalesLine."Qty. to Ship (Base)" := 0;
        //                                                      END;
        //                                                      SalesLine.InitQtyToInvoice;
        //                                                    END ELSE BEGIN
        //                                                      IF "Document Type" = "Document Type"::"Return Order" THEN
        //                                          #1473..1479
        //                                                    THEN
        //                                                      UpdateAssocLines(SalesLine);
        //                                                    SalesLine.SetDefaultQuantity;
        //                                                    SalesLine.MODIFY;
        //                                                  END;
        //                                                UNTIL SalesLine.NEXT = 0;
        //                                          #1486..1608
        //                                                TempWhseShptHeader.DELETE;
        //                                              END;
        //  
        //                                              ApprovalMgt.DeleteApprovalEntry(DATABASE::"Sales Header","Document Type","No.");
        //  
        //                                              IF HASLINKS THEN
        //                                          #1615..1639
        //                                              COMMIT;
        //                                            CLEAR(WhsePostRcpt);
        //                                            CLEAR(WhsePostShpt);
        //                                            CLEAR(GenJnlPostLine);
        //                                            CLEAR(ResJnlPostLine);
        //                                            CLEAR(JobPostLine);
        //                                          #1646..1675
        //                                            PostBalanceEntry(
        //                                              TransactionLogEntryNo,SalesHeader,TotalSalesLine,TotalSalesLineLCY,
        //                                              GenJnlLineDocType,GenJnlLineDocNo,GenJnlLineExtDocNo,SrcCode);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..13
        //  
        //                                            // iCepts BRB 07.15.09 - Check for Zero Prices Warning
        //                                            SalesHeader.Check0prices;
        //  
        //                                          #14..290
        //                                            // >> Receiving
        //                                            IF SalesSetup."Enable Receive" THEN
        //                                              Receiving.CheckSalesHeader(SalesHeader);
        //                                            // << Receiving - end
        //  
        //                                            // >> Shipping
        //                                            IF Ship AND SalesSetup."Enable Shipping" AND
        //                                               (SalesSetup."E-Ship Locking Optimization" =
        //                                                SalesSetup."E-Ship Locking Optimization"::Base)
        //                                            THEN
        //                                              Shipping.CheckSalesHeader(SalesHeader);
        //  
        //                                            IF ("Document Type" = "Document Type"::Order) AND Invoice AND SalesSetup."Enable Shipping" THEN
        //                                              Shipping.CheckShipmentInvoicing(SalesHeader,SalesShptHeader,SalesInvHeader,FALSE);
        //                                            // << Shipping
        //  
        //                                          #291..316
        //                                                // >> Shipping
        //                                                IF ("Document Type" IN ["Document Type"::Order,"Document Type"::Invoice]) AND
        //                                                   SalesSetup."Enable Shipping" AND
        //                                                   (SalesSetup."E-Ship Locking Optimization" =
        //                                                    SalesSetup."E-Ship Locking Optimization"::Base)
        //                                                THEN
        //                                                  Shipping.PostPackageSalesShipment(SalesHeader,SalesShptHeader);
        //                                                // << Shipping
        //  
        //                                          #317..374
        //  
        //                                                // >> Receiving
        //                                                IF SalesSetup."Enable Receive" THEN
        //                                                  Receiving.PostReceiveSalesReturnOrder(SalesHeader,ReturnRcptHeader);
        //                                                // << Receiving
        //  
        //                                          #375..378
        //  
        //                                              // >> Shipping
        //                                              IF ("Document Type" IN ["Document Type"::Order,"Document Type"::Invoice]) AND
        //                                                 Invoice AND SalesSetup."Enable Shipping" AND ("Invoice for Shipment No." <> '')
        //                                              THEN
        //                                                SalesShptHeader.LOCKTABLE;
        //                                              // << Shipping
        //  
        //                                          #379..469
        //  
        //                                                // >> Receiving
        //                                                IF ("Document Type" IN ["Document Type"::"Credit Memo"]) AND
        //                                                   NOT SalesSetup."Return Receipt on Credit Memo" AND
        //                                                   SalesSetup."Enable Receive"
        //                                                THEN
        //                                                  Receiving.PostReceiveSalesCrMemo(SalesHeader,SalesCrMemoHeader);
        //                                                // << Receiving
        //                                          #470..548
        //                                                //SalesLine.TESTFIELD(Description);    05.20.15dxd
        //                                          #550..559
        //                                                  // >> Shipping
        //                                                  // SalesLine.TESTFIELD(Amount);
        //                                                  IF NOT SalesLine."Shipping Charge" THEN
        //                                                    SalesLine.TESTFIELD(Amount);
        //                                                  // << Shipping
        //                                          #561..629
        //                                                  //Icepts 1.01
        //                                                  SalesLine."Quantity Shipped 2" := SalesLine."Quantity 2";
        //                                          #630..852
        //                                          #855..873
        //                                                              RemQtyToBeInvoiced,QtyToBeInvoiced,
        //                                                              RemQtyToBeInvoicedBase,QtyToBeInvoicedBase);
        //                                          #876..878
        //                                                          SalesShptLine."Quantity Invoiced" :=
        //                                                            SalesShptLine."Quantity Invoiced" - QtyToBeInvoiced;
        //                                                          SalesShptLine."Qty. Invoiced (Base)" :=
        //                                                            SalesShptLine."Qty. Invoiced (Base)" - QtyToBeInvoicedBase;
        //                                                          SalesShptLine."Qty. Shipped Not Invoiced" :=
        //                                                            SalesShptLine.Quantity - SalesShptLine."Quantity Invoiced";
        //                                                          SalesShptLine.MODIFY;
        //                                          #880..998
        //                                                      ClearItemChargeAssgntFilter;
        //                                                      TempItemChargeAssgntSales.SETCURRENTKEY("Applies-to Doc. Type");
        //                                                      TempItemChargeAssgntSales.SETRANGE("Document Line No.",SalesLine."Line No.");
        //                                                      IF TempItemChargeAssgntSales.FINDSET THEN
        //                                          #1001..1006
        //                                                                PostItemChargePerShpt(SalesLine);
        //                                          #1008..1011
        //                                                                PostItemChargePerRetRcpt(SalesLine);
        //                                          #1013..1043
        //                                                  // 08/14/2008 DRS Second Count
        //                                                  SalesShptLine."Quantity 2" := TempSalesLine."Qty. to Ship 2";
        //                                          #1044..1184
        //  
        //                                                    // iCepts BRB 01.05.12 - RFM7382 Populate EDI fields from EDI Trading Partner Item :START
        //                                                    IF TempSalesLine.Type = TempSalesLine.Type::Item THEN BEGIN
        //                                                      EDITradePartnerItem.RESET;
        //                                                      EDITradePartnerItem.SETRANGE("Trade Partner No.",SalesInvHeader."EDI Trade Partner");
        //                                                      EDITradePartnerItem.SETRANGE("Navision Item No.",TempSalesLine."No.");
        //                                                      IF EDITradePartnerItem.FINDFIRST THEN BEGIN
        //                                                        IF EDITradePartnerItem."EDI Invoice UOM" <> '' THEN BEGIN
        //                                                          SalesInvLine."EDI Invoice UOM" := EDITradePartnerItem."EDI Invoice UOM";
        //                                                          IF ItemUOM.GET(SalesInvLine."No.",SalesInvLine."EDI Invoice UOM") THEN BEGIN
        //                                                            SalesInvLine."EDI Invoice Price" := TempSalesLine."Unit Price" * ItemUOM."Qty. per Unit of Measure";
        //                                                            //SalesInvLine."EDI Invoice Qty." := TempSalesLine.Quantity * ItemUOM."Qty. per Unit of Measure";
        //                                                            //01.06.12 dxd
        //                                                            IF ItemUOM."Qty. per Unit of Measure" <> 0 THEN
        //                                                              SalesInvLine."EDI Invoice Qty." := TempSalesLine.Quantity / ItemUOM."Qty. per Unit of Measure";
        //                                                          END;
        //                                                        END ELSE BEGIN
        //                                                          SalesInvLine."EDI Invoice UOM" := SalesInvLine."Unit of Measure Code";
        //                                                          SalesInvLine."EDI Invoice Price" := TempSalesLine."Unit Price";
        //                                                          SalesInvLine."EDI Invoice Qty." := TempSalesLine.Quantity;
        //                                                        END;
        //                                                      END; //END EDI Trade Partner
        //                                                      //iCepts DXD 02.21.12 - RFM7406 Customer Case Price
        //                                                      CustSalesPriceCase.SETRANGE("Item No.",TempSalesLine."No.");
        //                                                      CustSalesPriceCase.SETRANGE("Sales Type",CustSalesPriceCase."Sales Type"::Customer);
        //                                                      CustSalesPriceCase.SETRANGE("Sales Code",SalesInvHeader."Sell-to Customer No.");
        //                                                      //CustSalesPriceCase.SETRANGE("Starting Date",TODAY);
        //                                                      CustSalesPriceCase.SETRANGE("Req InvoiceUM",TRUE);
        //                                                      IF CustSalesPriceCase.FINDFIRST THEN BEGIN
        //                                                         SalesInvLine."EDI Invoice UOM" := CustSalesPriceCase."Unit of Measure Code";
        //                                                         SalesInvLine."EDI Invoice Price" := CustSalesPriceCase."Unit Price";
        //                                                         SalesInvLine."EDI Invoice Qty." := TempSalesLine."Qty. to Ship 2";
        //                                                      END;
        //                                                      //iCepts DXD 02.21.12 - RFM7406 Customer Case Price
        //                                                    END;
        //  
        //                                                    // iCepts BRB 01.05.12 - RFM7382 Populate EDI fields from EDI Trading Partner Item :END
        //  
        //                                          #1185..1208
        //                                              // >> Shipping
        //                                              IF ("Document Type" IN ["Document Type"::Order,"Document Type"::Invoice]) AND
        //                                                 Invoice AND SalesSetup."Enable Shipping" THEN
        //                                                Shipping.CheckShipmentInvoicing(SalesHeader,SalesShptHeader,SalesInvHeader,TRUE);
        //                                              // << Shipping
        //  
        //                                          #1209..1383
        //                                            // >> Shipping
        //                                            IF Ship AND SalesSetup."Enable Shipping" AND
        //                                               (SalesSetup."E-Ship Locking Optimization" =
        //                                                SalesSetup."E-Ship Locking Optimization"::Packing)
        //                                            THEN BEGIN
        //                                              Shipping.CheckSalesHeader(SalesHeader);
        //  
        //                                              IF ("Document Type" = "Document Type"::Order) OR
        //                                                 (("Document Type" = "Document Type"::Invoice) AND SalesSetup."Shipment on Invoice")
        //                                              THEN
        //                                                Shipping.PostPackageSalesShipment(SalesHeader,SalesShptHeader);
        //                                            END;
        //                                            // << Shipping
        //  
        //                                          #1384..1397
        //                                            // >> Shipping
        //                                            IF SalesSetup."Enable Shipping" THEN
        //                                              Shipping.BlankBillOFLadingNoSalesHeader(SalesHeader,EverythingInvoiced);
        //                                            // << Shipping
        //  
        //                                          #1398..1400
        //  
        //                                              // iCepts BRB 10.04.11 - RFM7282 Change Ship Status to Shipped
        //                                              "Ship Status" := "Ship Status"::Shipped;
        //  
        //                                          #1401..1411
        //                                                      //Icepts1.01
        //                                                      SalesLine."Quantity Shipped 2" :=
        //                                                        SalesLine."Quantity Shipped 2" +
        //                                                        SalesLine."Qty. to Ship 2";
        //                                          #1412..1418
        //  
        //                                                      // iCepts WRW 08.15.16 - Added Quantity Shipped 2 for Receive
        //                                                      SalesLine."Quantity Shipped 2" :=
        //                                                        SalesLine."Quantity Shipped 2" + SalesLine."Qty. to Ship 2";
        //  
        //                                          #1419..1469
        //  
        //                                                      // iCepts BRB 02.18.10 - Keep Qty to Invoice :START
        //                                                      OrgQtyInv := SalesLine."Qty. to Invoice";
        //                                                      OrgQtyInvBase := SalesLine."Qty. to Invoice (Base)";
        //                                                      // iCepts BRB 02.18.10 - Keep Qty to Invoice :END
        //  
        //                                          #1470..1482
        //  
        //                                                    // iCepts BRB 02.18.10 - Keep Qty to Invoice :START
        //                                                    IF Ship THEN BEGIN
        //                                                      SalesLine."Qty. to Invoice" := OrgQtyInv;
        //                                                      SalesLine."Qty. to Invoice (Base)" := OrgQtyInvBase;
        //                                                    END;
        //                                                    // iCep ts BRB 02.18.10 - Keep Qty to Invoice :END
        //  
        //                                          #1483..1611
        //                                              // >> Shipping
        //                                              DeleteShippingAgentOptionPage;
        //  
        //                                              IF ("Document Type" IN ["Document Type"::Order,"Document Type"::Invoice]) AND
        //                                                 SalesSetup."Enable Shipping"
        //                                              THEN
        //                                                Shipping.BlankBillOFLadingNoSalesHeader(SalesHeader,EverythingInvoiced);
        //                                              // << Shipping
        //  
        //                                          #1612..1642
        //  
        //                                            // >> Shipping
        //                                            IF Ship AND SalesSetup."Enable Shipping" THEN
        //                                              IF "Document Type" IN ["Document Type"::Order,"Document Type"::Invoice] THEN
        //                                                Shipping.CreateBOLPostSalesShipment(SalesShptHeader);
        //  
        //                                            IF Ship AND SalesSetup."Enable E-Mail" THEN
        //                                              EMailMgt.SendSalesShipmentNotice(SalesShptHeader,FALSE,FALSE);
        //  
        //                                            IF Invoice AND SalesSetup."Enable E-Mail" THEN
        //                                              EMailMgt.SendSalesInvoiceNotice(SalesInvHeader,FALSE,FALSE);
        //                                            // << Shipping
        //  
        //                                          #1643..1678
        //                                        END;
        //  
        //                           Target=OnRun }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF NOT ItemJnlRollRndg THEN BEGIN
        //                                            RemAmt := 0;
        //                                            RemDiscAmt := 0;
        //                                          #4..45
        //                                            ItemJnlLine."Product Group Code" := "Product Group Code";
        //                                            ItemJnlLine."Return Reason Code" := "Return Reason Code";
        //  
        //                                            ItemJnlLine."Planned Delivery Date" := "Planned Delivery Date";
        //                                            ItemJnlLine."Order Date" := SalesHeader."Order Date";
        //  
        //                                          #52..84
        //                                                  ItemJnlLine."Document No." := GenJnlLineDocNo;
        //                                                END;
        //                                                ItemJnlLine."Posting No. Series" := SalesHeader."Posting No. Series";
        //                                              END;
        //                                            END;
        //  
        //                                          #91..160
        //                                                  TransferReservToItemJnlLine(
        //                                                    SalesLine,ItemJnlLine,-QtyToBeShippedBase,TempTrackingSpecification,CheckApplFromItemEntry);
        //  
        //                                                IF CheckApplFromItemEntry AND (NOT IsServiceItem) THEN
        //                                                  TESTFIELD("Appl.-from Item Entry");
        //                                              END;
        //  
        //                                          #168..220
        //                                          END;
        //  
        //                                          EXIT(ItemJnlLine."Item Shpt. Entry No.");
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..48
        //                                            ItemJnlLine."Unit of Measure Code 2" := "Unit of Measure 2";
        //                                            IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN
        //                                              ItemJnlLine."Quantity 2" := -"Qty. to Ship 2"
        //                                            //ItemJnlLine."Quantity 2" := -"Quantity 2" //bch
        //                                            ELSE
        //                                              ItemJnlLine."Quantity 2" := "Qty. to Ship 2";
        //  
        //                                          #49..87
        //  
        //                                                // iCepts BRB 08.06.13 - RFM7914 - Update Broker Code :START
        //                                                IF SalesHeader."Broker Code" <> '' THEN BEGIN
        //                                                  IF "Broker Commission" = TRUE THEN
        //                                                    ItemJnlLine."Broker Code" := SalesHeader."Broker Code";
        //                                                END;
        //                                                // iCepts BRB 08.06.13 - RFM7914 - Update Broker Code :END
        //  
        //                                                // iCepts DXD 04.16.15 (11.28.14 - RFM8314)
        //                                                ItemJnlLine."Ship-to Code" := SalesHeader."Ship-to Code"; //RFM8314 11.28.14
        //                                                ItemJnlLine."Ship-to Name" := SalesHeader."Ship-to Name"; //RFM8314 11.28.14
        //                                                // iCepts DXD 04.16.15 (11.28.14 - RFM8314)
        //  
        //                                          #88..163
        //                                                IF CheckApplFromItemEntry THEN
        //                                          #165..223
        //                                        END;
        //  
        //                           Target=PostItemJnlLine(PROCEDURE 2) }
        //      { Insertion         ;Target=UpdateBlanketOrderLine(PROCEDURE 21);
        //                           InsertAfter=Sign(Variable 1005);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             ChangeQty@1240020000 : Decimal;
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF SalesLine."Document Type" IN [SalesLine."Document Type"::"Return Order",SalesLine."Document Type"::"Credit Memo"] THEN
        //                                            EXIT;
        //                                          IF (SalesLine."Blanket Order No." <> '') AND (SalesLine."Blanket Order Line No." <> 0) AND
        //                                          #4..39
        //                                                      SalesLine."Qty. to Ship",0.00001);
        //                                                BlanketOrderSalesLine."Qty. Shipped (Base)" :=
        //                                                  BlanketOrderSalesLine."Qty. Shipped (Base)" + Sign * SalesLine."Qty. to Ship (Base)";
        //                                                ModifyLine := TRUE;
        //  
        //                                                AsmPost.UpdateBlanketATO(xBlanketOrderSalesLine,BlanketOrderSalesLine);
        //                                          #46..121
        //                                                BlanketOrderSalesLine.MODIFY;
        //                                              END;
        //                                            END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..42
        //  
        //                                                // >> EDI
        //                                                IF SalesHeader."EDI Order" THEN
        //                                                  IF BlanketOrderSalesLine.Quantity < BlanketOrderSalesLine."Quantity Shipped" THEN BEGIN
        //                                                    ChangeQty := BlanketOrderSalesLine."Quantity Shipped" - BlanketOrderSalesLine.Quantity;
        //                                                    ChangeQty := ChangeQty + BlanketOrderSalesLine.Quantity;
        //                                                    BlanketOrderSalesLine.VALIDATE(Quantity,ChangeQty);
        //                                                  END;
        //                                                // << EDI
        //  
        //                                          #43..124
        //                                        END;
        //  
        //                           Target=UpdateBlanketOrderLine(PROCEDURE 21) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          TempItemChargeAssgntSales.RESET;
        //                                          TempItemChargeAssgntSales.DELETEALL;
        //  
        //                                          #4..31
        //                                                   ABS(SalesLine2."Qty. Shipped Not Invoiced" + SalesLine2."Qty. to Ship") +
        //                                                   ABS(SalesLine2."Ret. Qty. Rcd. Not Invd.(Base)" + SalesLine2."Return Qty. to Receive")))
        //                                              THEN
        //                                                SalesLine2.TESTFIELD("Line Amount");
        //  
        //                                              IF NOT SalesHeader.Ship THEN
        //                                                SalesLine2."Qty. to Ship" := 0;
        //                                          #39..137
        //  
        //                                          IF InvoiceEverything AND AssignError THEN
        //                                            ERROR(Text033);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..34
        //                                                // >> Shipping
        //                                                // SalesLine2.TESTFIELD("Line Amount");
        //                                                IF NOT SalesLine2."Shipping Charge" THEN
        //                                                  SalesLine2.TESTFIELD("Line Amount");
        //                                                // << Shipping
        //                                          #36..140
        //                                        END;
        //  
        //                           Target=CopyAndCheckItemCharge(PROCEDURE 5806) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          GetGLSetup;
        //                                          WITH SalesLine DO BEGIN
        //                                            SETRANGE("Document Type",SalesHeader."Document Type");
        //                                          #4..129
        //                                              UNTIL NEXT = 0
        //                                          END;
        //                                          DividePrepmtAmountLCY(TempPrepmtSalesLine,SalesHeader);
        //  
        //                                          IF Is100PctPrepmtInvoice(TempPrepmtSalesLine) THEN
        //                                            TotalSalesLineLCY."Prepayment %" := 100;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..132
        //                                        END;
        //  
        //                           Target=CreatePrepaymentLines(PROCEDURE 51) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF PrepmtSalesLine."Prepayment Line" THEN BEGIN
        //                                            PrepmtVATPart :=
        //                                              (PrepmtSalesLine."Amount Including VAT" - PrepmtSalesLine.Amount) / PrepmtSalesLine."Unit Price";
        //                                          #4..14
        //                                                    GetSalesOrderLine(SalesLine,SalesInvoiceLine);
        //                                                    SalesLine."Qty. to Invoice" := SalesInvoiceLine."Qty. to Invoice";
        //                                                  END;
        //                                                  IF (NOT SalesHeader."Prepmt. Include Tax") AND (SalesLine."Qty. to Invoice" <> "Qty. to Invoice" ) THEN
        //                                                    SalesLine."Prepmt Amt to Deduct" := CalcPrepmtAmtToDeduct(SalesLine);
        //                                                  DeductionFactor :=
        //                                                    SalesLine."Prepmt Amt to Deduct" /
        //                                          #22..32
        //                                                      PricesInclVATRoundingAmount[2] := TotalRoundingAmount[2];
        //                                                    END;
        //  
        //                                                  IF "VAT Calculation Type" <> "VAT Calculation Type"::"Full VAT" THEN
        //                                                    IF SalesHeader."Prepmt. Include Tax" AND NOT IsFinalInvoice THEN
        //                                                      TotalPrepmtAmount[1] += "Prepmt Amt to Deduct"
        //                                                    ELSE
        //                                                      TotalPrepmtAmount[1] += "Prepmt. Amount Inv. (LCY)";
        //                                                  TotalPrepmtAmount[2] += "Prepmt. VAT Amount Inv. (LCY)";
        //                                                  FinalInvoice := FinalInvoice AND IsFinalInvoice;
        //                                                UNTIL NEXT = 0;
        //                                          #44..47
        //                                              PrepmtSalesLine,TotalRoundingAmount,TotalPrepmtAmount,
        //                                              FinalInvoice,PricesInclVATRoundingAmount);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..17
        //                                                  IF NOT SalesHeader."Prepmt. Include Tax" THEN
        //                                          #19..35
        //                                                  IF SalesHeader."Prepmt. Include Tax" AND NOT IsFinalInvoice THEN
        //                                                    TotalPrepmtAmount[1] += "Prepmt Amt to Deduct"
        //                                                  ELSE
        //                                                    TotalPrepmtAmount[1] += "Prepmt. Amount Inv. (LCY)";
        //                                          #41..50
        //                                        END;
        //  
        //                           Target=AdjustPrepmtAmountLCY(PROCEDURE 84) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH PrepmtSalesLineBuf DO BEGIN
        //                                            IF "VAT Calculation Type" <> "VAT Calculation Type"::"Full VAT" THEN BEGIN
        //                                              RoundingAmount[1] :=
        //                                                "Prepmt. Amount Inv. (LCY)" - ROUND(DeductionFactor * SalesLine."Prepmt. Amount Inv. (LCY)");
        //                                              "Prepmt. Amount Inv. (LCY)" := "Prepmt. Amount Inv. (LCY)" - RoundingAmount[1];
        //                                              TotalRoundingAmount[1] += RoundingAmount[1];
        //                                            END;
        //                                            RoundingAmount[2] :=
        //                                              "Prepmt. VAT Amount Inv. (LCY)" - ROUND(DeductionFactor * SalesLine."Prepmt. VAT Amount Inv. (LCY)");
        //                                            "Prepmt. VAT Amount Inv. (LCY)" := "Prepmt. VAT Amount Inv. (LCY)" - RoundingAmount[2];
        //                                            TotalRoundingAmount[2] += RoundingAmount[2];
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          WITH PrepmtSalesLineBuf DO BEGIN
        //                                            RoundingAmount[1] :=
        //                                              "Prepmt. Amount Inv. (LCY)" - ROUND(DeductionFactor * SalesLine."Prepmt. Amount Inv. (LCY)");
        //                                            "Prepmt. Amount Inv. (LCY)" := "Prepmt. Amount Inv. (LCY)" - RoundingAmount[1];
        //                                            TotalRoundingAmount[1] += RoundingAmount[1];
        //  
        //                                          #8..12
        //                                        END;
        //  
        //                           Target=CalcPrepmtRoundingAmounts(PROCEDURE 79) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH PrepmtSalesLine DO BEGIN
        //                                            IF ABS(TotalRoundingAmount[1]) <= GLSetup."Amount Rounding Precision" THEN BEGIN
        //                                              IF "Prepayment %" = 100 THEN
        //                                          #4..7
        //                                            Amount := TotalPrepmtAmount[1] + TotalRoundingAmount[1];
        //  
        //                                            IF (PricesInclVATRoundingAmount[1] <> 0) AND (TotalRoundingAmount[1] = 0) THEN BEGIN
        //                                              IF ("Prepayment %" = 100) AND FinalInvoice AND
        //                                                 (Amount + TotalPrepmtAmount[2] = "Amount Including VAT")
        //                                              THEN
        //                                                Prepmt100PctVATRoundingAmt := 0;
        //                                              PricesInclVATRoundingAmount[1] := 0;
        //                                            END;
        //  
        //                                            IF ((ABS(TotalRoundingAmount[2]) <= GLSetup."Amount Rounding Precision") OR
        //                                                FinalInvoice) AND (TotalRoundingAmount[1] = 0)
        //                                            THEN BEGIN
        //                                              IF ("Prepayment %" = 100) AND ("Prepmt. Amount Inv. (LCY)" = 0) THEN
        //                                                Prepmt100PctVATRoundingAmt += TotalRoundingAmount[2];
        //                                          #23..29
        //  
        //                                            "Prepmt. VAT Amount Inv. (LCY)" := TotalRoundingAmount[2] + Prepmt100PctVATRoundingAmt;
        //                                            NewAmountIncludingVAT := Amount + TotalPrepmtAmount[2] + TotalRoundingAmount[2];
        //                                            IF (PricesInclVATRoundingAmount[1] = 0) AND (PricesInclVATRoundingAmount[2] = 0) OR
        //                                               ("Currency Code" <> '') AND FinalInvoice
        //                                            THEN
        //                                              Increment(
        //                                                TotalSalesLineLCY."Amount Including VAT",
        //                                                "Amount Including VAT" - NewAmountIncludingVAT - Prepmt100PctVATRoundingAmt);
        //                                            IF "Currency Code" = '' THEN
        //                                              TotalSalesLine."Amount Including VAT" := TotalSalesLineLCY."Amount Including VAT";
        //                                            "Amount Including VAT" := NewAmountIncludingVAT;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..10
        //                                              Prepmt100PctVATRoundingAmt := 0;
        //                                          #15..17
        //                                            IF (ABS(TotalRoundingAmount[2]) <= GLSetup."Amount Rounding Precision") OR
        //                                               (FinalInvoice AND (TotalRoundingAmount[1] = 0))
        //                                          #20..32
        //                                            IF (PricesInclVATRoundingAmount[1] = 0) AND (PricesInclVATRoundingAmount[2] = 0) THEN
        //                                          #36..42
        //                                        END;
        //  
        //                           Target=UpdatePrepmtSalesLineWithRounding(PROCEDURE 89) }
        //      { Deletion          ;Target=Is100PctPrepmtInvoice(PROCEDURE 1020003);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE Is100PctPrepmtInvoice@1020003(VAR TempSalesLine@1020000 : TEMPORARY Record "Sales Line") Result : Boolean;
        //                             BEGIN
        //                               IF TempSalesLine.ISEMPTY THEN
        //                                 EXIT(FALSE);
        //                               TempSalesLine.SETFILTER("Prepayment %",'<100');
        //                               Result := TempSalesLine.ISEMPTY;
        //                               TempSalesLine.SETRANGE("Prepayment %");
        //                             END;
        //  
        //                           }
        //                            }
        //      { Deletion          ;Target=UpdateRemainingQtyToBeInvoiced(PROCEDURE 125);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE UpdateRemainingQtyToBeInvoiced@125(SalesShptLine@1000 : Record "Sales Shipment Line";VAR RemQtyToInvoiceCurrLine@1001 : Decimal;VAR RemQtyToInvoiceCurrLineBase@1002 : Decimal);
        //                             BEGIN
        //                               RemQtyToInvoiceCurrLine := -SalesShptLine.Quantity + SalesShptLine."Quantity Invoiced";
        //                               RemQtyToInvoiceCurrLineBase := -SalesShptLine."Quantity (Base)" + SalesShptLine."Qty. Invoiced (Base)";
        //                               IF RemQtyToInvoiceCurrLine < RemQtyToBeInvoiced THEN BEGIN
        //                                 RemQtyToInvoiceCurrLine := RemQtyToBeInvoiced;
        //                                 RemQtyToInvoiceCurrLineBase := RemQtyToBeInvoicedBase;
        //                               END;
        //                             END;
        //  
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          TaxLineCount := 0;
        //                                          RemSalesTaxAmt := 0;
        //                                          RemSalesTaxSrcAmt := 0;
        //                                          IF SalesHeader."Currency Code" <> '' THEN
        //                                            TotalSalesLineLCY."Amount Including VAT" := TotalSalesLineLCY.Amount;
        //                                          IF TempSalesTaxAmtLine.FIND('-') THEN BEGIN
        //                                            REPEAT
        //                                              TaxLineCount := TaxLineCount + 1;
        //                                              IF GUIALLOWED THEN
        //                                                Window.UPDATE(3,STRSUBSTNO('%1 / %2',LineCount,TaxLineCount));
        //                                              IF ((TempSalesTaxAmtLine."Tax Base Amount" <> 0) AND
        //                                                  (TempSalesTaxAmtLine."Tax Type" = TempSalesTaxAmtLine."Tax Type"::"Sales and Use Tax")) OR
        //                                                 ((TempSalesTaxAmtLine.Quantity <> 0) AND
        //                                                  (TempSalesTaxAmtLine."Tax Type" = TempSalesTaxAmtLine."Tax Type"::"Excise Tax"))
        //                                              THEN BEGIN
        //                                                GenJnlLine.INIT;
        //                                                GenJnlLine."Posting Date" := SalesHeader."Posting Date";
        //                                                GenJnlLine."Document Date" := SalesHeader."Document Date";
        //                                                GenJnlLine.Description := SalesHeader."Posting Description";
        //                                                GenJnlLine."Reason Code" := SalesHeader."Reason Code";
        //                                                GenJnlLine."Document Type" := GenJnlLineDocType;
        //                                                GenJnlLine."Document No." := GenJnlLineDocNo;
        //                                                GenJnlLine."External Document No." := GenJnlLineExtDocNo;
        //                                                GenJnlLine."System-Created Entry" := TRUE;
        //                                                GenJnlLine.Amount := 0;
        //                                                GenJnlLine."Source Currency Code" := SalesHeader."Currency Code";
        //                                                GenJnlLine."Source Currency Amount" := 0;
        //                                                GenJnlLine.Correction := SalesHeader.Correction;
        //                                                GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::Sale;
        //                                                GenJnlLine."Tax Area Code" := TempSalesTaxAmtLine."Tax Area Code";
        //                                                GenJnlLine."Tax Type" := TempSalesTaxAmtLine."Tax Type";
        //                                                GenJnlLine."Tax Exemption No." := SalesHeader."Tax Exemption No.";
        //                                                GenJnlLine."Tax Group Code" := TempSalesTaxAmtLine."Tax Group Code";
        //                                                GenJnlLine."Tax Liable" := TempSalesTaxAmtLine."Tax Liable";
        //                                                GenJnlLine.Quantity := TempSalesTaxAmtLine.Quantity;
        //                                                GenJnlLine."VAT Calculation Type" := GenJnlLine."VAT Calculation Type"::"Sales Tax";
        //                                                GenJnlLine."VAT Posting" := GenJnlLine."VAT Posting"::"Manual VAT Entry";
        //                                                GenJnlLine."Shortcut Dimension 1 Code" := SalesHeader."Shortcut Dimension 1 Code";
        //                                                GenJnlLine."Shortcut Dimension 2 Code" := SalesHeader."Shortcut Dimension 2 Code";
        //                                                GenJnlLine."Dimension Set ID" := SalesHeader."Dimension Set ID";
        //                                                GenJnlLine."Source Code" := SrcCode;
        //                                                GenJnlLine."EU 3-Party Trade" := SalesHeader."EU 3-Party Trade";
        //                                                GenJnlLine."Bill-to/Pay-to No." := SalesHeader."Sell-to Customer No.";
        //                                                GenJnlLine."Source Type" := GenJnlLine."Source Type"::Customer;
        //                                                GenJnlLine."Source No." := SalesHeader."Bill-to Customer No.";
        //                                                GenJnlLine."Posting No. Series" := SalesHeader."Posting No. Series";
        //                                                GenJnlLine."STE Transaction ID" := SalesHeader."STE Transaction ID";
        //                                                GenJnlLine."Source Curr. VAT Base Amount" :=
        //                                                  CurrExchRate.ExchangeAmtLCYToFCY(
        //                                                    UseDate,SalesHeader."Currency Code",TempSalesTaxAmtLine."Tax Base Amount",SalesHeader."Currency Factor");
        //                                                GenJnlLine."VAT Base Amount (LCY)" :=
        //                                                  ROUND(TempSalesTaxAmtLine."Tax Base Amount");
        //                                                GenJnlLine."VAT Base Amount" := GenJnlLine."VAT Base Amount (LCY)";
        //  
        //                                                IF TaxJurisdiction.Code <> TempSalesTaxAmtLine."Tax Jurisdiction Code" THEN BEGIN
        //                                                  TaxJurisdiction.GET(TempSalesTaxAmtLine."Tax Jurisdiction Code");
        //                                                  IF SalesTaxCountry = SalesTaxCountry::CA THEN BEGIN
        //                                                    RemSalesTaxAmt := 0;
        //                                                    RemSalesTaxSrcAmt := 0;
        //                                                  END;
        //                                                END;
        //                                                IF TaxJurisdiction."Unrealized VAT Type" > 0 THEN BEGIN
        //                                                  TaxJurisdiction.TESTFIELD("Unreal. Tax Acc. (Sales)");
        //                                                  GenJnlLine."Account No." := TaxJurisdiction."Unreal. Tax Acc. (Sales)";
        //                                                END ELSE BEGIN
        //                                                  TaxJurisdiction.TESTFIELD("Tax Account (Sales)");
        //                                                  GenJnlLine."Account No." := TaxJurisdiction."Tax Account (Sales)";
        //                                                END;
        //                                                GenJnlLine."Tax Jurisdiction Code" := TempSalesTaxAmtLine."Tax Jurisdiction Code";
        //                                                IF TempSalesTaxAmtLine."Tax Amount" <> 0 THEN BEGIN
        //                                                  RemSalesTaxSrcAmt := RemSalesTaxSrcAmt +
        //                                                    TempSalesTaxAmtLine."Tax Base Amount FCY" * TempSalesTaxAmtLine."Tax %" / 100;
        //                                                  GenJnlLine."Source Curr. VAT Amount" := ROUND(RemSalesTaxSrcAmt,Currency."Amount Rounding Precision");
        //                                                  RemSalesTaxSrcAmt := RemSalesTaxSrcAmt - GenJnlLine."Source Curr. VAT Amount";
        //                                                  RemSalesTaxAmt := RemSalesTaxAmt + TempSalesTaxAmtLine."Tax Amount";
        //                                                  GenJnlLine."VAT Amount (LCY)" := ROUND(RemSalesTaxAmt,GLSetup."Amount Rounding Precision");
        //                                                  RemSalesTaxAmt := RemSalesTaxAmt - GenJnlLine."VAT Amount (LCY)";
        //                                                  GenJnlLine."VAT Amount" := GenJnlLine."VAT Amount (LCY)";
        //                                                END;
        //                                                GenJnlLine."VAT Difference" := TempSalesTaxAmtLine."Tax Difference";
        //  
        //                                                IF NOT
        //                                                   (SalesHeader."Document Type" IN
        //                                                    [SalesHeader."Document Type"::"Return Order",SalesHeader."Document Type"::"Credit Memo"])
        //                                                THEN BEGIN
        //                                                  GenJnlLine."Source Curr. VAT Base Amount" := -GenJnlLine."Source Curr. VAT Base Amount";
        //                                                  GenJnlLine."VAT Base Amount (LCY)" := -GenJnlLine."VAT Base Amount (LCY)";
        //                                                  GenJnlLine."VAT Base Amount" := -GenJnlLine."VAT Base Amount";
        //                                                  GenJnlLine."Source Curr. VAT Amount" := -GenJnlLine."Source Curr. VAT Amount";
        //                                                  GenJnlLine."VAT Amount (LCY)" := -GenJnlLine."VAT Amount (LCY)";
        //                                                  GenJnlLine."VAT Amount" := -GenJnlLine."VAT Amount";
        //                                                  GenJnlLine.Quantity := -GenJnlLine.Quantity;
        //                                                  GenJnlLine."VAT Difference" := -GenJnlLine."VAT Difference";
        //                                                END;
        //                                                IF SalesHeader."Currency Code" <> '' THEN
        //                                                  TotalSalesLineLCY."Amount Including VAT" :=
        //                                                    TotalSalesLineLCY."Amount Including VAT" + GenJnlLine."VAT Amount (LCY)";
        //  
        //                                                GenJnlPostLine.RunWithCheck(GenJnlLine);
        //                                              END;
        //                                            UNTIL TempSalesTaxAmtLine.NEXT = 0;
        //  
        //                                            // Sales Tax rounding adjustment for Invoice with 100% Prepayment
        //                                            IF SalesHeader.Invoice AND SalesHeader."Prepmt. Include Tax" AND (TotalSalesLineLCY."Prepayment %" = 100) AND
        //                                               ((TotalSalesLine."Amount Including VAT" <> 0) OR (TotalSalesLineLCY."Amount Including VAT" <> 0))
        //                                            THEN BEGIN
        //                                              GenJnlLine.INIT;
        //                                              GenJnlLine."Posting Date" := SalesHeader."Posting Date";
        //                                              GenJnlLine."Document Date" := SalesHeader."Document Date";
        //                                              GenJnlLine.Description := SalesHeader."Posting Description";
        //                                              GenJnlLine."Reason Code" := SalesHeader."Reason Code";
        //                                              GenJnlLine."Document Type" := GenJnlLineDocType;
        //                                              GenJnlLine."Document No." := GenJnlLineDocNo;
        //                                              GenJnlLine."External Document No." := GenJnlLineExtDocNo;
        //                                              GenJnlLine."System-Created Entry" := TRUE;
        //                                              CustPostingGr.GET(SalesHeader."Customer Posting Group");
        //                                              CustPostingGr.TESTFIELD("Invoice Rounding Account");
        //                                              GenJnlLine."Account No." := CustPostingGr."Invoice Rounding Account";
        //                                              GenJnlLine."Currency Code" := SalesHeader."Currency Code";
        //                                              GenJnlLine.Amount := -TotalSalesLine."Amount Including VAT";
        //                                              GenJnlLine."Source Currency Code" := SalesHeader."Currency Code";
        //                                              GenJnlLine."Source Currency Amount" := -TotalSalesLine."Amount Including VAT";
        //                                              GenJnlLine."Amount (LCY)" := -TotalSalesLineLCY."Amount Including VAT";
        //                                              IF SalesHeader."Currency Code" = '' THEN
        //                                                GenJnlLine."Currency Factor" := 1
        //                                              ELSE
        //                                                GenJnlLine."Currency Factor" := SalesHeader."Currency Factor";
        //                                              GenJnlLine.Correction := SalesHeader.Correction;
        //                                              GenJnlLine."Shortcut Dimension 1 Code" := SalesHeader."Shortcut Dimension 1 Code";
        //                                              GenJnlLine."Shortcut Dimension 2 Code" := SalesHeader."Shortcut Dimension 2 Code";
        //                                              GenJnlLine."Dimension Set ID" := SalesHeader."Dimension Set ID";
        //                                              GenJnlPostLine.RunWithCheck(GenJnlLine);
        //  
        //                                              TotalSalesLine."Amount Including VAT" := 0;
        //                                              TotalSalesLineLCY."Amount Including VAT" := 0;
        //                                            END;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..5
        //                                          IF TempSalesTaxAmtLine.FIND('-') THEN
        //                                            REPEAT
        //                                              TaxLineCount := TaxLineCount + 1;
        //                                              Window.UPDATE(3,STRSUBSTNO('%1 / %2',LineCount,TaxLineCount));
        //                                          #11..98
        //  
        //                                          #99..101
        //                                        END;
        //  
        //                           Target=PostSalesTaxToGL(PROCEDURE 1020004) }
        //      { Deletion          ;Target=FindTempItemChargeAssgntSales(PROCEDURE 20);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE FindTempItemChargeAssgntSales@20(SalesLineNo@1000 : Integer) : Boolean;
        //                             BEGIN
        //                               ClearItemChargeAssgntFilter;
        //                               TempItemChargeAssgntSales.SETCURRENTKEY("Applies-to Doc. Type");
        //                               TempItemChargeAssgntSales.SETRANGE("Document Line No.",SalesLineNo);
        //                               EXIT(TempItemChargeAssgntSales.FINDSET);
        //                             END;
        //  
        //                           }
        //                            }
        //      { Deletion          ;Target=UpdateInvoicedQtyOnShipmentLine(PROCEDURE 120);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE UpdateInvoicedQtyOnShipmentLine@120(VAR SalesShptLine@1000 : Record "Sales Shipment Line";QtyToBeInvoiced@1001 : Decimal;QtyToBeInvoicedBase@1002 : Decimal);
        //                             BEGIN
        //                               WITH SalesShptLine DO BEGIN
        //                                 "Quantity Invoiced" := "Quantity Invoiced" - QtyToBeInvoiced;
        //                                 "Qty. Invoiced (Base)" := "Qty. Invoiced (Base)" - QtyToBeInvoicedBase;
        //                                 "Qty. Shipped Not Invoiced" := Quantity - "Quantity Invoiced";
        //                                 MODIFY;
        //                               END;
        //                             END;
        //  
        //                           }
        //                            }
        //      { Insertion         ;InsertAfter=TempSKU(Variable 1175);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             Shipping@1240020002 : Codeunit UnknownCodeunit14000701;
        //                             EMailMgt@1240020001 : Codeunit UnknownCodeunit14000903;
        //                             Receiving@1240020000 : Codeunit UnknownCodeunit14000601;
        //                           }
        //                            }
        //      { Insertion         ;InsertAfter=Text062Qst(Variable 1132);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             OrgQtyInv@1000000002 : Decimal;
        //                             OrgQtyInvBase@1000000001 : Decimal;
        //                             CustSalesPriceCase@1000000000 : Record "Sales Price";
        //                           }
        //                            }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW18.00.00.40938,NAVNA8.00.00.40938;
        //                           ModifiedValue=NAVW18.00.00.38798,NAVNA8.00.00.38798,SE0.60,iCepts1.11 }
        //    }
        //    CODE
        //    {
        //  
        //      BEGIN
        //      END.
        //    }
        //  }
        //  
        //  

    end;
}

