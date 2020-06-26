Codeunit 70000040 LogInManagement40
{

    trigger OnRun()
    begin

        //  OBJECT Modification LogInManagement(Codeunit 40)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=02032015D;
        //      Time=162320T;
        //      Modified=Yes;
        //      Version List=NAVW18.00,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target=LogInManagement(Codeunit 40);
        //    }
        //    CHANGES
        //    {
        //      { Insertion         ;Target=LogInStart(PROCEDURE 3);
        //                           InsertAfter=JobQueueRestartUserSession(Variable 1001);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             SRSetup@1000000000 : Record "Sales & Receivables Setup";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF (STRPOS(COMPANYNAME,Text000) < 1) AND LicenseAgreement.GET THEN
        //                                            IF (TODAY >= LicenseAgreement."Effective Date") AND NOT LicenseAgreement.Accepted THEN BEGIN
        //                                              PAGE.RUNMODAL(PAGE::"License Agreement Accept");
        //                                          #4..53
        //                                          LogInWorkDate := 0D;
        //  
        //                                          WORKDATE := GetDefaultWorkDate;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..56
        //  
        //                                          // iCepts BRB 11.02.09 - RFM6595 Job Queue, see if runs background without a problem
        //                                          { // iCepts BRB 11.05.09 - use NAS
        //                                          SRSetup.GET;
        //                                          IF UPPERCASE(USERID) = SRSetup."Sigma Dispatcher User" THEN
        //                                            CODEUNIT.RUN(CODEUNIT::"Job Queue Dispacher");
        //                                          }
        //                                        END;
        //  
        //                           Target=LogInStart(PROCEDURE 3) }
        //      { PropertyModification;
        //                           Property=Permissions;
        //                           OriginalValue=TableData "G/L Entry"=r,
        //                                         TableData Customer=r,
        //                                         TableData Vendor=r,
        //                                         TableData Item=r,
        //                                         TableData "User Time Register"=rimd,
        //                                         TableData "My Customer"=rimd,
        //                                         TableData "My Vendor"=rimd,
        //                                         TableData "My Item"=rimd;
        //                           ModifiedValue=TableData "G/L Entry"=r,
        //                                         TableData "User Time Register"=rimd }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW18.00.00.40938;
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

