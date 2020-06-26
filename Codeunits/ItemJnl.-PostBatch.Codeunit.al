Codeunit 70000023 "Item Jnl.-Post Batch23"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Item Jnl.-Post Batch"(Codeunit 23)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=02032015D;
        //      Time=163945T;
        //      Modified=Yes;
        //      Version List=NAVW18.00,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Item Jnl.-Post Batch"(Codeunit 23);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemJnlLine DO BEGIN
        //                                            LOCKTABLE;
        //                                            SETRANGE("Journal Template Name","Journal Template Name");
        //                                            SETRANGE("Journal Batch Name","Journal Batch Name");
        //  
        //                                            ItemJnlTemplate.GET("Journal Template Name");
        //                                            ItemJnlBatch.GET("Journal Template Name","Journal Batch Name");
        //                                            IF STRLEN(INCSTR(ItemJnlBatch.Name)) > MAXSTRLEN(ItemJnlBatch.Name) THEN
        //                                              ItemJnlBatch.FIELDERROR(
        //                                                Name,
        //                                                STRSUBSTNO(
        //                                                  Text000,
        //                                                  MAXSTRLEN(ItemJnlBatch.Name)));
        //  
        //                                            IF ItemJnlTemplate.Recurring THEN BEGIN
        //                                              SETRANGE("Posting Date",0D,WORKDATE);
        //                                              SETFILTER("Expiration Date",'%1 | %2..',0D,WORKDATE);
        //                                            END;
        //  
        //                                            IF NOT FIND('=><') THEN BEGIN
        //                                              "Line No." := 0;
        //                                              COMMIT;
        //                                              EXIT;
        //                                            END;
        //  
        //                                            CheckItemAvailability(ItemJnlLine);
        //  
        //                                            IF ItemJnlTemplate.Recurring THEN
        //                                              Window.OPEN(
        //                                                Text001 +
        //                                                Text002 +
        //                                                Text003 +
        //                                                Text004)
        //                                            ELSE
        //                                              Window.OPEN(
        //                                                Text001 +
        //                                                Text002 +
        //                                                Text005);
        //  
        //                                            Window.UPDATE(1,"Journal Batch Name");
        //  
        //                                            CheckLines(ItemJnlLine);
        //  
        //                                            // Find next register no.
        //                                            ItemLedgEntry.LOCKTABLE;
        //                                            IF ItemLedgEntry.FINDLAST THEN;
        //                                            IF WhseTransaction THEN BEGIN
        //                                              WhseEntry.LOCKTABLE;
        //                                              IF WhseEntry.FINDLAST THEN;
        //                                            END;
        //  
        //                                            ItemReg.LOCKTABLE;
        //                                            IF ItemReg.FINDLAST THEN
        //                                              ItemRegNo := ItemReg."No." + 1
        //                                            ELSE
        //                                              ItemRegNo := 1;
        //  
        //                                            WhseReg.LOCKTABLE;
        //                                            IF WhseReg.FINDLAST THEN
        //                                              WhseRegNo := WhseReg."No." + 1
        //                                            ELSE
        //                                              WhseRegNo := 1;
        //  
        //                                            GLSetup.GET;
        //                                            PhysInvtCount := FALSE;
        //  
        //                                            // Post lines
        //                                            LineCount := 0;
        //                                            OldEntryType := "Entry Type";
        //                                            PostLines(ItemJnlLine,PhysInvtCountMgt);
        //  
        //                                            // Copy register no. and current journal batch name to item journal
        //                                            IF NOT ItemReg.FINDLAST OR (ItemReg."No." <> ItemRegNo) THEN
        //                                              ItemRegNo := 0;
        //                                            IF NOT WhseReg.FINDLAST OR (WhseReg."No." <> WhseRegNo) THEN
        //                                              WhseRegNo := 0;
        //  
        //                                            INIT;
        //  
        //                                            "Line No." := ItemRegNo;
        //                                            IF "Line No." = 0 THEN
        //                                              "Line No." := WhseRegNo;
        //  
        //                                            InvtSetup.GET;
        //                                            IF InvtSetup."Automatic Cost Adjustment" <>
        //                                               InvtSetup."Automatic Cost Adjustment"::Never
        //                                            THEN BEGIN
        //                                              InvtAdjmt.SetProperties(TRUE,InvtSetup."Automatic Cost Posting");
        //                                              InvtAdjmt.MakeMultiLevelAdjmt;
        //                                            END;
        //  
        //                                            // Update/delete lines
        //                                            IF "Line No." <> 0 THEN BEGIN
        //                                              IF ItemJnlTemplate.Recurring THEN BEGIN
        //                                                HandleRecurringLine(ItemJnlLine);
        //                                              END ELSE
        //                                                HandleNonRecurringLine(ItemJnlLine,OldEntryType);
        //                                              IF ItemJnlBatch."No. Series" <> '' THEN
        //                                                NoSeriesMgt.SaveNoSeries;
        //                                              IF NoSeries.FINDSET THEN
        //                                                REPEAT
        //                                                  EVALUATE(PostingNoSeriesNo,NoSeries.Description);
        //                                                  NoSeriesMgt2[PostingNoSeriesNo].SaveNoSeries;
        //                                                UNTIL NoSeries.NEXT = 0;
        //                                            END;
        //  
        //                                            IF PhysInvtCount THEN
        //                                              PhysInvtCountMgt.UpdateItemSKUListPhysInvtCount;
        //  
        //                                            Window.CLOSE;
        //                                            COMMIT;
        //                                            CLEAR(ItemJnlCheckLine);
        //                                            CLEAR(ItemJnlPostLine);
        //                                            CLEAR(WhseJnlPostLine);
        //                                            CLEAR(InvtAdjmt)
        //                                          END;
        //                                          UpdateAnalysisView.UpdateAll(0,TRUE);
        //                                          UpdateItemAnalysisView.UpdateAll(0,TRUE);
        //                                          COMMIT;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..27
        //                                            // iCepts BRB 11.09.09 - RFM6595 Do not Display
        //                                            IF ItemJnlTemplate.Recurring THEN BEGIN
        //                                              IF NOT FromSigma THEN
        //                                                Window.OPEN(
        //                                                  Text001 +
        //                                                  Text002 +
        //                                                  Text003 +
        //                                                  Text004)
        //                                            END ELSE BEGIN
        //                                              IF NOT FromSigma THEN
        //                                                Window.OPEN(
        //                                                  Text001 +
        //                                                  Text002 +
        //                                                  Text005);
        //  
        //                                            END;
        //  
        //                                            // iCepts BRB 11.09.09 - RFM6595 Do not Display
        //                                            IF NOT FromSigma THEN
        //                                              Window.UPDATE(1,"Journal Batch Name");
        //                                          #41..109
        //                                            // iCepts BRB 11.09.09 - RFM6595 Do not Display
        //                                            IF NOT FromSigma THEN
        //                                              Window.CLOSE;
        //                                          #111..119
        //                                        END;
        //  
        //                           Target=Code(PROCEDURE 3) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemJnlLine DO BEGIN
        //                                            LineCount := 0;
        //                                            StartLineNo := "Line No.";
        //                                            REPEAT
        //                                              LineCount := LineCount + 1;
        //                                              Window.UPDATE(2,LineCount);
        //                                              CheckRecurringLine(ItemJnlLine);
        //  
        //                                              IF (("Value Entry Type" = "Value Entry Type"::"Direct Cost") AND ("Item Charge No." = '')) OR
        //                                          #10..28
        //                                            UNTIL "Line No." = StartLineNo;
        //                                            NoOfRecords := LineCount;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..5
        //                                              // iCepts BRB 11.09.09 - RFM6595 Do not Display
        //                                              IF NOT FromSigma THEN
        //                                                Window.UPDATE(2,LineCount);
        //                                          #7..31
        //                                        END;
        //  
        //                           Target=CheckLines(PROCEDURE 11) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          LastDocNo := '';
        //                                          LastDocNo2 := '';
        //                                          LastPostedDocNo := '';
        //                                          #4..20
        //                                                   (("Invoiced Quantity" <> 0) AND (Amount <> 0))
        //                                                THEN BEGIN
        //                                                  LineCount := LineCount + 1;
        //                                                  Window.UPDATE(3,LineCount);
        //                                                  Window.UPDATE(4,ROUND(LineCount / NoOfRecords * 10000,1));
        //                                                  OriginalQuantity := Quantity;
        //                                                  OriginalQuantityBase := "Quantity (Base)";
        //                                                  ItemJnlPostLine.RunWithCheck(ItemJnlLine);
        //                                          #29..42
        //                                              END;
        //                                            UNTIL NEXT = 0;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..23
        //                                                  // iCepts BRB 11.09.09 - RFM6595 Do not Display
        //                                                  IF NOT FromSigma THEN BEGIN
        //                                                    Window.UPDATE(3,LineCount);
        //                                                    Window.UPDATE(4,ROUND(LineCount / NoOfRecords * 10000,1));
        //                                                  END;
        //                                          #26..45
        //                                        END;
        //  
        //                           Target=PostLines(PROCEDURE 12) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          LineCount := 0;
        //                                          ItemJnlLine2.COPYFILTERS(ItemJnlLine);
        //                                          ItemJnlLine2.FINDSET;
        //                                          REPEAT
        //                                            LineCount := LineCount + 1;
        //                                            Window.UPDATE(5,LineCount);
        //                                            Window.UPDATE(6,ROUND(LineCount / NoOfRecords * 10000,1));
        //                                            IF ItemJnlLine2."Posting Date" <> 0D THEN
        //                                              ItemJnlLine2.VALIDATE("Posting Date",CALCDATE(ItemJnlLine2."Recurring Frequency",ItemJnlLine2."Posting Date"));
        //                                            IF (ItemJnlLine2."Recurring Method" = ItemJnlLine2."Recurring Method"::Variable) AND
        //                                          #11..15
        //                                            END;
        //                                            ItemJnlLine2.MODIFY;
        //                                          UNTIL ItemJnlLine2.NEXT = 0;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..5
        //                                            // iCepts BRB 11.09.09 - RFM6595 Do not Display
        //                                            IF NOT FromSigma THEN BEGIN
        //                                              Window.UPDATE(5,LineCount);
        //                                              Window.UPDATE(6,ROUND(LineCount / NoOfRecords * 10000,1));
        //                                            END;
        //                                          #8..18
        //                                        END;
        //  
        //                           Target=HandleRecurringLine(PROCEDURE 15) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          DistributeCosts := TRUE;
        //                                          RemAmountToDistribute := ItemJnlLine.Amount;
        //                                          RemQuantity := ItemJnlLine.Quantity;
        //                                          IF ItemJnlLine.Amount <> 0 THEN BEGIN
        //                                            LineCount := LineCount + 1;
        //                                            Window.UPDATE(3,LineCount);
        //                                            Window.UPDATE(4,ROUND(LineCount / NoOfRecords * 10000,1));
        //                                            WITH ItemLedgEntry4 DO BEGIN
        //                                              Item.GET(ItemJnlLine4."Item No.");
        //                                              IncludeExpectedCost := (Item."Costing Method" = Item."Costing Method"::Standard) AND
        //                                          #11..120
        //                                            IF ItemJnlLine."Update Standard Cost" THEN
        //                                              UpdateStdCost;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..5
        //                                            // iCepts BRB 11.09.09 - RFM6595 Do not Display
        //                                            IF NOT FromSigma THEN BEGIN
        //                                              Window.UPDATE(3,LineCount);
        //                                              Window.UPDATE(4,ROUND(LineCount / NoOfRecords * 10000,1));
        //                                            END;
        //                                          #8..123
        //                                        END;
        //  
        //                           Target=ItemJnlPostSumLine(PROCEDURE 5800) }
        //      { Insertion         ;InsertAfter=SelfReservedQty(PROCEDURE 20);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             PROCEDURE SetFromSigma@1000000002();
        //                             BEGIN
        //                               // iCepts BRB 10.30.09 - RFM6595 Set from Sigma
        //                               FromSigma := TRUE;
        //                             END;
        //  
        //                           }
        //                            }
        //      { Insertion         ;InsertAfter=PhysInvtCount(Variable 1052);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             FromSigma@1000000000 : Boolean;
        //                           }
        //                            }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW18.00;
        //                           ModifiedValue=NAVW18.00,iCepts1.00 }
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

