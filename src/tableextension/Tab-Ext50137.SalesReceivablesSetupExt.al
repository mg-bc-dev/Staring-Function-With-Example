/// <summary>
/// TableExtension PurchasesPayablesSetupExt (ID 50137) extends Record Purchases & Payables Setup.
/// </summary>
tableextension 50137 PurchasesPayablesSetupExt extends "Purchases & Payables Setup"
{
    fields
    {
        field(50200; "Hidden Posted Purch. Invoices"; Text[2048])
        {
            Caption = 'Hidden Posted Purch. Invoices';
            DataClassification = CustomerContent;
        }
    }
}