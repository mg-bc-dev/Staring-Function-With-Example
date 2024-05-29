/// <summary>
/// PageExtension Posted Sales Invoices Ext (ID 50137) extends Record Posted Sales Invoices.
/// </summary>
pageextension 50137 "Posted Purchase Invoices Ext" extends "Posted Purchase Invoices"
{
    actions
    {
        addbefore("Update Document")
        {
            action(FilterSelected)
            {
                ApplicationArea = All;
                Caption = 'Filter Selected';
                Image = Filter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    CurrPage.Update();
                end;
            }
            action(ResetFilter)
            {
                ApplicationArea = All;
                Caption = 'Reset Filter';
                Image = Filter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset();
                    CurrPage.Update();
                end;
            }
            action(ExclusionFilter)
            {
                ApplicationArea = All;
                Caption = 'Exclusion Filter';
                Image = Filter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PurchInvHdr: Record "Purch. Inv. Header";
                begin
                    Rec.Reset();
                    PurchInvHdr.Reset();
                    CurrPage.SetSelectionFilter(PurchInvHdr);
                    Rec.SetFilter("No.", GetExclusionFilter(PurchInvHdr));
                    CurrPage.Update();
                end;
            }
            action(Hideselected)
            {
                ApplicationArea = All;
                Caption = 'Hide selected';
                Image = Filter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PurchInvoiceHeader: Record "Purch. Inv. Header";
                begin
                    Filter := '';
                    Rec.Reset();
                    PurchInvoiceHeader.Reset();
                    CurrPage.SetSelectionFilter(PurchInvoiceHeader);
                    PurchPayablesSetup.Get();
                    Filter := PurchPayablesSetup."Hidden Posted Purch. Invoices";
                    SetExclusionFilter(PurchInvoiceHeader);
                    Rec.filtergroup(100);
                    Rec.SetFilter("No.", PurchPayablesSetup."Hidden Posted Purch. Invoices");
                    Rec.FilterGroup(0);
                end;
            }
        }

    }

    trigger OnAfterGetRecord()
    begin
        PurchPayablesSetup.Get();
        if PurchPayablesSetup."Hidden Posted Purch. Invoices" <> '' then begin
            Rec.filtergroup(100);
            Rec.SetFilter("No.", PurchPayablesSetup."Hidden Posted Purch. Invoices");
            Rec.FilterGroup(0);
        end;
    end;

    trigger OnOpenPage()
    begin
        PurchPayablesSetup.Get();
        if PurchPayablesSetup."Hidden Posted Purch. Invoices" <> '' then begin
            Rec.filtergroup(100);
            Rec.SetFilter("No.", PurchPayablesSetup."Hidden Posted Purch. Invoices");
            Rec.FilterGroup(0);
        end;
    end;

    var
        PurchPayablesSetup: Record "Purchases & Payables Setup";
        Filter: Text;

    local procedure SetExclusionFilter(var PurchInvHeader: Record "Purch. Inv. Header")
    begin
        if PurchInvHeader.FindSet() then
            repeat
                if Filter = '' then
                    Filter := '<>' + Format(PurchInvHeader."No.")
                else
                    Filter := Filter + '&' + '<>' + Format(PurchInvHeader."No.");
            until PurchInvHeader.Next() = 0;
        if Filter <> '' then begin
            PurchPayablesSetup.Get();
            PurchPayablesSetup."Hidden Posted Purch. Invoices" := Filter;
            PurchPayablesSetup.Modify(true);
        end;
    end;

    local procedure GetExclusionFilter(var PurchInvHeader: Record "Purch. Inv. Header"): Text
    var
        Filter: Text;
    begin
        Filter := '';
        if PurchInvHeader.FindSet() then
            repeat
                if Filter = '' then
                    Filter := '<>' + Format(PurchInvHeader."No.")
                else
                    Filter := Filter + '&' + '<>' + Format(PurchInvHeader."No.");
            until PurchInvHeader.Next() = 0;
        exit(Filter);
    end;
}