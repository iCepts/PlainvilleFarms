Codeunit 70010140 "Deposit-Post10140"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Deposit-Post"(Codeunit 10140)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=04262016D;
        //      Time=153332T;
        //      Modified=Yes;
        //      Version List=NAVNA8.00,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Deposit-Post"(Codeunit 10140);
        //    }
        //    CHANGES
        //    {
        //      { Insertion         ;Target=OnRun;
        //                           ChangedElements=VariableCollection
        //                           {
        //                             InterCompanyBranch@1000000000 : Record "InterCompany Branch Setup";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          // Perform all testing
        //  
        //                                          TESTFIELD("Posting Date");
        //                                          #4..69
        //                                                AddBalancingAccount(GenJnlLine,Rec)
        //                                              ELSE
        //                                                GenJnlLine."Bal. Account No." := '';
        //                                              GenJnlCheckLine.RunCheck(GenJnlLine);
        //                                            UNTIL GenJnlLine.NEXT = 0;
        //  
        //                                          BankCommentLine.RESET;
        //                                          #77..105
        //                                              GenJnlLine."Source No." := "Bank Account No.";
        //                                              GenJnlLine."Source Currency Code" := "Currency Code";
        //                                              GenJnlLine."Source Currency Amount" := GenJnlLine.Amount;
        //                                              GenJnlPostLine.RunWithoutCheck(GenJnlLine);
        //  
        //                                              PostedDepositLine.GET("No.",CurLine);
        //                                              CASE GenJnlLine."Account Type" OF
        //                                                GenJnlLine."Account Type"::"G/L Account",
        //                                          #114..199
        //                                            IF GenJnlBatch.INSERT THEN;
        //                                          END;
        //  
        //                                          DELETE;
        //  
        //                                          COMMIT;
        //  
        //                                          UpdateAnalysisView.UpdateAll(0,TRUE);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..72
        //  
        //                                              // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments - Start
        //                                              IF GenJnlLine."InterCompany Code" <> '' THEN
        //                                                PostInterCompanyTransactions(GenJnlLine);
        //                                              // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments - End
        //                                              GenJnlCheckLine.RunCheck(GenJnlLine);
        //  
        //                                          #74..108
        //  
        //                                              GenJnlPostLine.RunWithoutCheck(GenJnlLine);
        //                                          #111..202
        //                                          //ERROR('Stop Execution');
        //  
        //                                          #203..207
        //                                        END;
        //  
        //                           Target=OnRun }
        //      { Insertion         ;InsertAfter=AddBalancingAccount(PROCEDURE 1020001);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE PostInterCompanyTransactions@1000000000(GenJnlLine2@1000000000 : Record "Gen. Journal Line");
        //                             VAR
        //                               InterCompanyBranch@1000000003 : Record "InterCompany Branch Setup";
        //                               CustLedgEntry2@1000000001 : Record "Cust. Ledger Entry";
        //                               TotalAmountApplied@1000000004 : Decimal;
        //                               GenJnlLine3@1000000002 : Record "Gen. Journal Line";
        //                               Type1@1000000014 : Integer;
        //                               No1@1000000013 : Code[20];
        //                               Type2@1000000012 : Integer;
        //                               No2@1000000011 : Code[20];
        //                               Type3@1000000010 : Integer;
        //                               No3@1000000009 : Code[20];
        //                               Type4@1000000008 : Integer;
        //                               No4@1000000007 : Code[20];
        //                               Type5@1000000006 : Integer;
        //                               No5@1000000005 : Code[20];
        //                             BEGIN
        //                               // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments - Start
        //                               WITH GenJnlLine2 DO BEGIN
        //                                 IF NOT(InterCompanyBranch.GET("InterCompany Code")) THEN
        //                                   EXIT;
        //  
        //                                 TotalAmountApplied := 0;
        //                                 CustLedgEntry2.INIT;
        //                                 CustLedgEntry2.SETRANGE("Customer No.","Account No.");
        //                                 CustLedgEntry2.SETRANGE("Applies-to ID","Applies-to ID");
        //                                 CustLedgEntry2.SETRANGE("Global Dimension 2 Code","InterCompany Code");
        //  
        //                                 IF "Applies-to ID" = '' THEN
        //                                   TotalAmountApplied := -Amount
        //                                 ELSE BEGIN
        //                                   IF CustLedgEntry2.FIND('-') THEN
        //                                     REPEAT
        //                                       TotalAmountApplied += CustLedgEntry2."Amount to Apply";
        //                                     UNTIL CustLedgEntry2.NEXT = 0;
        //                                   IF TotalAmountApplied = 0 THEN
        //                                     EXIT;
        //                                 END;
        //  
        //                                 GenJnlLine3.INIT;
        //                                 GenJnlLine3."Account Type" := InterCompanyBranch."Due To Account Type";
        //                                 GenJnlLine3."Account No." := InterCompanyBranch."Due To Account No.";
        //                                 GenJnlLine3."Posting Date" := "Posting Date";
        //                                 GenJnlLine3."Document No." := "Document No.";
        //                                 GenJnlLine3."Currency Code" := "Currency Code";
        //                                 GenJnlLine3."Currency Factor" := "Currency Factor";
        //                                 GenJnlLine3."Posting Group" := "Posting Group";
        //                                 GenJnlLine3."Shortcut Dimension 1 Code" := InterCompanyBranch."Due To Dimension 1 Code";
        //                                 GenJnlLine3."Shortcut Dimension 2 Code" := InterCompanyBranch."Due To Dimension 2 Code";
        //                                 GenJnlLine3."Dimension Set ID" := CreateDim2(DATABASE::"G/L Account",GenJnlLine3."Account No.");
        //                                 GenJnlLine3."Source Code" := "Source Code";
        //                                 GenJnlLine3."Reason Code" := InterCompanyBranch."Reason Code";
        //                                 GenJnlLine3."Document Date" := "Document Date";
        //                                 GenJnlLine3."External Document No." := "External Document No.";
        //                                 GenJnlLine3."Source Type" := InterCompanyBranch."Due To Account Type";
        //                                 GenJnlLine3."Source No." := InterCompanyBranch."Due To Account No.";
        //                                 GenJnlLine3."Source Currency Code" := "Currency Code";
        //                                 GenJnlLine3.Description := InterCompanyBranch."Posting Description";
        //                                 GenJnlLine3.Amount := -TotalAmountApplied;
        //                                 GenJnlLine3."Source Currency Amount" := -TotalAmountApplied;
        //                                 GenJnlLine3.VALIDATE(Amount);
        //                                 GenJnlLine3."Amount (LCY)" := -TotalAmountApplied;
        //                                 GenJnlPostLine.RunWithCheck(GenJnlLine3);
        //  
        //                                 GenJnlLine3.INIT;
        //                                 GenJnlLine3."Account Type" := InterCompanyBranch."Due From Account Type";
        //                                 GenJnlLine3."Account No." := InterCompanyBranch."Due From Account No.";
        //                                 GenJnlLine3."Posting Date" := "Posting Date";
        //                                 GenJnlLine3."Document No." := "Document No.";
        //                                 GenJnlLine3."Currency Code" := "Currency Code";
        //                                 GenJnlLine3."Currency Factor" := "Currency Factor";
        //                                 GenJnlLine3."Posting Group" := "Posting Group";
        //                                 GenJnlLine3."Shortcut Dimension 1 Code" := InterCompanyBranch."Due From Dimension 1 Code";
        //                                 GenJnlLine3."Shortcut Dimension 2 Code" := InterCompanyBranch."Due From Dimension 2 Code";
        //                                 GenJnlLine3."Dimension Set ID" := CreateDim2(DATABASE::"G/L Account",GenJnlLine3."Account No.");
        //                                 GenJnlLine3."Source Code" := "Source Code";
        //                                 GenJnlLine3."Reason Code" := InterCompanyBranch."Reason Code";
        //                                 GenJnlLine3."Document Date" := "Document Date";
        //                                 GenJnlLine3."External Document No." := "External Document No.";
        //                                 GenJnlLine3."Source Type" := InterCompanyBranch."Due From Account Type";
        //                                 GenJnlLine3."Source No." := InterCompanyBranch."Due From Account No.";
        //                                 GenJnlLine3."Source Currency Code" := "Currency Code";
        //                                 GenJnlLine3.Description := InterCompanyBranch."Posting Description";
        //                                 GenJnlLine3.Amount := TotalAmountApplied;
        //                                 GenJnlLine3."Source Currency Amount" := TotalAmountApplied;
        //                                 GenJnlLine3.VALIDATE(Amount);
        //                                 GenJnlLine3."Amount (LCY)" := TotalAmountApplied;
        //                                 GenJnlPostLine.RunWithCheck(GenJnlLine3);
        //  
        //                               END;
        //                               // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments - End
        //                             END;
        //  
        //                             LOCAL PROCEDURE CreateDim2@2(Type1@1000 : Integer;No1@1001 : Code[20]) DimensionSetID : Integer;
        //                             VAR
        //                               SourceCodeSetup@1010 : Record "Source Code Setup";
        //                               TableID@1011 : ARRAY [10] OF Integer;
        //                               No@1012 : ARRAY [10] OF Code[20];
        //                               ShortcutDimension1Code@1000000000 : Code[20];
        //                               ShortcutDimension2Code@1000000001 : Code[20];
        //                               DimMgt@1000000002 : Codeunit DimensionManagement;
        //                             BEGIN
        //                               // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments - Start
        //                               SourceCodeSetup.GET;
        //                               TableID[1] := Type1;
        //                               No[1] := No1;
        //                               ShortcutDimension1Code := '';
        //                               ShortcutDimension2Code := '';
        //                               DimensionSetID :=
        //                                 DimMgt.GetDefaultDimID(
        //                                   TableID,No,SourceCodeSetup.Deposits,
        //                                   ShortcutDimension1Code,ShortcutDimension2Code,0,0);
        //                               // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments - End
        //                             END;
        //  
        //                           }
        //                            }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVNA8.00;
        //                           ModifiedValue=NAVNA8.00,iCepts1.00 }
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

