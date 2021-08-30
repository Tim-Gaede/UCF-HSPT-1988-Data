
var m,n : integer;
    i,j : integer;
    fout,infile : text;


begin

  assign(infile,'sumfun.in');
  reset(infile);
  assign(fout,'sumfun.out');
  rewrite(fout);

  while not eof(infile) do begin

    readln(infile,m,n);
    if n mod 2 = 1 then begin

      if m mod n = 0 then begin
        j := m div n - n div 2;
        writeln(fout,'Sequence from ',j,' to ',j+n-1);
      end else writeln(fout,'Not Possible.');

    end else begin

      if (m mod n <> 0) and (m mod (n div 2) = 0) then begin
        j := m div n - n div 2 + 1;
        writeln(fout,'Sequence from ',j,' to ',j+n-1);
      end else writeln(fout,'Not Possible.');

    end;


  end;

  close(fout);

end.