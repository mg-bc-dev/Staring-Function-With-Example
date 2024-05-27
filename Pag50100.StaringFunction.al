page 50100 "Staring Function"
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
    }

    var
        Val1: Text[30];
}