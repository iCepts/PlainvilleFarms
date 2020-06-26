Codeunit 70005900 ServOrderManagement5900
{

    trigger OnRun()
    begin

        //  OBJECT Modification ServOrderManagement(Codeunit 5900)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09032019D;
        //      Time=115002T;
        //      Modified=Yes;
        //      Version List=NAVW18.00.00.38798,NAVNA8.00.00.38798,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target=ServOrderManagement(Codeunit 5900);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          ServHeader.GET(ServInvLine."Document Type",ServInvLine."Document No.");
        //  
        //                                          ServInvLine2.RESET;
        //                                          ServInvLine2.SETRANGE("Document Type",ServInvLine."Document Type");
        //                                          ServInvLine2.SETRANGE("Document No.",ServInvLine."Document No.");
        //                                          ServInvLine2 := ServInvLine;
        //  
        //                                          NextLine := ServInvLine.GetNextLineNo(ServInvLine,FALSE);
        //                                          IF NextLine = 0 THEN
        //                                            ERROR(Text008,ServInvLine.TABLECAPTION);
        //  
        //                                          #12..59
        //                                            ELSE
        //                                              EXIT(FALSE);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..7
        //                                          NextLine := ServInvLine.GetNextLineNo(ServInvLine,TRUE);
        //                                          #9..62
        //                                        END;
        //  
        //                           Target=InsertServCost(PROCEDURE 4) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF ServContractLine.GET(
        //                                               ServContractLine."Contract Type"::Contract,
        //                                               ServItemLine."Contract No.",
        //                                          #4..9
        //                                              ServContractLine."Last Service Date" := ServHeader."Posting Date";
        //                                            ServContractLine."Last Planned Service Date" :=
        //                                              ServContractLine."Next Planned Service Date";
        //                                            ServContractLine.CalculateNextServiceVisit;
        //                                            ServContractLine."Last Preventive Maint. Date" := ServContractLine."Last Service Date";
        //                                          END;
        //                                          ServContractLine.MODIFY;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..12
        //                                            //ServContractLine.CalculateNextServiceVisit;    //09.03.19dxd
        //                                          #14..16
        //                                        END;
        //  
        //                           Target=CalcContractDates(PROCEDURE 56) }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW18.00.00.40938,NAVNA8.00.00.40938;
        //                           ModifiedValue=NAVW18.00.00.38798,NAVNA8.00.00.38798,iCepts1.00 }
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

