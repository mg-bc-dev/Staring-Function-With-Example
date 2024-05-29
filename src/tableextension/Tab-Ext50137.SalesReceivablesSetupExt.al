/// <summary>
/// TableExtension SalesReceivablesSetupExt (ID 50137) extends Record Sales & Receivables Setup.
/// </summary>
tableextension 50137 SalesReceivablesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50200; "Hidden Posted Sales Invoices"; Text[2048])
        {
            Caption = 'Hidden Posted Sales Invoices';
            DataClassification = CustomerContent;
        }
    }
}