/// <summary>
/// PageExtension PurchaPayablesSetupPageExt (ID 50138) extends Record Purchases & Payables Setup.
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