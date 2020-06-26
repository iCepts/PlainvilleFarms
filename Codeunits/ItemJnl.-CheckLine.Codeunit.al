Codeunit 70000021 "Item Jnl.-Check Line21"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Item Jnl.-Check Line"(Codeunit 21)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=03202018D;
        //      Time=133125T;
        //      Modified=Yes;
        //      Version List=NAVW18.00.00.38457,iCepts1.02;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Item Jnl.-Check Line"(Codeunit 21);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemJnlLine DO BEGIN
        //                                            IF EmptyLine THEN BEGIN
        //                                              IF NOT IsValueEntryForDeletedItem THEN
        //                                          #4..68
        //                                                THEN
        //                                                  ERROR(Text007)
        //                                              END ELSE BEGIN
        //                                                IF ("Quantity (Base)" = 0) AND ("Invoiced Qty. (Base)" = 0) THEN
        //                                                  ERROR(Text007);
        //                                              END;
        //                                              TESTFIELD("Qty. (Calculated)",0);
        //                                          #76..102
        //                                            THEN BEGIN
        //                                              TESTFIELD("Source No.");
        //                                              TESTFIELD("Order Type","Order Type"::Production);
        //                                              IF ("Entry Type" = "Entry Type"::Output) AND
        //                                                 CheckFindProdOrderLine(ProdOrderLine,"Order No.","Order Line No.")
        //                                              THEN
        //                                                TESTFIELD("Item No.",ProdOrderLine."Item No.");
        //                                              IF Subcontracting THEN BEGIN
        //                                                WorkCenter.GET("Work Center No.");
        //                                                WorkCenter.TESTFIELD("Subcontractor No.");
        //                                          #113..123
        //  
        //                                            CheckDimensions(ItemJnlLine);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..71
        //                                                //IF ("Quantity (Base)" = 0) AND ("Invoiced Qty. (Base)" = 0) THEN
        //                                                IF ("Quantity (Base)" = 0) AND ("Invoiced Qty. (Base)" = 0) AND ("Quantity 2" = 0) THEN //Added
        //                                          #73..105
        //                                              // iCepts 03.20.18 WRW - Correct ACIE Error - Start
        //                                              IF NOT CalledFromAdjustment AND ("Entry Type" = "Entry Type"::Output) THEN
        //                                                IF CheckFindProdOrderLine(ProdOrderLine,"Order No.","Order Line No.") THEN
        //                                                  TESTFIELD("Item No.",ProdOrderLine."Item No.");
        //                                              // iCepts 03.20.18 WRW - Correct ACIE Error - End
        //                                          #110..126
        //                                        END;
        //  
        //                           Target=RunCheck(PROCEDURE 1) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemJnlLine DO
        //                                            IF NOT IsValueEntryForDeletedItem AND NOT Correction AND NOT CalledFromAdjustment THEN BEGIN
        //                                              IF NOT DimMgt.CheckDimIDComb("Dimension Set ID") THEN
        //                                          #4..21
        //                                                    ERROR(DimCausedErr,"Journal Template Name","Journal Batch Name","Line No.",DimMgt.GetDimValuePostingErr);
        //                                                  ERROR(DimMgt.GetDimValuePostingErr);
        //                                                END;
        //                                            END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..24
        //  
        //                                            // DRS RFM6066 06/12/2008
        //                                            IF ItemJnlLine.Quantity <> 0 THEN // iCepts BRB 05.25.10 - getting an error
        //                                              SecondQtyMgt.ZeroCheck(ItemJnlLine);
        //  
        //                                            END;
        //                                        END;
        //  
        //                           Target=CheckDimensions(PROCEDURE 5) }
        //      { Insertion         ;InsertAfter=UseInTransitLocationErr(Variable 1024);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             SecondQtyMgt@1000000000 : Codeunit SecondQtyManagement;
        //                           }
        //                            }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW18.00.00.38457;
        //                           ModifiedValue=NAVW18.00.00.38457,iCepts1.02 }
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

