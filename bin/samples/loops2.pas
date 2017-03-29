program tabla;
uses crt;
var
i,n:integer;
begin
clrscr;
for i:=1 to 10 do
begin
write(´ingrese la tabla de mutliplicar que desea ver: ´);
readln(n);
writeln( i,´ x´,n,´ =´,i*n);
end;
readln;
end.