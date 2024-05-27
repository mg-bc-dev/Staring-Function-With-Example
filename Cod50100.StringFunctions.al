codeunit 50100 "String-Functions"
{
    trigger OnRun()
    begin
        MaxStrLenMethod();
    end;

    /// <summary>
    /// MaxStrLenMethod.
    /// </summary>
    procedure MaxStrLenMethod()
    var
        City: Text[30];
        MaxLength: Integer;
        Length: Integer;
        TExt001: Label 'The MAXSTRLEN function returns \%1,\\ whereas the STRLEN function returns \%2';
    begin
        City := 'Khambhalia';
        MaxLength := MAXSTRLEN(City);
        Length := STRLEN(City);
        MESSAGE(Text001, MaxLength, Length);
    end;
}
