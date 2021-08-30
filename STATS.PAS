program stats(input,output);

var
   number,datum,min,max,sum,loop:integer;
   fin,fout:text;

begin
   assign(fin,'STATS.IN');
   reset(fin);
   assign(fout,'STATS.OUT');
   rewrite(fout);
   repeat
      sum:=0;
      min:=maxint;
      max:=-maxint;
      readln(fin,number);
      if number>0 then
         begin
            for loop:=1 to number do
               begin
                  readln(fin,datum);
                  sum:=sum+datum;
                  if datum>max then
                     max:=datum;
                  if datum<min then
                     min:=datum;
               end;
            write(fout,'Sum =',sum:3,', Minimum =',min:3);
            write(fout,', Maximum = ',max:3,', Average =',(sum/number):5:1);
            writeln(fout);
         end;
   until number=0;
   close(fin);
   close(fout);
end.