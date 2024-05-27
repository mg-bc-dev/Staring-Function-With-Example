pageextension 50100 "Order Processo Role Center Ext" extends "Order Processor Role Center"
{
    actions
    {
        addfirst(Action76)
        {
            group("String-Functions")
            {
                action("String-Function")
                {
                    ApplicationArea = All;
                    Caption = 'MaxStrLen Method';
                    RunObject = codeunit "String-Functions";
                }
            }
        }
    }
}
