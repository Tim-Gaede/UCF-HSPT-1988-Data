{$C+}
{$U+}
{$R+}


Const
  Splats = '**********************************************************************';

Type
  Str      = String[255];
  PReserved = ^Reserved;
  Reserved = Record
               Word : Str;
               Next : PReserved;
             End;

Var
  Fin,
  Fout : Text;
  Root : PReserved;

Procedure UpStr( Var S : Str );
Var
  I,L : Integer;

Begin
  L := Length(S);
  For I := 1 To L Do
    S[I] := UpCase(S[I]);
End;

Procedure ReadReserved;
Var
  I,N : Integer;
  Temp : PReserved;
  S : Str;

Begin
  Root := Nil;
  ReadLn( Fin,N );
  For I := 1 To N Do Begin
    ReadLn( Fin,S );
    UpStr(S);
    New( Temp );
    Temp^.Word := S;
    Temp^.Next := Root;
    Root := Temp;
  End;
End;

Function IsAlpha( C : Char ) : Boolean;
Begin
  IsAlpha := ( (C >= 'A') And (C <= 'Z') ) Or
             ( (C >= 'a') And (C <= 'z') );
End;

Procedure ProcessWord( S : Str );
Var
  Found : Boolean;
  Temp  : PReserved;
  S2    : Str;

Begin
  S2 := S;
  UpStr(S2);
  Temp := Root;
  Found := False;
  While ( Temp <> Nil ) And Not Found Do Begin
    Found := Temp^.Word = S2;
    If Found Then Write( Fout,Copy(S,1,1),Copy(Splats,1,Length(S)-1) );
    Temp := Temp^.Next;
  End;
  If Not Found Then Write( Fout,S );
End;

Procedure ProcessText;
Var
  C        : Char;
  CurrWord : Str;
  InWord   : Boolean;

Begin
  InWord := False;
  CurrWord := '';
  While Not Eof(Fin) Do Begin
    Read( Fin,C );
    If Not InWord Then Begin
      If IsAlpha(C) Then Begin
        InWord := True;
        CurrWord := '' + C;
      End Else Write( Fout,C );
    End Else Begin
      If Not IsAlpha(C) Then Begin
        InWord := False;
        ProcessWord( CurrWord );
        Write( Fout,C );
        CurrWord := '';
      End Else CurrWord := CurrWord + C;
    End;
  End;
End;

Begin
  Assign( Fin,'CENSORED.IN' ); Reset( Fin );
  Assign( Fout,'CENSORED.OUT' ); Rewrite( Fout );
  ReadReserved;
  ProcessText;
  Close( Fin );
  Close( Fout );
End.