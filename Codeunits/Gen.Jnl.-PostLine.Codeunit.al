Codeunit 70000012 "Gen. Jnl.-Post Line12"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Gen. Jnl.-Post Line"(Codeunit 12)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=08192019D;
        //      Time=161913T;
        //      Modified=Yes;
        //      Version List=NAVW18.00.00.38798,NAVNA8.00.00.38798,iCepts1.01;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Gen. Jnl.-Post Line"(Codeunit 12);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          GenJnlLine2 := GenJnlLine;
        //                                          WITH GenJnlLine DO BEGIN
        //                                            "Account Type" := GenJnlLine2."Bal. Account Type";
        //                                          #4..42
        //                                            "Credit Amount" := GenJnlLine2."Debit Amount";
        //                                            "Amount (LCY)" := -GenJnlLine2."Amount (LCY)";
        //                                            "Balance (LCY)" := -GenJnlLine2."Balance (LCY)";
        //                                            "Source Currency Amount" := -GenJnlLine2."Source Currency Amount";
        //                                            IF ("Currency Code" <> '') AND NOT "System-Created Entry" THEN BEGIN
        //                                              "Source Currency Amount" := Amount;
        //                                              "Source Curr. VAT Base Amount" := "VAT Base Amount";
        //                                              "Source Curr. VAT Amount" := "VAT Amount";
        //                                            END;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..45
        //                                          #47..52
        //                                        END;
        //  
        //                           Target=ExchangeAccounts(PROCEDURE 86) }
        //      { Insertion         ;Target=CreateGLEntry(PROCEDURE 112);
        //                           InsertAfter=GLEntry(Variable 1000);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             InterCompanyBranch@1000000000 : Record "InterCompany Branch Setup";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF UseAmountAddCurr THEN
        //                                            InitGLEntry(GenJnlLine,GLEntry,AccNo,Amount,AmountAddCurr,TRUE,TRUE)
        //                                          ELSE BEGIN
        //                                            InitGLEntry(GenJnlLine,GLEntry,AccNo,Amount,0,FALSE,TRUE);
        //                                            GLEntry."Additional-Currency Amount" := AmountAddCurr;
        //                                          END;
        //                                          InsertGLEntry(GenJnlLine,GLEntry,TRUE);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..6
        //  
        //                                          // iCepts WRW 05.10.16 - RFM8763 Get the Tolerance Branch for the IC Deposit Dimension to Payment Tolerance - Start
        //                                          // iCepts WRW 04.22.16 - RFM8763 Added IC Deposit Dimension to Payment Tolerance - Start
        //                                          IF InterCompanyBranch.GET(GenJnlLine."InterCompany Code") THEN
        //                                            GLEntry."Global Dimension 2 Code" := InterCompanyBranch."Tolerance Branch";
        //                                          // iCepts WRW 04.22.16 - RFM8763 Added IC Deposit Dimension to Payment Tolerance - End
        //                                          // iCepts WRW 05.10.16 - RFM8763 Get the Tolerance Branch for the IC Deposit Dimension to Payment Tolerance - End
        //  
        //                                          InsertGLEntry(GenJnlLine,GLEntry,TRUE);
        //                                        END;
        //  
        //                           Target=CreateGLEntry(PROCEDURE 112) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF OldCVLedgEntryBuf2.GETFILTER(Positive) <> '' THEN BEGIN
        //                                            IF OldCVLedgEntryBuf2."Amount to Apply" <> 0 THEN BEGIN
        //                                              IF (PaymentToleranceMgt.CheckCalcPmtDisc(NewCVLedgEntryBuf,OldCVLedgEntryBuf2,ApplnRoundingPrecision,FALSE,FALSE) AND
        //                                          #4..9
        //                                            END ELSE
        //                                              AppliedAmount := -OldCVLedgEntryBuf2."Remaining Amount";
        //                                          END ELSE BEGIN
        //                                            IF OldCVLedgEntryBuf2."Amount to Apply" <> 0 THEN
        //                                              IF (PaymentToleranceMgt.CheckCalcPmtDisc(NewCVLedgEntryBuf,OldCVLedgEntryBuf2,ApplnRoundingPrecision,FALSE,FALSE) AND
        //                                                  (ABS(OldCVLedgEntryBuf2."Amount to Apply") >=
        //                                                   ABS(OldCVLedgEntryBuf2."Remaining Amount" - OldCVLedgEntryBuf2."Remaining Pmt. Disc. Possible")) AND
        //                                          #17..23
        //                                                AppliedAmount := -OldCVLedgEntryBuf2."Remaining Amount";
        //                                                OldCVLedgEntryBuf."Accepted Pmt. Disc. Tolerance" := FALSE;
        //                                              END ELSE
        //                                                AppliedAmount := GetAppliedAmountFromBuffers(NewCVLedgEntryBuf,OldCVLedgEntryBuf2)
        //                                            ELSE
        //                                              AppliedAmount := ABSMin(NewCVLedgEntryBuf."Remaining Amount",-OldCVLedgEntryBuf2."Remaining Amount");
        //                                          END;
        //  
        //                                          #32..54
        //                                              // Post the realized gain or loss on the OldCVLedgEntryBuf
        //                                              AppliedAmountLCY := ROUND(AppliedAmount / NewCVLedgEntryBuf."Original Currency Factor");
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..12
        //                                            IF OldCVLedgEntryBuf2."Amount to Apply" <> 0 THEN BEGIN
        //                                          #14..26
        //                                                AppliedAmount := ABSMin(NewCVLedgEntryBuf."Remaining Amount",-OldCVLedgEntryBuf2."Amount to Apply");
        //                                            END ELSE
        //                                          #29..57
        //                                        END;
        //  
        //                           Target=FindAmtForAppln(PROCEDURE 6) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF GenJnlLine."Account Type" <> GenJnlLine."Account Type"::Customer THEN
        //                                            EXIT;
        //  
        //                                          #4..27
        //                                                PostDtldCustLedgEntry(GenJnlLine,DtldCVLedgEntryBuf,CustPostingGr,AdjAmount);
        //                                            UNTIL DtldCVLedgEntryBuf.NEXT = 0;
        //                                          END;
        //  
        //                                          CreateGLEntriesForTotalAmounts(
        //                                            GenJnlLine,TempInvPostBuf,AdjAmount,SaveEntryNo,CustPostingGr.GetReceivablesAccount,LedgEntryInserted);
        //  
        //                                          DtldLedgEntryInserted := NOT DtldCVLedgEntryBuf.ISEMPTY;
        //                                          DtldCVLedgEntryBuf.DELETEALL;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..30
        //                                          //// iCepts CJB 08.19.19 - Fix from Microsoft dealing with duplicate g/l entry no. after a service invoice post of zero. - BEGIN
        //                                          //CreateGLEntriesForTotalAmountsApply(
        //                                            //GenJnlLine,TempInvPostBuf,AdjAmount,SaveEntryNo,CustPostingGr.GetReceivablesAccount);
        //                                          CreateGLEntriesForTotalAmounts(
        //                                            GenJnlLine,TempInvPostBuf,AdjAmount,SaveEntryNo,CustPostingGr.GetReceivablesAccount,LedgEntryInserted);
        //                                          //// iCepts CJB 08.19.19 - Fix from Microsoft dealing with duplicate g/l entry no. after a service invoice post of zero. - END
        //                                          #34..36
        //                                        END;
        //  
        //                           Target=PostDtldCustLedgEntries(PROCEDURE 46) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF GenJnlLine."Account Type" <> GenJnlLine."Account Type"::Vendor THEN
        //                                            EXIT;
        //  
        //                                          #4..27
        //                                                PostDtldVendLedgEntry(GenJnlLine,DtldCVLedgEntryBuf,VendPostingGr,AdjAmount);
        //                                            UNTIL DtldCVLedgEntryBuf.NEXT = 0;
        //                                          END;
        //  
        //                                          CreateGLEntriesForTotalAmounts(
        //                                            GenJnlLine,TempInvPostBuf,AdjAmount,SaveEntryNo,VendPostingGr.GetPayablesAccount,LedgEntryInserted);
        //  
        //                                          DtldLedgEntryInserted := NOT DtldCVLedgEntryBuf.ISEMPTY;
        //                                          DtldCVLedgEntryBuf.DELETEALL;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..30
        //                                          //// iCepts CJB 08.19.19 - Fix from Microsoft dealing with duplicate g/l entry no. after a service invoice post of zero. - BEGIN
        //                                          //CreateGLEntriesForTotalAmountsApply(
        //                                            //GenJnlLine,TempInvPostBuf,AdjAmount,SaveEntryNo,VendPostingGr.GetPayablesAccount);
        //                                            CreateGLEntriesForTotalAmounts(
        //                                              GenJnlLine,TempInvPostBuf,AdjAmount,SaveEntryNo,VendPostingGr.GetPayablesAccount,LedgEntryInserted);
        //                                          //// iCepts CJB 08.19.19 - Fix from Microsoft dealing with duplicate g/l entry no. after a service invoice post of zero. - END
        //                                          #34..36
        //                                        END;
        //  
        //                           Target=PostDtldVendLedgEntries(PROCEDURE 32) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          TempVATEntryNo := 1;
        //                                          VATEntry.SETCURRENTKEY(Type,"Bill-to/Pay-to No.","Transaction No.");
        //                                          VATEntry.SETRANGE(Type,VATEntryType);
        //                                          #4..37
        //                                                  VATEntry2.INSERT;
        //                                                  IF VATEntry2."Unrealized VAT Entry No." = 0 THEN
        //                                                    GLEntryVATEntryLink.InsertLink(NextEntryNo,VATEntry2."Entry No.");
        //                                                  TempVATEntry.DELETE;
        //                                                  IncrNextVATEntryNo;
        //                                                END;
        //  
        //                                          #45..57
        //                                              END;
        //                                            UNTIL VATEntry.NEXT = 0;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..40
        //                                          #42..60
        //                                        END;
        //  
        //                           Target=PostUnapply(PROCEDURE 101) }
        //      { Deletion          ;Target=ABSMax(PROCEDURE 124);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             PROCEDURE ABSMax@124(Decimal1@1000 : Decimal;Decimal2@1001 : Decimal) : Decimal;
        //                             BEGIN
        //                               IF ABS(Decimal1) > ABS(Decimal2) THEN
        //                                 EXIT(Decimal1);
        //                               EXIT(Decimal2);
        //                             END;
        //  
        //                           }
        //                            }
        //      { Deletion          ;Target=GetAppliedAmountFromBuffers(PROCEDURE 123);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE GetAppliedAmountFromBuffers@123(NewCVLedgEntryBuf@1000 : Record "CV Ledger Entry Buffer";OldCVLedgEntryBuf@1001 : Record "CV Ledger Entry Buffer") : Decimal;
        //                             BEGIN
        //                               IF ((NewCVLedgEntryBuf."Document Type" = NewCVLedgEntryBuf."Document Type"::Payment) AND
        //                                   (OldCVLedgEntryBuf."Document Type" = OldCVLedgEntryBuf."Document Type"::"Credit Memo")) OR
        //                                  ((NewCVLedgEntryBuf."Document Type" = NewCVLedgEntryBuf."Document Type"::Refund) AND
        //                                   (OldCVLedgEntryBuf."Document Type" = OldCVLedgEntryBuf."Document Type"::Invoice)) AND
        //                                  (ABS(NewCVLedgEntryBuf."Remaining Amount") < ABS(OldCVLedgEntryBuf."Amount to Apply"))
        //                               THEN
        //                                 EXIT(ABSMax(NewCVLedgEntryBuf."Remaining Amount",-OldCVLedgEntryBuf."Amount to Apply"));
        //                               EXIT(ABSMin(NewCVLedgEntryBuf."Remaining Amount",-OldCVLedgEntryBuf."Amount to Apply"));
        //                             END;
        //  
        //                           }
        //                            }
        //      { PropertyModification;
        //                           Property=Permissions;
        //                           OriginalValue=TableData "G/L Entry"=imd,
        //                                         TableData "Cust. Ledger Entry"=imd,
        //                                         TableData "Vendor Ledger Entry"=imd,
        //                                         TableData "G/L Register"=imd,
        //                                         TableData "G/L Entry - VAT Entry Link"=rimd,
        //                                         TableData "VAT Entry"=imd,
        //                                         TableData "Bank Account Ledger Entry"=imd,
        //                                         TableData "Check Ledger Entry"=imd,
        //                                         TableData "Detailed Cust. Ledg. Entry"=imd,
        //                                         TableData "Detailed Vendor Ledg. Entry"=imd,
        //                                         TableData "Line Fee Note on Report Hist."=rim,
        //                                         TableData "FA Ledger Entry"=rimd,
        //                                         TableData "FA Register"=imd,
        //                                         TableData "Maintenance Ledger Entry"=rimd;
        //                           ModifiedValue=TableData "G/L Entry"=imd,
        //                                         TableData "Cust. Ledger Entry"=imd,
        //                                         TableData "Vendor Ledger Entry"=imd,
        //                                         TableData "G/L Register"=imd,
        //                                         TableData "G/L Entry - VAT Entry Link"=rimd,
        //                                         TableData "VAT Entry"=imd,
        //                                         TableData "Bank Account Ledger Entry"=imd,
        //                                         TableData "Check Ledger Entry"=imd,
        //                                         TableData "Detailed Cust. Ledg. Entry"=imd,
        //                                         TableData "Detailed Vendor Ledg. Entry"=imd,
        //                                         TableData "FA Ledger Entry"=rimd,
        //                                         TableData "FA Register"=imd,
        //                                         TableData "Maintenance Ledger Entry"=rimd }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW18.00.00.40938,NAVNA8.00.00.40938;
        //                           ModifiedValue=NAVW18.00.00.38798,NAVNA8.00.00.38798,iCepts1.01 }
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

