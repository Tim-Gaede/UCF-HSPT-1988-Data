{$C+}
{$U+}
{$R+}

Var
  Fin,
  Fout : Text;
  N    : Integer;

Procedure Perfecto( N : Integer );
Var
  I,
  Total : Integer;
Begin
  Total := 0;
  For I := 1 To N Div 2 Do
    If (N Mod I) = 0
      Then Total := Total + I;

  If Total = N
    Then WriteLn( Fout,N:1,' is Perfect' )
    Else If Total > N
      Then WriteLn( Fout,N:1,' is Abundant' )
      Else WriteLn( Fout,N:1,' is Defective' );
End;

Begin
  Assign( Fin,'PERFECT.IN' ); Reset( Fin );
  Assign( Fout,'PERFECT.OUT' ); Rewrite( Fout );
  While Not Eof( Fin ) Do Begin
    ReadLn( Fin,N );
    Perfecto( N );
  End;
  Close( Fin );
  Close( Fout );
End.