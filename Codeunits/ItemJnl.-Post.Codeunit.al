Codeunit 70000241 "Item Jnl.-Post241"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Item Jnl.-Post"(Codeunit 241)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=02032015D;
        //      Time=165546T;
        //      Modified=Yes;
        //      Version List=NAVW17.00,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Item Jnl.-Post"(Codeunit 241);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ItemJnlLine DO BEGIN
        //                                            ItemJnlTemplate.GET("Journal Template Name");
        //                                            ItemJnlTemplate.TESTFIELD("Force Posting Report",FALSE);
        //                                            IF ItemJnlTemplate.Recurring AND (GETFILTER("Posting Date") <> '') THEN
        //                                              FIELDERROR("Posting Date",Text000);
        //  
        //                                            IF NOT CONFIRM(Text001,FALSE) THEN
        //                                              EXIT;
        //  
        //                                            TempJnlBatchName := "Journal Batch Name";
        //  
        //                                            ItemJnlPostBatch.RUN(ItemJnlLine);
        //  
        //                                            IF "Line No." = 0 THEN
        //                                              MESSAGE(Text002)
        //                                            ELSE
        //                                              IF TempJnlBatchName = "Journal Batch Name" THEN
        //                                                MESSAGE(Text003)
        //                                              ELSE
        //                                                MESSAGE(
        //                                                  Text004 +
        //                                                  Text005,
        //                                                  "Journal Batch Name");
        //  
        //                                            IF NOT FIND('=><') OR (TempJnlBatchName <> "Journal Batch Name") THEN BEGIN
        //                                              RESET;
        //                                              FILTERGROUP(2);
        //                                              SETRANGE("Journal Template Name","Journal Template Name");
        //                                              SETRANGE("Journal Batch Name","Journal Batch Name");
        //                                              FILTERGROUP(0);
        //                                              "Line No." := 1;
        //                                            END;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..6
        //                                            IF NOT FromSigma THEN // iCepts BRB 11.09.09 - RFM6595
        //                                              IF NOT CONFIRM(Text001,FALSE) THEN
        //                                                EXIT;
        //                                          #9..11
        //                                             // iCepts BRB 11.09.09 - RFM6595 Do not display
        //                                            IF FromSigma THEN
        //                                              ItemJnlPostBatch.SetFromSigma;
        //                                          #12..14
        //  
        //                                              // iCepts BRB 11.09.09 - RFM6595
        //                                              IF NOT FromSigma THEN
        //                                                MESSAGE(Text002)
        //                                            ELSE
        //                                              IF TempJnlBatchName = "Journal Batch Name" THEN
        //                                                // iCepts BRB 11.09.09 - RFM6595
        //                                                IF NOT FromSigma THEN
        //                                                  MESSAGE(Text003)
        //                                              ELSE
        //  
        //                                                // iCepts BRB 11.09.09 - RFM6595
        //                                                IF NOT FromSigma THEN
        //                                                  MESSAGE(
        //                                                    Text004 +
        //                                                    Text005,
        //                                                    "Journal Batch Name");
        //                                          #24..33
        //                                        END;
        //  
        //                           Target=Code(PROCEDURE 1) }
        //      { Insertion         ;InsertAfter=Code(PROCEDURE 1);
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
        //      { Insertion         ;InsertAfter=TempJnlBatchName(Variable 1009);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             FromSigma@1000000000 : Boolean;
        //                           }
        //                            }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW17.00;
        //                           ModifiedValue=NAVW17.00,iCepts1.00 }
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

