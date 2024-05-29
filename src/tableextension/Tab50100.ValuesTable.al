table 50138 "Values Table"
{
    Caption = 'Values Table';
    DataClassification = ToBeClassified;
    

    fields
    {
        field(1; "Code"; Integer)
        {
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; "Value"; Decimal)
        {
            Caption = 'Value';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
