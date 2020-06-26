Codeunit 70000092 "Purch.-Post + Print92"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Purch.-Post + Print"(Codeunit 92)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=06162015D;
        //      Time=160934T;
        //      Modified=Yes;
        //      Version List=NAVW17.00,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Purch.-Post + Print"(Codeunit 92);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH PurchHeader DO BEGIN
        //                                            CASE "Document Type" OF
        //                                              "Document Type"::Order:
        //                                          #4..30
        //                                              PurchasePostViaJobQueue.EnqueuePurchDoc(PurchHeader)
        //                                            ELSE BEGIN
        //                                              CODEUNIT.RUN(CODEUNIT::"Purch.-Post",PurchHeader);
        //                                              GetReport(PurchHeader);
        //                                            END;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..33
        //                                              //GetReport(PurchHeader); //06.16.15 DXD Do not print
        //                                            END;
        //                                          END;
        //                                        END;
        //  
        //                           Target=Code(PROCEDURE 2) }
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

