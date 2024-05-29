/// <summary>
/// Page Values Table (ID 50138).
/// </summary>
page 50138 "Values Table"
{
    ApplicationArea = All;
    Caption = 'Values Table';
    Editable = false;
    PageType = List;
    SourceTable = "Values Table";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Value"; Rec."Value")
                {
                    ToolTip = 'Specifies the value of the Value field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(ArrayFunctionUse)
            {
                ApplicationArea = All;
                Caption = 'Array Function Use';
                Image = "Report";
                Promoted = true;

                trigger OnAction()
                var
                    Cust: Record Customer;
                    SaleAmount1: array[10] of Integer;
                    CustumerCount, I, J, CodeCount : Integer;
                    ValuesTable: Record "Values Table";
                    ArrayofCustomers: array[1000000] of Record Customer;
                    ArrayOfDecimal: array[1, 2, 3, 4, 5, 6, 7, 8, 9] of Decimal;
                    ArrayOfValues: array[5, 9] of Decimal;
                begin
                    ValuesTable.DeleteAll();

                    repeat
                        CustumerCount += 1;
                        ArrayofCustomers[CustumerCount] := Cust;
                    until Cust.Next() = 0;
                    Message('%1\\\\ %2', CustumerCount, ArrayofCustomers[CustumerCount]);

                    for I := 1 to 5 do
                        for J := 1 to 9 do begin
                            ArrayOfValues[I, J] := I * J;
                            ValuesTable.Reset();
                            If ValuesTable.FindLast() then
                                CodeCount := ValuesTable.Code;
                            ValuesTable.Init();
                            ValuesTable.Code := CodeCount + 1;
                            ValuesTable.Description := 'Element [' + Format(I) + ',' + Format(J) + ']';
                            ValuesTable."Value" := ArrayOfValues[I, J];
                            ValuesTable.Insert();
                        end;

                    Message('The count is : %1', ValuesTable.Count);
                end;
            }
        }
    }
}