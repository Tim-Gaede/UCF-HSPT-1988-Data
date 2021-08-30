{$C+}
{$U+}
{$R+}

Type
  Ticket = Array[1..6] Of Integer;

Var
  Fin,
  Fout : Text;
  Key,
  Tic : Ticket;
  Cnt : Integer;

Procedure ReadTicket( Var T : Ticket );
Begin
  ReadLn( Fin,T[1],T[2],T[3],T[4],T[5],T[6] );
End;

Procedure ProcessTicket( Key,Tic : Ticket );
Var
  FullMatch,
  SemiMatch : Integer;
  I,J       : Integer;
  Base,
  Bonus : Real;

Begin
  FullMatch := 0;
  SemiMatch := 0;
  For I := 1 To 6 Do
    If Key[I] = Tic[I] Then Begin
      FullMatch := Succ(FullMatch);
      Key[I] := -1;
      Tic[I] := -1;
    End;
  For I := 1 To 6 Do
    For J := 1 To 6 Do
      If (Tic[I] <> -1) And (Key[J] <> -1) And (Tic[I] = Key[J]) Then Begin
        SemiMatch := Succ(SemiMatch);
        Tic[I] := -1;
        Key[J] := -1;
      End;
  Case SemiMatch+FullMatch Of
    6 : Begin
          Base := 5000000.0; Bonus := 1000000.0;
        End;
    5 : Begin
          Base := 500000.0; Bonus := 100000.0;
        End;
    4 : Begin
          Base := 50000.0; Bonus := 10000.0;
        End;
    3 : Begin
          Base := 5000.0; Bonus := 1000.0;
        End;
    2 : Begin
          Base := 500.0; Bonus := 100.0;
        End;
    Else Begin
      Base := 0.0;
      Bonus := 0.0;
    End;
  End;
  Base := Base + FullMatch*Bonus;
  Write( Fout,'Ticket ',Cnt:1,' wins ' );
  If Base = 0.0
    Then WriteLn( Fout,'Nothing' )
    Else WriteLn( Fout,'$ ',Base:1:0 );
End;

Begin
  Assign( Fin,'LOTTERY.IN' ); Reset( Fin );
  Assign( Fout,'LOTTERY.OUT' ); Rewrite( Fout );
  ReadTicket( Key );
  Cnt := 0;
  While Not Eof(Fin) Do Begin
    ReadTicket( Tic );
    Cnt := Succ(Cnt);
    ProcessTicket( Key,Tic );
  End;
  Close( Fin );
  Close( Fout );
End.