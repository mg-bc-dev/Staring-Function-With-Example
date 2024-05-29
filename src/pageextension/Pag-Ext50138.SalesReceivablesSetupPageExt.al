/// <summary>
/// PageExtension SalesReceivablesSetupPageExt (ID 50138) extends Record Sales & Receivables Setup.
/// </summary>
pageextension 50138 SalesReceivablesSetupPageExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Credit Warnings")
        {
            field("Hidden Posted Sales Invoices"; Rec."Hidden Posted Sales Invoices")
            {
                ApplicationArea = All;
            }
        }
    }
}