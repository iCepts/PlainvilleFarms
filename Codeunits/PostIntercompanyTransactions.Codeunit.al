codeunit 50120 PostIntercompanyTransactions

    // iCepts WRW 03.01.16 - RFM8650 Automatic Posting of Intercompany Payments
{
    procedure IntercompanyPayments(GenJournalLine: Record "Gen. Journal Line")
    var
        InterCompanyBranch: Record "InterCompany Branch Setup";
        CustLedgEntry: Record "Cust. Ledger Entry";
        TotalAmountApplied: Decimal;
        GenJnlLine3: Record "Gen. Journal Line";
        GenJnlPostLine: Codeunit  "Gen. Jnl.-Post Line";
        Type1: Integer;
        No1: Code[20];
        Type: Integer;
        No2: Code[20];
        Type3: Integer;
        No3: Code[20];
        Type4: Integer;
        No4: Code[20];
        Type5: Integer;
        No5: Code[20];
    begin

        WITH GenJournalLine DO BEGIN
            IF NOT (InterCompanyBranch.GET("InterCompany Code")) THEN
                EXIT;

            TotalAmountApplied := 0;
            CustLedgEntry.INIT;
            CustLedgEntry.SETRANGE("Customer No.", "Account No.");
            CustLedgEntry.SETRANGE("Applies-to ID", "Applies-to ID");
            CustLedgEntry.SETRANGE("Global Dimension 2 Code", "InterCompany Code");

            IF "Applies-to ID" = '' THEN
                TotalAmountApplied := -Amount
            ELSE BEGIN
                IF CustLedgEntry.FIND('-') THEN
                    REPEAT
                        TotalAmountApplied += CustLedgEntry."Amount to Apply";
                    UNTIL CustLedgEntry.NEXT = 0;
                IF TotalAmountApplied = 0 THEN
                    EXIT;
            END;

            GenJnlLine3.INIT;
            GenJnlLine3."Account Type" := InterCompanyBranch."Due To Account Type";
            GenJnlLine3."Account No." := InterCompanyBranch."Due To Account No.";
            GenJnlLine3."Posting Date" := "Posting Date";
            GenJnlLine3."Document No." := "Document No.";
            GenJnlLine3."Currency Code" := "Currency Code";
            GenJnlLine3."Currency Factor" := "Currency Factor";
            GenJnlLine3."Posting Group" := "Posting Group";
            GenJnlLine3."Shortcut Dimension 1 Code" := InterCompanyBranch."Due To Dimension 1 Code";
            GenJnlLine3."Shortcut Dimension 2 Code" := InterCompanyBranch."Due To Dimension 2 Code";
            GenJnlLine3."Dimension Set ID" := CreateDim2(DATABASE::"G/L Account", GenJnlLine3."Account No.");
            GenJnlLine3."Source Code" := "Source Code";
            GenJnlLine3."Reason Code" := InterCompanyBranch."Reason Code";
            GenJnlLine3."Document Date" := "Document Date";
            GenJnlLine3."External Document No." := "External Document No.";
            GenJnlLine3."Source Type" := InterCompanyBranch."Due To Account Type";
            GenJnlLine3."Source No." := InterCompanyBranch."Due To Account No.";
            GenJnlLine3."Source Currency Code" := "Currency Code";
            GenJnlLine3.Description := InterCompanyBranch."Posting Description";
            GenJnlLine3.Amount := -TotalAmountApplied;
            GenJnlLine3."Source Currency Amount" := -TotalAmountApplied;
            GenJnlLine3.VALIDATE(Amount);
            GenJnlLine3."Amount (LCY)" := -TotalAmountApplied;
            GenJnlPostLine.RunWithCheck(GenJnlLine3);

            GenJnlLine3.INIT;
            GenJnlLine3."Account Type" := InterCompanyBranch."Due From Account Type";
            GenJnlLine3."Account No." := InterCompanyBranch."Due From Account No.";
            GenJnlLine3."Posting Date" := "Posting Date";
            GenJnlLine3."Document No." := "Document No.";
            GenJnlLine3."Currency Code" := "Currency Code";
            GenJnlLine3."Currency Factor" := "Currency Factor";
            GenJnlLine3."Posting Group" := "Posting Group";
            GenJnlLine3."Shortcut Dimension 1 Code" := InterCompanyBranch."Due From Dimension 1 Code";
            GenJnlLine3."Shortcut Dimension 2 Code" := InterCompanyBranch."Due From Dimension 2 Code";
            GenJnlLine3."Dimension Set ID" := CreateDim2(DATABASE::"G/L Account", GenJnlLine3."Account No.");
            GenJnlLine3."Source Code" := "Source Code";
            GenJnlLine3."Reason Code" := InterCompanyBranch."Reason Code";
            GenJnlLine3."Document Date" := "Document Date";
            GenJnlLine3."External Document No." := "External Document No.";
            GenJnlLine3."Source Type" := InterCompanyBranch."Due From Account Type";
            GenJnlLine3."Source No." := InterCompanyBranch."Due From Account No.";
            GenJnlLine3."Source Currency Code" := "Currency Code";
            GenJnlLine3.Description := InterCompanyBranch."Posting Description";
            GenJnlLine3.Amount := TotalAmountApplied;
            GenJnlLine3."Source Currency Amount" := TotalAmountApplied;
            GenJnlLine3.VALIDATE(Amount);
            GenJnlLine3."Amount (LCY)" := TotalAmountApplied;
            GenJnlPostLine.RunWithCheck(GenJnlLine3);

        end;
    end;

    LOCAL PROCEDURE CreateDim2(Type1: Integer; No1: Code[20]) DimensionSetID: Integer;
    VAR
        SourceCodeSetup: Record "Source Code Setup";
        TableID: ARRAY[10] OF Integer;
        No: ARRAY[10] OF Code[20];
        ShortcutDimension1Code: Code[20];
        ShortcutDimension2Code: Code[20];
        DimMgt: Codeunit DimensionManagement;
    BEGIN
                                       
                                       SourceCodeSetup.GET;
                                       TableID[1] := Type1;
                                       No[1] := No1;
                                       ShortcutDimension1Code := '';
                                       ShortcutDimension2Code := '';
                                       DimensionSetID :=
                                         DimMgt.GetDefaultDimID(
                                           TableID,No,SourceCodeSetup.Deposits,
                                           ShortcutDimension1Code,ShortcutDimension2Code,0,0);
                                       
    END;
}