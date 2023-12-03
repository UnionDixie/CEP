{                     Лабораторная работа N 8
            Решение системы дифференциальных уравнений
                      методом Адамса-Башфорта
               Выполнил студент 4 курса группы            }
Program ad_bash;
const n=2;
const z=24.0;
type
   vector=array[1..n] of real;
      kof=array[1..4] of real;
    start=array[1..4] of vector;
var
        x0,x,h:real;
       i,j,k,m:integer;
          g,g1:text;
    name,name1:string;
            y0:vector;
            kf:kof;
         ys,yt:start;
Procedure f(x:real; var y,yp:vector);
   begin
       yp[1]:=2/(exp(x+y[2])+exp(-x-y[2]));
       yp[2]:=0.5*(exp(x*x-y[1])-exp(-x*x+y[1]))
   end;
Procedure ad(h:real;var yt:start;var y0:vector);
var
   i,j:integer; kf:kof;
begin
       kf[1]:=-9.0/z; kf[2]:=37.0/z; kf[3]:=-59.0/z; kf[4]:=55.0/z;
       for i:=1 to n do
       for j:=1 to 4 do
       y0[i]:=y0[i]+h*yt[j,i]*kf[j]
end;
begin
       write('Введите имя стартового файла  '); readln(name);
       write('Введите имя выходного файла  '); readln(name1);
       assign(g,name); assign(g1,name1);
       reset(g); rewrite(g1);
       readln(g,x0,h);
       x:=x0;
       for k:=1 to 4 do
       for i:=1 to n do read(g,ys[k,i]);
       for j:=1 to 4 do f(x0+(j-1)*h,ys[j],yt[j]);
       writeln(g1,'          Лабораторная работа N 8');
       writeln(g1,'  Решение системы дифференциальных уравнений');
       writeln(g1,'            методом Адамса-Башфорта');
       writeln(g1,'  Выполнил студент 4 курса группы           ');
       writeln(g1);
       writeln(g1,'Шаг    ',h);
       writeln(g1);
       writeln(g1,'Стартовые значения решения системы');
       writeln(g1);
       for k:=1 to 4 do begin
   writeln(g1,'x = ',x,'  y1= ',ys[k,1],'  y2= ',ys[k,2]);
   x:=x+h;
   writeln(g1)
       end;
       write('  Введите общее число шагов m  '); readln(m);
writeln(g1,'Решение системы методом Адамса-Башфорта четвертого порядка');
       writeln(g1);
       x:=x0+4*h;
       y0:=ys[4];
       for j:=4 to m do
                      begin
                          ad(h,yt,y0);
                          writeln(g1,'x = ',x,'  y1= ',y0[1],'  y2= ',y0[2]);
                          writeln(g1);
                          for i:=1 to 3 do yt[i]:=yt[i+1];
                          f(x,y0,yt[4]);
                          x:=x+h
                      end;
       close(g1)
end.


