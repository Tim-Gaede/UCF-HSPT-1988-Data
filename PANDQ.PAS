program pandq(input,output);

var
   buffer:string[80];
   p,q,ptr,loop:integer;
   fin,fout:text;

begin
   assign(fin,'PANDQ.IN');
   reset(fin);
   assign(fout,'PANDQ.OUT');
   rewrite(fout);

   while not eof(fin) do
      begin
        ptr:=0;
        while not eoln(fin) do
           begin
              ptr:=ptr+1;
              read(fin,buffer[ptr]);
              if (buffer[ptr]='#') and (ptr>1) then
                 ptr:=ptr-2;
            end;
         readln(fin);
         p:=0;
         q:=0;
         for loop:=1 to ptr do
            begin
               if buffer[loop]='P' then
                  p:=p+1;
               if buffer[loop]='Q' then
                  q:=q+1;
            end;
         writeln(fout,p,' P''s, ',q,' Q''s');
      end;
   close(fin);
   close(fout);
end.
