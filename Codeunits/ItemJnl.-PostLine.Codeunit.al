Codeunit 70000022 "Item Jnl.-Post Line22"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Item Jnl.-Post Line"(Codeunit 22)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=02032015D;
        //      Time=163157T;
        //      Modified=Yes;
        //      Version List=NAVW18.00.00.38798,NAVNA8.00.00.38798,iCepts1.03;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Item Jnl.-Post Line"(Codeunit 22);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ProdOrderComp DO BEGIN
        //                                            ItemJnlLine.TESTFIELD("Order Type",ItemJnlLine."Order Type"::Production);
        //                                            SETCURRENTKEY(Status,"Prod. Order No.","Prod. Order Line No.","Item No.","Line No.");
        //                                          #4..21
        //                                                LastLoop := FALSE;
        //                                              END ELSE
        //                                                IF ReservationExists(ItemJnlLine) THEN BEGIN
        //                                                  IF SNRequired AND (ItemJnlLine."Serial No." = '') THEN
        //                                                    ERROR(SerialNoRequiredErr,ItemJnlLine."Item No.");
        //                                                  IF LotRequired AND (ItemJnlLine."Lot No." = '') THEN
        //                                                    ERROR(LotNoRequiredErr,ItemJnlLine."Item No.");
        //                                                END;
        //  
        //                                          #31..101
        //                                              InsertConsumpEntry(ProdOrderComp,ItemJnlLine."Prod. Order Comp. Line No.",RemQtyToPost,FALSE);
        //                                          END;
        //                                          ProdOrderCompModified := FALSE;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..24
        //                                                  IF SNRequired THEN
        //                                                    ERROR(SerialNoRequiredErr,ItemJnlLine."Item No.");
        //                                                  IF LotRequired THEN
        //                                          #28..104
        //                                        END;
        //  
        //                           Target=PostConsumption(PROCEDURE 29) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemJnlLine DO BEGIN
        //                                            SKUExists := SKU.GET("Location Code","Item No.","Variant Code");
        //                                            IF "Item Shpt. Entry No." <> 0 THEN BEGIN
        //                                          #4..43
        //                                               ("Item Charge No." = '') AND
        //                                               NOT ("Value Entry Type" IN ["Value Entry Type"::Revaluation,"Value Entry Type"::Rounding]) AND
        //                                               NOT Adjustment
        //                                            THEN
        //                                              ItemQtyPosting
        //                                            ELSE BEGIN
        //                                              IF ("Invoiced Quantity" <> 0) OR Adjustment OR
        //                                                 IsInterimRevaluation
        //                                              THEN BEGIN
        //                                          #53..62
        //  
        //                                            UpdateUnitCost(GlobalValueEntry);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..46
        //                                            THEN BEGIN
        //                                              ItemQtyPosting;
        //                                              IF AnyTouchedEntries THEN
        //                                                VerifyTouchedOnInventory;
        //                                            END ELSE BEGIN
        //                                          #50..65
        //                                        END;
        //  
        //                           Target=PostItem(PROCEDURE 28) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemJnlLine DO BEGIN
        //                                            IF (InvdQty = 0) AND (AdjdCost = 0) THEN
        //                                              EXIT;
        //                                          #4..59
        //                                            ValueEntry."Reason Code" := "Reason Code";
        //                                            ValueEntry."Journal Batch Name" := "Journal Batch Name";
        //  
        //                                            ValueEntry."Global Dimension 1 Code" := "Shortcut Dimension 1 Code";
        //                                            ValueEntry."Global Dimension 2 Code" := "Shortcut Dimension 2 Code";
        //                                            ValueEntry."Dimension Set ID" := "Dimension Set ID";
        //                                          #66..89
        //                                              CapLedgEntry.MODIFY;
        //                                            END;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..62
        //                                            // iCepts BRB 06.18.09 - Update new fields
        //                                            ValueEntry."Item Category Code" := "Item Category Code";
        //                                            ValueEntry."Product Group Code" := "Product Group Code";
        //                                            ValueEntry."Product Group Total Code" := COPYSTR("Product Group Code",1,2); // iCepts BRB 07.16.09
        //  
        //                                          #63..92
        //                                        END;
        //  
        //                           Target=InsertCapValueEntry(PROCEDURE 24) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ValueEntry DO BEGIN
        //                                            IF ("Valued Quantity" > 0) AND NOT ("Expected Cost" OR ItemJnlLine.Adjustment) THEN BEGIN
        //                                              Item.LOCKTABLE;
        //                                          #4..22
        //                                                IF LastDirectCost <> 0 THEN BEGIN
        //                                                  Item."Last Direct Cost" := LastDirectCost;
        //                                                  Item.MODIFY;
        //                                                  ItemCostMgt.SetProperties(FALSE,"Invoiced Quantity");
        //                                                  ItemCostMgt.FindUpdateUnitCostSKU(Item,"Location Code","Variant Code",TRUE);
        //                                                END;
        //                                              END ELSE BEGIN
        //                                                ItemCostMgt.SetProperties(FALSE,"Invoiced Quantity");
        //                                                ItemCostMgt.UpdateUnitCost(Item,"Location Code","Variant Code",LastDirectCost,0,TRUE,TRUE,FALSE,0);
        //                                              END;
        //                                            END;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..25
        //                                          #28..34
        //                                        END;
        //  
        //                           Target=UpdateUnitCost(PROCEDURE 9) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF (ItemLedgEntry."Remaining Quantity" = 0) OR
        //                                             (ItemLedgEntry."Drop Shipment" AND (ItemLedgEntry."Applies-to Entry" = 0)) OR
        //                                             ((Item."Costing Method" = Item."Costing Method"::Specific) AND ItemLedgEntry.Positive)
        //                                          #4..41
        //                                                  ReservEntry."Reservation Status"::Prospect);
        //                                                IF ReservEntry.FINDSET THEN
        //                                                  REPEAT
        //                                                    ReservEngineMgt.CloseSurplusTrackingEntry(ReservEntry);
        //                                                  UNTIL ReservEntry.NEXT = 0;
        //                                                StartApplication := TRUE;
        //                                              END;
        //                                          #49..241
        //                                                    THEN
        //                                                      OldItemLedgEntry.FIELDERROR("Expiration Date",Text017);
        //  
        //                                                InsertApplEntry(
        //                                                  ItemLedgEntry."Entry No.",OldItemLedgEntry."Entry No.",ItemLedgEntry."Entry No.",0,
        //                                                  ItemLedgEntry."Posting Date",AppliedQty,TRUE);
        //                                          #248..275
        //                                                EXIT;
        //                                            END;
        //                                          UNTIL FALSE;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..44
        //                                                    ReservEngineMgt.CloseReservEntry(ReservEntry,FALSE,FALSE);
        //                                          #46..244
        //                                                ItemLedgEntry."Expiration Date" := 0D; // No Expiration date on negative entries
        //  
        //                                          #245..278
        //                                        END;
        //  
        //                           Target=ApplyItemLedgEntry(PROCEDURE 1) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemJnlLine DO BEGIN
        //                                            InitItemLedgEntry(NewItemLedgEntry);
        //                                            NewItemLedgEntry."Applies-to Entry" := 0;
        //                                          #4..17
        //  
        //                                            NewItemLedgEntry."Expiration Date" := "New Item Expiration Date";
        //  
        //                                            IF Item."Item Tracking Code" <> '' THEN BEGIN
        //                                              TempItemEntryRelation."Item Entry No." := NewItemLedgEntry."Entry No."; // Save Entry No. in a global variable
        //                                              TempItemEntryRelation."Serial No." := NewItemLedgEntry."Serial No.";
        //                                          #24..49
        //  
        //                                            UpdateUnitCost(NewValueEntry);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..20
        //                                            //RFM6066
        //                                             NewItemLedgEntry."Quantity 2" := - NewItemLedgEntry."Quantity 2";
        //                                           {IF ItemLedgEntry."Remaining Quantity" - AppliedQty = 0 THEN
        //                                                 NewItemLedgEntry."Quantity 2" := ItemJnlLine."Quantity 2" - TotalAppliedQty2
        //                                            ELSE
        //                                             BEGIN
        //                                               NewItemLedgEntry."Quantity 2" := ROUND(ItemJnlLine."Quantity 2" / ItemJnlLine.Quantity
        //                                                                                * NewItemLedgEntry.Quantity,1,'<');
        //                                               TotalAppliedQty2 := TotalAppliedQty2 + NewItemLedgEntry."Quantity 2";
        //                                             END;
        //                                          }
        //  
        //                                          #21..52
        //                                        END;
        //  
        //                           Target=InsertTransferEntry(PROCEDURE 6) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemJnlLine DO BEGIN
        //                                            IF ItemLedgEntry.Open THEN BEGIN
        //                                              ItemLedgEntry.VerifyOnInventory;
        //                                          #4..60
        //  
        //                                            ItemLedgEntry.UpdateItemTracking;
        //  
        //                                            ItemLedgEntry.INSERT;
        //  
        //                                            InsertItemReg(ItemLedgEntry."Entry No.",0,0,0);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..63
        //                                          //RFM6066
        //                                            IF ABS(ItemLedgEntry.Quantity) <> ABS(ItemJnlLineOrigin.Quantity)  THEN
        //                                            BEGIN
        //                                              IF ItemLedgEntry."Entry Type" = ItemLedgEntry."Entry Type"::Output THEN
        //                                                  ItemLedgEntry."Quantity 2" := ROUND(ABS(ItemJnlLineOrigin."Output Quantity 2" / ItemJnlLineOrigin.Quantity)
        //                                                                                * ItemLedgEntry.Quantity,1)
        //  
        //                                              ELSE
        //                                                  ItemLedgEntry."Quantity 2" := ROUND(ABS(ItemJnlLineOrigin."Quantity 2" / ItemJnlLineOrigin.Quantity)
        //                                                                                * ItemLedgEntry.Quantity,1);
        //                                            END;
        //  
        //                                          #64..67
        //                                        END;
        //  
        //                           Target=InsertItemLedgEntry(PROCEDURE 5) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          ValueEntryNo := ValueEntryNo + 1;
        //  
        //                                          WITH ItemJnlLine DO BEGIN
        //                                          #4..65
        //                                            ValueEntry."Location Code" := ItemLedgEntry."Location Code";
        //                                            ValueEntry."Variant Code" := ItemLedgEntry."Variant Code";
        //                                            ValueEntry."Journal Batch Name" := "Journal Batch Name";
        //                                            ValueEntry."User ID" := USERID;
        //                                            ValueEntry."Drop Shipment" := "Drop Shipment";
        //                                            ValueEntry."Reason Code" := "Reason Code";
        //                                          #72..258
        //  
        //                                            RoundAmtValueEntry(ValueEntry);
        //                                            XferCustomFields.ItemJnlLineTOValueEntry(ItemJnlLine,ValueEntry);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..68
        //  
        //                                            // iCepts BRB 06.18.09 - Update new fields
        //                                            ValueEntry."Item Category Code" := "Item Category Code";
        //                                            ValueEntry."Product Group Code" := "Product Group Code";
        //                                            ValueEntry."Product Group Total Code" := COPYSTR("Product Group Code",1,2); // iCepts BRB 07.16.09
        //  
        //                                          #69..261
        //  
        //                                            // iCepts BRB 07.26.13 - RFM7914 Get Broker Code :START
        //                                            ValueEntry."Broker Code" := "Broker Code";
        //                                            // iCepts BRB 07.26.13 - RFM7914 Get Broker Code :END
        //  
        //                                          END;
        //                                        END;
        //  
        //                           Target=InitValueEntry(PROCEDURE 5800) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemJnlLine DO BEGIN
        //                                            IF TransferItem THEN BEGIN
        //                                              ValueEntry."Global Dimension 1 Code" := "New Shortcut Dimension 1 Code";
        //                                          #4..82
        //                                                ItemLedgEntry.Quantity = ItemLedgEntry."Invoiced Quantity");
        //                                            END;
        //  
        //                                            IF ValueEntry.Inventoriable THEN
        //                                              PostInventoryToGL(ValueEntry);
        //  
        //                                            ValueEntry.INSERT;
        //  
        //                                            ItemApplnEntry.SetOutboundsNotUpdated(ItemLedgEntry);
        //  
        //                                            UpdateAdjmtProp(ValueEntry,ItemLedgEntry."Posting Date");
        //                                          #94..99
        //                                              TempValueEntryRelation.INSERT;
        //                                            END;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..85
        //                                            // iCepts BRB 06.18.09 - Update new fields
        //                                            ValueEntry."Item Category Code" := "Item Category Code";
        //                                            ValueEntry."Product Group Code" := "Product Group Code";
        //                                            ValueEntry."Product Group Total Code" := COPYSTR("Product Group Code",1,2); // iCepts BRB 07.16.09
        //  
        //                                          #86..90
        //                                            // iCepts BRB 07.26.13 - RFM7914 Get Broker Code :START
        //                                            IF ValueEntry."Document Type" = ValueEntry."Document Type"::"Sales Invoice" THEN BEGIN
        //                                              IF SlsInvLne.GET(ValueEntry."Document No.",ValueEntry."Document Line No.") THEN
        //                                                ValueEntry."Broker Code" := SlsInvLne.GetBrokerCode;
        //                                            END;
        //                                            // iCepts BRB 07.26.13 - RFM7914 Get Broker Code :END
        //  
        //                                          #91..102
        //                                        END;
        //  
        //                           Target=InsertValueEntry(PROCEDURE 5801) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemLedgEntry DO BEGIN
        //                                            IF NOT (ValueEntry."Entry Type" IN
        //                                                    [ValueEntry."Entry Type"::Variance,
        //                                                     ValueEntry."Entry Type"::"Indirect Cost",
        //                                                     ValueEntry."Entry Type"::Rounding])
        //                                            THEN BEGIN
        //                                              IF ValueEntry.Inventoriable AND (NOT ItemJnlLine.Adjustment OR ("Entry Type" = "Entry Type"::"Assembly Output")) THEN
        //                                                UpdateAvgCostAdjmtEntryPoint(ItemLedgEntry,ValueEntry."Valuation Date");
        //  
        //                                              IF Positive AND (Quantity <> "Remaining Quantity") AND NOT "Applied Entry to Adjust" AND
        //                                          #11..52
        //                                          END;
        //  
        //                                          EXIT(ModifyEntry);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..6
        //                                              IF ValueEntry.Inventoriable AND NOT ItemJnlLine.Adjustment THEN
        //                                          #8..55
        //                                        END;
        //  
        //                           Target=UpdateItemLedgEntry(PROCEDURE 5805) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF ItemLedgEntryNo = 0 THEN
        //                                            ItemLedgEntryNo := GlobalItemLedgEntry."Entry No.";
        //  
        //                                          ItemLedgEntryNo := ItemLedgEntryNo + 1;
        //                                          NewItemLedgEntry := OldItemLedgEntry;
        //                                          ItemTrackingMgt.RetrieveAppliedExpirationDate(NewItemLedgEntry);
        //                                          NewItemLedgEntry."Entry No." := ItemLedgEntryNo;
        //                                          NewItemLedgEntry.Quantity := -OldItemLedgEntry.Quantity;
        //                                          NewItemLedgEntry."Remaining Quantity" := -OldItemLedgEntry.Quantity;
        //                                          IF NewItemLedgEntry.Quantity > 0 THEN
        //                                            NewItemLedgEntry."Shipped Qty. Not Returned" := 0
        //                                          #12..31
        //                                              NewItemLedgEntry."Serial No.",
        //                                              TRUE,
        //                                              EntriesExist);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..8
        //  
        //                                          //RFM6066 SECOND COUNT
        //                                          NewItemLedgEntry."Quantity 2" := -OldItemLedgEntry."Quantity 2";
        //  
        //                                          #9..34
        //                                        END;
        //  
        //                           Target=InitCorrItemLedgEntry(PROCEDURE 37) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          ValueEntryNo := ValueEntryNo + 1;
        //  
        //                                          NewValueEntry := OldValueEntry;
        //                                          #4..28
        //                                            NewValueEntry."Purchase Amount (Expected)" := -OldValueEntry."Purchase Amount (Expected)";
        //                                          END;
        //  
        //                                          NewValueEntry."Purchase Amount (Actual)" := 0;
        //                                          NewValueEntry."Sales Amount (Actual)" := 0;
        //                                          NewValueEntry."Cost Amount (Non-Invtbl.)" := Sign * OldValueEntry."Cost Amount (Non-Invtbl.)";
        //                                          #35..47
        //  
        //                                          InsertItemReg(0,0,NewValueEntry."Entry No.",0);
        //                                          InsertPostValueEntryToGL(NewValueEntry);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..31
        //                                          // iCepts BRB 06.18.09 - Update new fields
        //                                          NewValueEntry."Item Category Code" := OldValueEntry."Item Category Code";
        //                                          NewValueEntry."Product Group Code" := OldValueEntry."Product Group Code";
        //                                          NewValueEntry."Product Group Total Code" := COPYSTR(OldValueEntry."Product Group Code",1,2); // iCepts BRB 07.16.09
        //  
        //                                          // iCepts BRB 07.26.13 - RFM7914 Get Broker Code :START
        //                                          IF NewValueEntry."Document Type" = NewValueEntry."Document Type"::"Sales Invoice" THEN BEGIN
        //                                            IF SlsInvLne.GET(NewValueEntry."Document No.",NewValueEntry."Document Line No.") THEN
        //                                              NewValueEntry."Broker Code" := SlsInvLne.GetBrokerCode;
        //                                          END;
        //                                          // iCepts BRB 07.26.13 - RFM7914 Get Broker Code :END
        //  
        //                                          #32..50
        //                                        END;
        //  
        //                           Target=InsertCorrValueEntry(PROCEDURE 34) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          TouchedItemLedgerEntries.SETCURRENTKEY("Item No.",Open,"Variant Code",Positive,"Location Code","Posting Date");
        //                                          IF TouchedItemLedgerEntries.FIND('-') THEN BEGIN
        //                                            DialogWindow.OPEN(Text01 +
        //                                          #4..13
        //                                                TouchedItemLedgEntry.GET(TouchedItemLedgerEntries."Entry No.");
        //                                              END;
        //                                            UNTIL TouchedItemLedgerEntries.NEXT = 0;
        //                                            IF AnyTouchedEntries THEN
        //                                              VerifyTouchedOnInventory;
        //                                            TouchedItemLedgerEntries.DELETEALL;
        //                                            DialogWindow.CLOSE;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..16
        //                                          #19..21
        //                                        END;
        //  
        //                           Target=RedoApplications(PROCEDURE 91) }
        //      { Deletion          ;Target=VerifyTouchedOnInventory(PROCEDURE 103).ItemLedgEntryApplied(Variable 1000);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             ItemLedgEntryApplied@1000 : Record "Item Ledger Entry";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH TouchedItemLedgerEntries DO BEGIN
        //                                            FINDSET;
        //                                            REPEAT
        //                                              ItemLedgEntryApplied.GET("Entry No.");
        //                                              ItemLedgEntryApplied.VerifyOnInventory;
        //                                            UNTIL NEXT = 0;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..3
        //                                              VerifyOnInventory;
        //                                            UNTIL NEXT = 0;
        //                                          END;
        //                                        END;
        //  
        //                           Target=VerifyTouchedOnInventory(PROCEDURE 103) }
        //      { Insertion         ;InsertAfter=Text033(Variable 1040);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             TotalAppliedQty2@1000000002 : Decimal;
        //                             TotalAppliedQty1@1000000001 : Decimal;
        //                             SlsInvLne@1000000000 : Record "Sales Invoice Line";
        //                           }
        //                            }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW18.00.00.40938,NAVNA8.00.00.40938;
        //                           ModifiedValue=NAVW18.00.00.38798,NAVNA8.00.00.38798,iCepts1.03 }
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

