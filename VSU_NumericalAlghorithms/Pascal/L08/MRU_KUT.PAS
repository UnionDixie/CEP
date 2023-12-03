{                  Лабораторная работа N 8
             Решение системы дифференциальных уравнений
                       методом Рунге-Кутта
             Выполнил студент 4 курса группы                }
Program rukut;
const n=2;
type
   vector=array[1..n] of real;
var
      x0,x,h,e:real;
         i,j,m:integer;
          g,g1:text;
    name,names:string;
       y0,y,yt:vector;
   k1,k2,k3,k4:vector;
Procedure f(x:real; var y,yp:vector);
   begin
       yp[1]:=y[2];
       yp[2]:=exp(-x*y[1]);
   end;
Function dist(var x,y:vector; n:integer):real;
var
   i:integer;
   d:real;
   begin
       d:=abs(x[1]-y[1]);
                          for i:=2 to n do
             if abs(x[i]-y[i]) >d then d:=abs(x[i]-y[i]);
      dist:=d
   end;
Procedure rung(h:real; var x0:real;var y0:vector; n:integer);
var
   i:integer;
   begin
       f(x0,y0,k1);       for i:=1 to n do yt[i]:=y0[i]+0.5*h*k1[i];
       f(x0+0.5*h,yt,k2); for i:=1 to n do yt[i]:=y0[i]+0.5*h*k2[i];
       f(x0+0.5*h,yt,k3); for i:=1 to n do yt[i]:=y0[i]+h*k3[i];
       f(x0+h,yt,k4);
       x0:=x0+h;
                           for i:=1 to n do
             y0[i]:=y0[i]+(h/6)*(k1[i]+2*k2[i]+2*k3[i]+k4[i])
   end;
Procedure autost(e,x0:real; var h:real;var y0:vector; n:integer);
var
      k,i:integer;
    x1,x2:real;
    y1,y2:vector;
   begin
   repeat
       x1:=x0; y1:=y0;
       x2:=x0; y2:=y0;
       rung(h,x1,y1,n);
       for i:=1 to 2 do rung(0.5*h,x2,y2,n);
       h:=0.5*h;
   until dist(y1,y2,n) <e;
       h:=2*h
   end;
   begin
       write('Введите начальный шаг h  '); readln(h);
       write('Введите начальные условия x0, y0[1],y0[2]  ');
       readln(x0,y0[1],y0[2]);
       write('Введите условие выбора шага eps  '); readln(e);
  write('Введите имя выходного файла  '); readln(name);
  write('Введите имя стартового файла для метода Адамса  '); readln(names);
       assign(g,name); assign(g1,names);
       rewrite(g); rewrite(g1);
       writeln(g,'  Лабораторная работа N 8'); writeln(g);
       writeln(g,'  Решение системы дифференциальных уравнений');
       writeln(g,'             методом Рунге-Кутта            ');
       writeln(g);
       writeln(g,'Выполнил студент 4 курса группы              ');
       writeln(g);
       writeln(g,'Начальный шаг    ',h);
       writeln(g);
       x:=x0; y:=y0;
       autost(e,x,h,y,n);
       writeln(g1,x0,h);
       writeln(g1,y0[1],y0[2]);
       write('Уточненный шаг h ', h);
       write('  Введите число шагов m  '); readln(m);
       writeln(g,'Решение системы дифференциальных уравнений');
       writeln(g,'  методом Рунге-Кутта четвертого порядка   ');
       writeln(g);
       writeln(g,'x = ',x, '  y1= ',y0[1],'  y2= ',y0[2]);
       writeln(g);
       for j:=1 to m do
                      begin
                          rung(h,x0,y0,n); writeln(g1,y0[1],y0[2]);
                          writeln(g,'x = ',x0,'  y1= ',y0[1],'  y2= ',y0[2]);
                          writeln(g);
                      end;
       close(g); close(g1)
end.


