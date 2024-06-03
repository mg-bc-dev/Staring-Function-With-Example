/// <summary>
/// Page Staring Function (ID 50137).
/// </summary>
page 50137 "Staring Function"
{
    ApplicationArea = All;
    Caption = 'Staring Function';
    PageType = Card;
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            field(Val1; Val1)
            {
                ApplicationArea = All;

            }
        }
    }


    actions
    {
        area(processing)
        {
            group("String Function")
            {
                Caption = 'String Function';

                action("MaxStrLen & STRLEN Method")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        City: Text[30];
                        MaxLength, Length : Integer;
                        Text000: Label 'The MAXSTRLEN function returns \%1\\Whereas the STRLEN function returns \%2';
                    begin
                        MaxLength := MAXSTRLEN(Val1);
                        Length := STRLEN(Val1);
                        MESSAGE(Text000, MaxLength, Length);
                    end;
                }
                action("PADSTR Function")
                {
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        Str1, Str2 : Text[30];
                        Len1, Len2 : Integer;
                        Text000: Label '13 characters';
                        Text001: Label 'Four';
                        Text002: Label 'Before PADSTR is called:\';
                        Text003: Label '>%1< has the length %2\';
                        Text004: Label '>%3< has the length %4\';
                        Text005: Label 'After PADSTR is called:\';
                    begin
                        Str1 := Text000;
                        Str2 := Text001;
                        Len1 := STRLEN(Str1);
                        Len2 := STRLEN(Str2);
                        MESSAGE(Text002 + Text003 + Text004, Str1, Len1, Str2, Len2);
                        Str1 := PADSTR(Str1, 5); // Truncate the length to 5
                        Str2 := PADSTR(Str2, 15, 'w'); // Concatenate w until length = 15
                        Len1 := STRLEN(Str1);
                        Len2 := STRLEN(Str2);
                        MESSAGE(Text005 + Text003 + Text004, Str1, Len1, Str2, Len2);
                    end;
                }
                action("SELECTSTR Function")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        CommaStr, CommaStr2, SubStr1, SubStr2, SubStr3, SubStr4 : Text[60];
                        Len1, Len2 : Integer;
                        Text000: Label 'This,is a comma,separated,string';
                        Text001: Label 'The calls to SELECTSTR return:\';
                        Text002: Label '11,22,33,,55,,,';
                    begin
                        CommaStr := Text000;
                        CommaStr2 := Text002;
                        SubStr1 := SELECTSTR(2, CommaStr); // Pick out the 2nd substring.
                        SubStr2 := SELECTSTR(4, CommaStr); // Pick out the 4th substring.
                        SubStr3 := SELECTSTR(1, CommaStr2);
                        SubStr4 := SELECTSTR(3, CommaStr2);
                        MESSAGE(Text001 + '>%1<\' + '>%2<\' + '>%3<\' + '>%4<\', SubStr1, SubStr2, SubStr3, SubStr4);
                    end;
                }
                action("StrPos Method")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        String, CommaStr2, SubStr : Text[60];
                        Pos, Pos1, Pos2, Pos3, Pos4 : Integer;
                        Text000: Label 'ABC abc abc xy';
                        Text001: Label 'abc';
                        Text002: Label 'The search for the substring: >%1<\';
                        Text003: Label 'in the string: >%2<,\';
                        Text004: Label 'returns the position: %3';
                    begin
                        String := Text000;
                        SubStr := Text001;
                        Pos := STRPOS(String, SubStr);
                        Pos1 := StrPos('abc', ''); // Returns 0.
                        Pos2 := StrPos('abc', 'c'); // Returns 3.
                        Pos3 := StrPos('abc', 'bc'); // Returns 2.
                        Pos4 := StrPos('abc', 'x'); // Returns 0.
                        MESSAGE(Text002 + Text003 + Text004, SubStr, String, Pos2);
                    end;
                }
                action("STRSUBSTNO Function")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        Str, Str1 : Text[1024];
                        AccountNo: Integer;
                        Balance: Decimal;
                        Text000: Label 'The balance of account %1 is $%2';
                        Text001: Label 'The string before STRSUBSTNO has been called:\%1 \\';
                        Text002: Label 'The string after STRSUBSTNO has been called:\%2';
                    begin
                        // Str := Text000;
                        // AccountNo := 3452;
                        // Balance := 2345 + 5462;
                        // MESSAGE(Text001, Str);
                        // Str := STRSUBSTNO(Str, AccountNo, Balance);
                        // MESSAGE(Text002, Str);

                        Str := Text000;
                        Str1 := Text000;
                        AccountNo := 3452;
                        Balance := 2345 + 5462;
                        Str1 := STRSUBSTNO(Str1, AccountNo, Balance);
                        MESSAGE(Text001 + Text002, Str, Str1);
                    end;
                }
                action("StrCheckSum Method")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        StrNumber, Weight : Text[60];
                        Modulus, CheckSum : Integer;
                        Text000: Label 'The EAN code: %1\';
                        Text001: Label 'has the checksum: %2';

                    begin
                        StrNumber := '4378';
                        Weight := '1234';
                        Modulus := 7;
                        CheckSum := STRCHECKSUM(StrNumber, Weight, Modulus);
                        MESSAGE(Text000 + Text001, StrNumber, CheckSum);

                        StrNumber := '577622135746';
                        Weight := '131313131313';
                        CheckSum := STRCHECKSUM(StrNumber, Weight);
                        MESSAGE(Text000 + Text001, StrNumber, CheckSum);
                    end;
                }
                action("Evaluate Method")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        VarInteger: Integer;
                        VarDate: Date;
                        VarYesNo: Boolean;
                        VarDuration: Duration;
                        Value: Text;
                        Ok1: Boolean;
                        Ok2: Boolean;
                        Ok3: Boolean;
                        Ok4: Boolean;
                        Text000: Label 'VarInteger = %1.\ The return code is: %2.\\';
                        Text001: Label 'VarDate = %3.\ The return code is: %4.\\';
                        Text002: Label 'VarYesNo = %5.\ The return code is: %6.\\';
                        Text003: Label 'VarDuration = %7.\ The return code is: %8.';
                    begin
                        Value := '01011996';
                        Ok1 := Evaluate(VarInteger, Value);
                        Ok2 := Evaluate(VarDate, Value);
                        Ok3 := Evaluate(VarYesNo, Value);
                        Value := '2days 4hours 3.7 seconds 17 milliseconds';
                        Ok4 := Evaluate(VarDuration, Value);
                        Message(Text000 + Text001 + Text002 + Text003, VarInteger, Ok1, VarDate, Ok2, VarYesNo, Ok3, VarDuration, Ok4);
                    end;
                }
                action("Format Method")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        Text000: Label 'Today is %1 \\Format ';
                        Format1: Label '<Closing><Day,2>-<Month,2>-<Year4>';
                        Format2: Label '<Day,2><Month,2><Year4><Closing>D';
                        Format3: Label '<Closing><Year4>-<Month,2>-<Day,2>';
                        Format4: Label '<Closing><Day>. <Month Text> <Year4>';
                        Format5: Label '<Closing><Day,2><Month,2><Year4>';
                        Format6: Label '<Closing><Year4><Month,2><Day,2>';
                        Format7: Label '<Day,2><Filler Character, >. <Month Text,3> <Year4>';
                        Format8: Label '<XML Format>';
                        Text001: Label 'Boolean Test %1';
                        myBoolean: Boolean;
                    begin
                        myBoolean := true;
                        MESSAGE(Text001, FORMAT(myBoolean, 0, '<Number> <Text>'));
                        Message(Text000 + Format1, Format(Today, 0, Format1));
                        Message(Text000 + Format2, Format(Today, 0, Format2));
                        Message(Text000 + Format3, Format(Today, 0, Format3));
                        Message(Text000 + Format4, Format(Today, 0, Format4));
                        Message(Text000 + Format5, Format(Today, 0, Format5));
                        Message(Text000 + Format6, Format(Today, 0, Format6));
                        Message(Text000 + Format7, Format(Today, 0, Format7));
                        Message(Text000 + Format8, Format(Today, 9, Format8));
                    end;
                }
            }
            group("Date Function")
            {
                Caption = 'Date Function';

                action("DATE2DMY")
                {
                    ApplicationArea = All;
                    Caption = 'Day Month Year (DATE2DMY)';

                    trigger OnAction()
                    var
                        InputDate: Date;
                        Day, Month, Year : Integer;
                        Text000: Label 'Today is day %1 of month %2 of the year %3.';
                    begin
                        InputDate := TODAY;
                        Day := DATE2DMY(InputDate, 1);
                        Month := DATE2DMY(InputDate, 2);
                        Year := DATE2DMY(InputDate, 3);
                        MESSAGE(Text000, Day, Month, Year);
                    end;
                }
                action("DATE2DWY")
                {
                    ApplicationArea = All;
                    Caption = 'Day Week Year (DATE2DWY)';

                    trigger OnAction()
                    var
                        InputDate: Date;
                        DayOfWeek, WeekNumber, Year : Integer;
                        Text000: Label 'The date %1 corresponds to:\';
                        Text001: Label 'The day of the week: %2\';
                        Text002: Label 'The week number: %3\';
                        Text003: Label 'The year: %4';
                    begin
                        InputDate := 20140101D;
                        DayOfWeek := DATE2DWY(InputDate, 1);
                        WeekNumber := DATE2DWY(InputDate, 2);
                        Year := DATE2DWY(InputDate, 3);
                        MESSAGE(Text000 + Text001 + Text002 + Text003, InputDate, DayOfWeek, WeekNumber, Year);
                    end;
                }
                action("CALCDATE")
                {
                    ApplicationArea = All;
                    Caption = 'CALCDATE Function(CALCDATE)';

                    trigger OnAction()
                    var
                        Expr1, Expr2, Expr3, Expr4, Expr5, Expr6, Expr7, Expr8 : Text[30];
                        RefDate, Date1, Date2, Date3 : Date;
                        DayOfWeek, WeekNumber, Year : Integer;
                        Text000: Label 'The reference date is: %1 \';
                        Text001: Label 'The expression: %2 returns %3\';
                        Text002: Label 'The expression: %4 returns %5\';
                        Text003: Label 'The expression: %6 returns %7';
                    begin
                        Expr1 := '<CQ+1M-10D>'; // Current quarter + 1 month - 10 days
                        Expr2 := '<-WD2>'; // The last weekday no.2, (last Tuesday)
                        Expr3 := '<CM+30D>'; // Current month + 30 days
                        Expr4 := '<-1M>'; // Last month
                        Expr5 := '<-1Q>'; // Last quarter
                        Expr6 := '<-1Y>'; // Last year
                        Expr7 := '<-1W>'; // Last week

                        RefDate := Today;
                        Date1 := CALCDATE(Expr1, RefDate);
                        Date2 := CALCDATE(Expr2, RefDate);
                        Date3 := CALCDATE(Expr3, RefDate);
                        MESSAGE(Text000 + Text001 + Text002 + Text003,
                          RefDate, Expr1, Date1, Expr2, Date2, Expr3, Date3);
                    end;
                }
                action("Today")
                {
                    ApplicationArea = All;
                    Caption = 'Today';

                    trigger OnAction()
                    var
                        Text000: Label 'The current date is: %1';
                    begin
                        Message(Text000, Today);
                    end;
                }
                action("Date")
                {
                    ApplicationArea = All;
                    Caption = 'Date';

                    trigger OnAction()
                    var
                        Text000: Label 'The current date is: %1';
                    begin
                        Message(Text000, Today);
                    end;
                }
                action("CurrentDateTime")
                {
                    ApplicationArea = All;
                    Caption = 'CurrentDateTime';

                    trigger OnAction()
                    var
                        Day: DateTime;
                        Text000: Label 'The current date is: %1';
                    begin
                        Day := CurrentDateTime;
                        Message(Text000, Day);
                    end;
                }
                action("DT2Date")
                {
                    ApplicationArea = All;
                    Caption = 'DT2Date';

                    trigger OnAction()
                    var
                        Day: Date;
                        Text000: Label 'The current date is: %1';
                    begin
                        Day := DT2Date(CurrentDateTime);
                        Message(Text000, Day);
                    end;
                }
                action("Date Formula")
                {
                    ApplicationArea = All;
                    Caption = 'Date Formula';

                    trigger OnAction()
                    var
                        Expr, Meaning : List of [Text];
                        RefDate: DateTime;
                        Date1, Date2 : Date;
                        myInteger: Integer;
                        myText: Text;
                    begin
                        Clear(myInteger);
                        Expr.AddRange('<CM>', '<-CM>', '<CY>', '<CW>', '<1M>', '<1M+CM>', '<CM+D25>', '<CM+45D>', '<7D>', '<D7>', '<D25>', '<-D10>', '<WD1>', '<WD6>', '<1Q+1M+CM>', '<1Y-CY>', '<CY+1D>', '<CW>', '<1M>', '<-1M>', '<-1Q>', '<-1Y>', '<-1W>', '<1Q>', '<1Y>', '<+1W>');
                        Meaning.AddRange('End of Month', 'Beginning of Month', 'End Of The Current Year', 'End Of This Week [Sunday]', 'Plus 1 Month', 'End of Next Month', 'Day 25th of the following month', '45 Days after End of Month', 'Plus 7 Days', 'The next Day 7th', 'The next Day 25th', 'The previous Day 10th', 'The next Week Day 1: Monday', 'The next Week Day 6 : Saturday', 'Plus 1 Quarter and 1 Month, End of Month', 'Beginning of Next Year', 'Beginning of Next Year', 'End of this week (Sunday)', 'Next month (February 2022 only has 28 days)', 'Last month', 'Last quarter', 'Last year', 'Last week', 'Plus Quarter', 'Plus Year', 'Plus Week');
                        // Message('%1 %2', Expr.Count, Meaning.Count);
                        repeat
                            if myText <> '' then
                                myText += ',\\';
                            myInteger := myInteger + 1;
                            RefDate := CurrentDateTime;
                            Evaluate(Date1, Format(RefDate));
                            Date2 := CALCDATE(Expr.Get(myInteger), Date1);
                            myText += 'The expression: ' + Expr.Get(myInteger) + ' \Returns ' + Format(Date2) + ' Meaning \' + Meaning.Get(myInteger);
                        until Expr.Count = myInteger;
                        Message('Today Date ' + Format(Today) + '\\' + myText + '.');
                    end;
                }
            }
            group("Array functions")
            {
                action(ARRAYLEN)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        SaleAmount1: array[10] of Integer;
                        Length23: Integer;
                    begin
                        Clear(SaleAmount1);
                        Clear(Length23);
                        Length23 := ArrayLen(SaleAmount1);
                        Message('%1', Length23);
                        // Displays : 0

                        SaleAmount1[1] := 1;
                        SaleAmount1[2] := 2;
                        SaleAmount1[3] := 3;
                        SaleAmount1[1] := 10;

                        Length23 := ArrayLen(SaleAmount1);
                        Message('%1', Length23);
                        // Displays : 3
                    end;
                }
                action(COMPRESSARRAY)
                {
                    ApplicationArea = All;
                    Caption = 'COMPRESS ARRAY';

                    trigger OnAction()
                    var
                        ArrayText: array[10] of Text;
                        TotalNoOfElements, TotalNoOfElements1 : Integer;
                        I: Integer;
                        myText: Text;
                    begin
                        ArrayText[1] := 'One';
                        ArrayText[2] := 'Two';
                        ArrayText[3] := '';
                        ArrayText[4] := 'Three';
                        ArrayText[5] := '';
                        ArrayText[6] := 'Six';
                        ArrayText[7] := '';
                        ArrayText[8] := '';
                        ArrayText[9] := 'Nine';
                        ArrayText[10] := 'Ten';
                        TotalNoOfElements := ArrayLen(ArrayText);
                        myText := 'Without Compress Function Use\';
                        for I := 1 to TotalNoOfElements do begin
                            if ArrayText[I] <> '' then begin
                                myText += Format(I) + ' ' + ArrayText[I] + '\';
                            end else begin
                                myText += Format(I) + ' ' + ArrayText[I] + 'Empty\';
                            end;
                        end;
                        // Message(myText);
                        TotalNoOfElements1 := CompressArray(ArrayText);
                        myText += '\\With Compress Function Use\';
                        for I := 1 to TotalNoOfElements do begin
                            if ArrayText[I] <> '' then begin
                                myText += Format(I) + ' ' + ArrayText[I] + '\';
                            end else begin
                                myText += Format(I) + ' ' + ArrayText[I] + 'Empty\';
                            end;
                        end;
                        Message(myText);
                        Message('Totel Number of The Array & Without Using The Compress Function \%1 \\ and Using The Compress Function %2', TotalNoOfElements, TotalNoOfElements1);
                    end;
                }
                action(COPYARRAY)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ArrayText: array[10] of Text;
                        ArrayTwo: array[5] of Text;
                        Length23, I : Integer;
                        myText: Text;
                    begin
                        ArrayText[1] := 'One';
                        ArrayText[2] := 'Two';
                        ArrayText[3] := '';
                        ArrayText[4] := 'Four';
                        ArrayText[5] := '';
                        ArrayText[6] := 'Six';
                        ArrayText[7] := '';
                        ArrayText[8] := '';

                        CopyArray(ArrayTwo, ArrayText, 1, 5);

                        for I := 1 to 5 do begin
                            if ArrayTwo[I] <> '' then begin
                                myText += Format(I) + ' ' + ArrayTwo[I] + '\';
                            end else begin
                                myText += Format(I) + ' ' + ArrayTwo[I] + 'Empty\';
                            end;
                        end;
                        Message(myText);
                    end;
                }
            }
            group("List functions")
            {
                action(List)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TestListAssignment();
                        TestListShallowCopy();
                        TestNestedListDeepCopy();
                        TestNestedListShallowCopy();
                        WorkWithListOfCustomers();
                    end;
                }
                action(Add)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myIntegerList: List of [Integer];
                        myText: Text;
                        myInteger: Integer;
                    begin
                        Clear(myInteger);
                        myIntegerList.Add(5);
                        myIntegerList.Add(2);
                        myIntegerList.Add(3);
                        myIntegerList.Add(1);
                        myIntegerList.Add(4);
                        repeat
                            if myText <> '' then
                                myText += ',';
                            myInteger := myInteger + 1;
                            myText += Format(myIntegerList.Get(myInteger));
                        until myIntegerList.Count = myInteger;
                        Message(myText);
                    end;
                }
                action(Contains)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myIntegerList: List of [Integer];
                        exists: Boolean;
                    begin
                        myIntegerList.Add(5);
                        exists := myIntegerList.Contains(5);
                        Message(Format(exists));
                    end;
                }
                action(Get)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myIntegerList: List of [Integer];
                        myInteger: Integer;
                    begin
                        myIntegerList.Add(5);
                        myIntegerList.Add(2);
                        myIntegerList.Add(1);
                        myIntegerList.Add(5);
                        myInteger := myIntegerList.Get(3);
                        Message(Format(myInteger));
                    end;
                }
                action(Set)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myTextList: List of [Text];
                        myText: Text;
                    begin
                        myTextList.Add('HELLO ');
                        myTextList.Add('DYNAMICS ');
                        myTextList.Add('BUSINESS ');
                        myTextList.Add('CENTRAL');
                        myText := myTextList.Get(2);
                        Message(myText);
                        myTextList.Set(2, 'DYNAMICS 365 ');
                        myText := myTextList.Get(2);
                        Message(myText);
                    end;
                }

                action(Insert)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myTextList: List of [Text];
                        myText: Text;
                    begin
                        myTextList.Add('HELLO ');
                        myTextList.Add('DYNAMICS ');
                        myTextList.Add('BUSINESS ');
                        myTextList.Add('CENTRAL');
                        myText := myTextList.Get(3);
                        Message(myText);
                        myTextList.Insert(3, '365 ');
                        myText := myTextList.Get(3);
                        Message(myText);
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myTextList: List of [Text];
                        myText, myText2 : Text;
                    begin
                        myTextList.Add('HELLO ');
                        myTextList.Add('DYNAMICS ');
                        myTextList.Add('HELLO ');
                        myTextList.Add('CENTRAL');
                        myText := myTextList.Get(1);
                        myText += myTextList.Get(2);
                        myText += myTextList.Get(3);
                        myText += myTextList.Get(4);

                        myTextList.Remove('HELLO ');
                        // if myTextList.Remove('HELLO ') then begin
                        //     Message('HELLO WAS REMOVED');
                        // end;
                        myText2 := myTextList.Get(1);
                        myText2 += myTextList.Get(2);
                        myText2 += myTextList.Get(3);
                        Message('Before %1\After %2 \', myText, myText2);
                    end;
                }
                action(RemoveAt)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myTextList: List of [Text];
                        myText, myText0 : Text;
                    begin
                        myTextList.Add('HELLO ');
                        myTextList.Add('DYNAMICS ');
                        myTextList.Add('BUSINESS ');
                        myTextList.Add('CENTRAL');
                        myText := myTextList.Get(1);
                        myText += myTextList.Get(2);
                        myText += myTextList.Get(3);
                        myText += myTextList.Get(4);
                        if myTextList.RemoveAt(2) then
                            Message('Item at index 2 is removed.');
                        myText0 := myTextList.Get(1);
                        myText0 += myTextList.Get(2);
                        myText0 += myTextList.Get(3);
                        Message('Before\ %1 \after \ %2', myText, myText0);
                    end;
                }
                action(Count)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myTextList: List of [Text];
                        myInteger, i : Integer;
                        myText: Text;
                    begin
                        myTextList.Add('HELLO ');
                        myTextList.Add('DYNAMICS ');
                        myTextList.Add('BUSINESS ');
                        myTextList.Add('CENTRAL');
                        myInteger := myTextList.Count();
                        Message('%1', myTextList.Count());
                        repeat
                            if myText <> '' then
                                myText += ',';
                            i := i + 1;
                            myText += Format(myTextList.Get(i));
                        until myTextList.Count = i;
                        Message(myText);
                    end;
                }
                action(AddRange)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myTextList: List of [Text];
                    begin
                        myTextList.AddRange('HELLO ', 'DYNAMICS 365 ', 'BUSINESS ', 'CENTRAL');
                        Message(Format(myTextList.Count));
                    end;
                }
                action(GetRange)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myTextList: List of [Text];
                        myNewTextList: List of [Text];
                        myText: Text;
                    begin
                        myTextList.AddRange('HELLO ', 'DYNAMICS 365 ', 'BUSINESS ', 'CENTRAL');
                        myNewTextList := myTextList.GetRange(2, 2);
                        myText := Format(myNewTextList.Get(1)) + ', ';
                        myText += Format(myNewTextList.Get(2));
                        Message(myText);
                    end;
                }
                action(RemoveRange)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myTextList: List of [Text];
                        myText, myText0 : Text;
                    begin
                        myTextList.AddRange('HELLO ', 'DYNAMICS 365 ', 'BUSINESS ', 'CENTRAL');
                        myText := Format(myTextList.Get(1));
                        myText += Format(myTextList.Get(2));
                        myText += Format(myTextList.Get(3));
                        myText += Format(myTextList.Get(4));
                        if myTextList.RemoveRange(2, 2) then
                            Message('Items removed.');
                        myText0 := Format(myTextList.Get(1));
                        myText0 += Format(myTextList.Get(2));
                        // myText += Format(myTextList.Get(3));
                        // myText += Format(myTextList.Get(4));
                        Message('%1\ %2', myText, myText0);
                        // myTextList: 'HELLO ', 'CENTRAL'
                    end;
                }
                action(IndexOf)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myIntegerList: List of [Integer];
                        index: Integer;
                    begin
                        myIntegerList.Add(5);
                        myIntegerList.Add(2);
                        myIntegerList.Add(1);
                        myIntegerList.Add(5);
                        index := myIntegerList.IndexOf(5);
                        Message(Format(index));
                    end;
                }
                action(LastIndexOf)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myIntegerList: List of [Integer];
                        index: Integer;

                    begin
                        myIntegerList.Add(5);
                        myIntegerList.Add(2);
                        myIntegerList.Add(1);
                        myIntegerList.Add(5);
                        index := myIntegerList.LastIndexOf(5);
                        Message(Format(index));
                    end;
                }
                action(Reverse)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        myTextList: List of [Text];
                        myText, myText0 : Text;
                        i: Integer;
                    begin
                        myTextList.AddRange('HELLO ', 'DYNAMICS 365 ', 'BUSINESS ', 'CENTRAL');
                        repeat
                            if myText <> '' then
                                myText += ', ';

                            i := i + 1;
                            myText += Format(myTextList.Get(i));
                        until myTextList.Count = i;

                        myTextList.Reverse();
                        Clear(i);
                        repeat
                            if myText0 <> '' then
                                myText0 += ', ';

                            i := i + 1;
                            myText0 += Format(myTextList.Get(i));
                        until myTextList.Count = i;
                        Message('Original \%1 \ Reverse \%2', myText, myText0);
                        // myTextList: 'CENTRAL', 'BUSINESS ', 'DYNAMICS 365 ', 'HELLO '
                    end;
                }
            }
        }
    }

    var
        Val1: Text[30];


    /// <summary>
    /// WorkWithListOfCustomers.
    /// </summary>
    procedure WorkWithListOfCustomers()
    var
        customerNames: List of [Text];
    begin
        // Adding an element to the list
        customerNames.Add('John');

        // Checking if the list contains an element
        if customerNames.Contains('John') then
            Message('John is in the list')
        else
            Message('John is not in the list')
    end;

    local procedure TestListAssignment()
    var
        i: Integer;
        ListNumberOne: List of [Integer];
        ListNumberTwo: List of [Integer];
    begin
        for i := 1 to 20 do
            ListNumberOne.Add(i);

        ListNumberTwo := ListNumberOne;

        ListNumberTwo.Add(21);

        Message('List1 count: %1\List2 count: %2', ListNumberOne.Count(), ListNumberTwo.Count());
    end;

    local procedure TestListShallowCopy()
    var
        i: Integer;
        ListNumberOne: List of [Integer];
        ListNumberTwo: List of [Integer];
    begin
        for i := 1 to 20 do
            ListNumberOne.Add(i);

        ListNumberTwo := ListNumberOne.GetRange(1, ListNumberOne.Count());

        ListNumberTwo.Add(21);

        Message('List1 count: %1\List2 count: %2', ListNumberOne.Count(), ListNumberTwo.Count());
    end;

    local procedure TestNestedListShallowCopy()
    var
        ListNumberOne: List of [List of [Integer]];
        ListNumberTwo: List of [List of [Integer]];
        NestedList: List of [Integer];
        i: Integer;
        k: Integer;
    begin
        //ListNumberOne will contain 25 NestedList, Nested list contain numbers from 6 to 10 (5 in total)
        for k := 6 to 10 do begin
            NestedList.Add(k);
            for i := 1 to 5 do
                ListNumberOne.Add(NestedList);
        end;

        //Shallow copy ListNumberOne to ListNumberTwo
        ListNumberTwo := ListNumberOne.GetRange(1, ListNumberOne.Count());

        //Additional number to Nested List will be displayed in ListNumberOne and ListNumberTwo as well
        NestedList.Add(11);

        //Result is 6 and 6 (6..11), because nested list is updated in previous step (we just check first nested list by index 1)
        Message('NestedList1 count: %1\NestedList2 count: %2',
            ListNumberOne.Get(1).Count(),
            ListNumberTwo.Get(1).Count());
    end;


    local procedure TestNestedListDeepCopy()
    var
        ListNumberOne: List of [List of [Integer]];
        ListNumberTwo: List of [List of [Integer]];
        NestedList: List of [Integer];
        i: Integer;
        k: Integer;
    begin
        //ListNumberOne will contain 25 NestedList, Nested list contain numbers from 6 to 10 (5 in total)
        for k := 6 to 10 do begin
            NestedList.Add(k);
            for i := 1 to 5 do
                ListNumberOne.Add(NestedList);
        end;

        //Deep copy ListNumberOne to ListNumberTwo
        foreach NestedList in ListNumberOne do
            ListNumberTwo.Add(NestedList.GetRange(1, NestedList.Count()));

        //Additional number to Nested List will be displayed in ListNumberOne only
        NestedList.Add(11);

        //Result is 6 and 5 because ListNumberTwo contain a new copy of nested list (it was same reference in shallow copy)
        Message('NestedList1 count: %1\NestedList2 count: %2',
            ListNumberOne.Get(1).Count(),
            ListNumberTwo.Get(1).Count());
    end;
}