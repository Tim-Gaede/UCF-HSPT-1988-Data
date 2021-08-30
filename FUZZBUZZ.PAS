Var
  Start,
  Stop,
  Incr,
  Curr,
  Number,
  Direct,
  gnum,
  I : Integer;
  Fin,
  Fout : Text;

Procedure NextPerson;
Begin
  Curr := Curr + Direct;
  If Curr < 1 Then Curr := Number;
  If Curr > Number Then Curr := 1;
End;

Procedure FuzzBuzz( I : Integer );
Var
  Count : Integer;
  S     : String[10];
  J     : Integer;
  FuzzedorBuzzed : Boolean;

Begin
  FuzzedorBuzzed := False;
  Count := 0;
  write(fout,'"');
  If (I Mod 5) = 0 Then Begin
    Count := Succ( Count );
    Write( Fout,'Fuzz' );
    FuzzedorBuzzed := True;
  End;
  Str( I,S );
  For J := 1 To Length(S) Do
    If S[J] = '5' Then Begin
      If FuzzedorBuzzed then Write(Fout, ' ');
      Write( Fout,'Fuzz');
      FuzzedorBuzzed := True;
      Count := Succ( Count );
    End;
  If ( I Mod 7 ) = 0 Then Begin
    If FuzzedorBuzzed then Write(Fout, ' ');
    Count := Succ( Count );
    FuzzedorBuzzed := True;
    Write( Fout,'Buzz' );
  End;
  If Count = 0 Then Write( Fout,I );
  WriteLn( Fout,'"' );
  If (Count Mod 2) <> 0 Then Direct := -Direct;
End;


Begin
  Assign( Fin,'FUZZBUZZ.in' );
  Reset( Fin );
  Assign( Fout,'FUZZBUZZ.out' );
  Rewrite( Fout );
  gnum := 1;
  While Not Eof(Fin) Do Begin
    ReadLn( Fin,number,Start,Stop);
    WriteLn( Fout,'Game  ',gnum, ' Start = ',Start,' Stop = ',stop );
    gnum := gnum + 1;
    Curr := 1;
    Direct := 1;
    For I := Start To Stop Do Begin
      Write( Fout,'Player ',Curr:2,' : ' );
      FuzzBuzz( I );
      NextPerson;
    End;
    WriteLn( Fout );
  End;
  Close( Fin );
  Close( Fout );
End.