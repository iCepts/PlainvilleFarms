Codeunit 70005407 "Prod. Order Status Management5407"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Prod. Order Status Management"(Codeunit 5407)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=02032015D;
        //      Time=165827T;
        //      Modified=Yes;
        //      Version List=NAVW18.00,iCepts1.01;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Prod. Order Status Management"(Codeunit 5407);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          ChangeStatusForm.Set(Rec);
        //                                          IF ChangeStatusForm.RUNMODAL = ACTION::Yes THEN BEGIN
        //                                            ChangeStatusForm.ReturnPostingInfo(NewStatus,NewPostingDate,NewUpdateUnitCost);
        //                                            ChangeStatusOnProdOrder(Rec,NewStatus,NewPostingDate,NewUpdateUnitCost);
        //                                            COMMIT;
        //                                            MESSAGE(Text000,Status,TABLECAPTION,"No.",ToProdOrder.Status,ToProdOrder.TABLECAPTION,ToProdOrder."No.")
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          // iCepts WRW 10.22.12 - Don't allow output of one pound or less
        //                                          IF Quantity <= 1 THEN
        //                                            ERROR ('Not allowed to produce a quantity of one pound or less');
        //  
        //                                          #1..7
        //                                        END;
        //  
        //                           Target=OnRun }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH PurchLine DO BEGIN
        //                                            SETCURRENTKEY("Document Type",Type,"Prod. Order No.","Prod. Order Line No.","Routing No.","Operation No.");
        //                                            SETRANGE("Document Type","Document Type"::Order);
        //                                          #4..41
        //                                                    ("Flushing Method" <> "Flushing Method"::"Pick + Backward") AND
        //                                                    ("Routing Link Code" = '')) OR
        //                                                   (("Routing Link Code" <> '') AND NOT RtngWillFlushComp(ProdOrderComp))
        //                                                THEN BEGIN
        //                                                  IF CONFIRM(STRSUBSTNO(Text006,ProdOrder.TABLECAPTION,ProdOrder."No.")) THEN
        //                                                    EXIT;
        //                                                  ERROR(Text005);
        //                                                END;
        //                                              UNTIL NEXT = 0;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..44
        //                                                THEN
        //                                                  // iCepts BRB 10.10.11 - Default to Yes to finish, if with consumption missing :START
        //                                                  EXIT;
        //                                                  {
        //                                          #45..49
        //                                                  }
        //                                                  // iCepts BRB 10.10.11 - Default to Yes to finish, if with consumption missing :END
        //                                              UNTIL NEXT = 0;
        //                                          END;
        //                                        END;
        //  
        //                           Target=CheckBeforeFinishProdOrder(PROCEDURE 3) }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW18.00;
        //                           ModifiedValue=NAVW18.00,iCepts1.01 }
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

