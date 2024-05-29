/// <summary>
/// PageExtension SalesReceivablesSetupPageExt (ID 50138) extends Record Sales & Receivables Setup.
/// </summary>
pageextension 50138 PurchaPayablesSetupPageExt extends "Purchases & Payables Setup"
{
    layout
    {
        addafter(General)
        {
            field("Hidden Posted Purcha Invoices"; Rec."Hidden Posted Purch. Invoices")
            {
                ApplicationArea = All;
            }
        }
    }
}