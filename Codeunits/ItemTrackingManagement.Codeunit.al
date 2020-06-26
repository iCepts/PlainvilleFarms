Codeunit 70006500 "Item Tracking Management6500"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Item Tracking Management"(Codeunit 6500)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=02032015D;
        //      Time=172859T;
        //      Modified=Yes;
        //      Version List=NAVW18.00.00.38798,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Item Tracking Management"(Codeunit 6500);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          TempWhseJnlLine2.DELETEALL;
        //  
        //                                          CheckWhseItemTrkgSetup(TempWhseJnlLine."Item No.",WhseSNRequired,WhseLNRequired,FALSE);
        //                                          #4..47
        //                                                    FIELDERROR("Quantity (Base)");
        //  
        //                                                IF ToTransfer THEN BEGIN
        //                                                  SetWhseSerialLotNo(TempWhseJnlLine2."Serial No.","New Serial No.",WhseSNRequired);
        //                                                  SetWhseSerialLotNo(TempWhseJnlLine2."Lot No.","New Lot No.",WhseLNRequired);
        //                                                  IF "New Expiration Date" <> 0D THEN
        //                                                    TempWhseJnlLine2."Expiration Date" := "New Expiration Date"
        //                                                END ELSE BEGIN
        //                                                  SetWhseSerialLotNo(TempWhseJnlLine2."Serial No.","Serial No.",WhseSNRequired);
        //                                                  SetWhseSerialLotNo(TempWhseJnlLine2."Lot No.","Lot No.",WhseLNRequired);
        //                                                  TempWhseJnlLine2."Expiration Date" := "Expiration Date";
        //                                                END;
        //                                                SetWhseSerialLotNo(TempWhseJnlLine2."New Serial No.","New Serial No.",WhseSNRequired);
        //                                                SetWhseSerialLotNo(TempWhseJnlLine2."New Lot No.","New Lot No.",WhseLNRequired);
        //                                                TempWhseJnlLine2."New Expiration Date" := "New Expiration Date";
        //                                                TempWhseJnlLine2."Warranty Date" := "Warranty Date";
        //                                                TempWhseJnlLine2."Qty. (Absolute, Base)" := ABS("Quantity (Base)");
        //                                          #65..88
        //                                              TempWhseJnlLine2.INSERT;
        //                                            END;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..50
        //                                                  TempWhseJnlLine2."Serial No." := "New Serial No.";
        //                                                  TempWhseJnlLine2."Lot No." := "New Lot No.";
        //                                          #53..55
        //                                                  TempWhseJnlLine2."Serial No." := "Serial No.";
        //                                                  TempWhseJnlLine2."Lot No." := "Lot No.";
        //                                                  TempWhseJnlLine2."Expiration Date" := "Expiration Date";
        //                                                END;
        //                                                TempWhseJnlLine2."New Serial No." := "New Serial No.";
        //                                                TempWhseJnlLine2."New Lot No." := "New Lot No.";
        //                                          #62..91
        //                                        END;
        //  
        //                           Target=SplitWhseJnlLine(PROCEDURE 29) }
        //      { Deletion          ;Target=SynchronizeWhseItemTracking(PROCEDURE 51).Deletion(Parameter 1006);
        //                           ChangedElements=ParameterCollection
        //                           {
        //                             { 1006;Deletion                 ;Boolean       }
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF TempTrackingSpecification.FINDSET THEN
        //                                            REPEAT
        //                                              IF TempTrackingSpecification.Correction THEN BEGIN
        //                                          #4..56
        //                                                      IF RegPickNo <> '' THEN BEGIN
        //                                                        ReservEntry."Qty. to Handle (Base)" += Qty;
        //                                                        ReservEntry."Qty. to Invoice (Base)" += Qty;
        //                                                      END ELSE
        //                                                        IF NOT Deletion THEN BEGIN
        //                                                          ReservEntry."Qty. to Handle (Base)" := Qty;
        //                                                          ReservEntry."Qty. to Invoice (Base)" := Qty;
        //                                                        END;
        //                                                      IF ABS(ReservEntry."Qty. to Handle (Base)") > ABS(ReservEntry."Quantity (Base)") THEN BEGIN
        //                                                        Qty := ReservEntry."Qty. to Handle (Base)" - ReservEntry."Quantity (Base)";
        //                                                        ReservEntry."Qty. to Handle (Base)" := ReservEntry."Quantity (Base)";
        //                                          #68..99
        //                                              TempTrackingSpecification.SETRANGE("Source Prod. Order Line");
        //                                              TempTrackingSpecification.SETRANGE("Source Ref. No.");
        //                                            UNTIL TempTrackingSpecification.NEXT = 0;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..59
        //                                                      END;
        //                                          #65..102
        //                                        END;
        //  
        //                           Target=SynchronizeWhseItemTracking(PROCEDURE 51) }
        //      { Deletion          ;Target=SetWhseSerialLotNo(PROCEDURE 113);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE SetWhseSerialLotNo@113(VAR DestNo@1000 : Code[20];SourceNo@1001 : Code[20];NoRequired@1002 : Boolean);
        //                             BEGIN
        //                               IF NoRequired THEN
        //                                 DestNo := SourceNo;
        //                             END;
        //  
        //                           }
        //                            }
        //      { Insertion         ;InsertAfter=WhseItemTrkgLineExists(PROCEDURE 109);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             PROCEDURE CallPostedItemTrackingTempIN@1000000000(InvoiceRowID@1000000000 : Text[100];VAR TempItemLedgEntry@1000000001 : TEMPORARY Record "Item Ledger Entry") : Boolean;
        //                             VAR
        //                               ValueEntryRelation@1000000002 : Record "Value Entry Relation";
        //                               ValueEntry@1000000003 : Record "Value Entry";
        //                               ItemLedgEntry@1000000004 : Record "Item Ledger Entry";
        //                               SignFactor@1000000005 : Integer;
        //                             BEGIN
        //                               // iCepts BRB 04.09.09 - Used when calling Item Tracking from invoiced documents:
        //                               ValueEntryRelation.SETCURRENTKEY("Source RowId");
        //                               ValueEntryRelation.SETRANGE("Source RowId",InvoiceRowID);
        //                               IF ValueEntryRelation.FIND('-') THEN BEGIN
        //                                 SignFactor := TableSignFactor2(InvoiceRowID);
        //                                 REPEAT
        //                                   ValueEntry.GET(ValueEntryRelation."Value Entry No.");
        //                                   ItemLedgEntry.GET(ValueEntry."Item Ledger Entry No.");
        //                                   TempItemLedgEntry := ItemLedgEntry;
        //                                   TempItemLedgEntry.Quantity := ValueEntry."Invoiced Quantity";
        //                                   IF TempItemLedgEntry.Quantity <> 0 THEN
        //                                     AddTempRecordToSet(TempItemLedgEntry,SignFactor);
        //                                 UNTIL ValueEntryRelation.NEXT = 0;
        //                                 // FORM.RUNMODAL(FORM::"Posted Item Tracking Lines",TempItemLedgEntry);
        //                                 EXIT(TRUE);
        //                               END ELSE
        //                                 EXIT(FALSE);
        //                             END;
        //  
        //                           }
        //                            }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW18.00.00.39663;
        //                           ModifiedValue=NAVW18.00.00.38798,iCepts1.00 }
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

