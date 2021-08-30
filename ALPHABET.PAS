{$C+}
{$U+}
{$R+}

Type
  Str = String[255];

Var
  Alphabet : String[26];
  Fin      : Text;
  Words    : Array[1..50] Of Str;
  I,J      : Integer;
  Temp     : Str;
  NWords   : Integer;

Function StrCmp( S1,S2 : Str ) : Integer;
{
  Returns
    -1 for S1 < S2
     0 for S1 = S2
     1 for S1 > S2
}
Var
  I,L : Integer;
  OK  : Boolean;
Begin
  L := Length( S1 );
  If Length(S2) < L Then L := Length(S2);
  I := 1;
  StrCmp := 0;
  Ok := True;
  While Ok And ( I <= L ) Do Begin
    If S1[I] = S2[I]
      Then I := I + 1
      Else Begin
        Ok := False;
        If Pos( S1[I],Alphabet ) < Pos( S2[I],Alphabet )
          Then StrCmp := -1
          Else StrCmp :=  1;
      End;
  End;
  If Ok Then
    If Length(S1) < Length(S2)
      Then StrCmp := -1
    Else If Length(S1) > Length(S2)
      Then StrCmp := 1;
End;

Begin
  Assign( Fin,'ALPHABET.IN' ); Reset( Fin );
  ReadLn( Fin,AlphaBet );
  NWords := 0;
  While Not Eof(Fin) Do Begin
    NWords := Succ(NWords);
    ReadLn( Fin,Words[NWords] );
  End;
  For I := 1 To NWords-1 Do
    For J := 1 To NWords-1 Do Begin
      If StrCmp( Words[J],Words[J+1] ) > 0
        Then Begin
          Temp := Words[J];
          Words[J] := Words[J+1];
          Words[J+1] := Temp;
        End;
      End;
  For I := 1 To NWords Do
    WriteLn( Words[I] );
End.