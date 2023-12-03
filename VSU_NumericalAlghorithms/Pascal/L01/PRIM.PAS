{               Лабораторная работа N 1
Пример вычисления функции sin(x) по формуле Тейлора
       Выполнил студент 4 курса группы КФА Данилов Максим }
Program prim;
var
          name:string;
               g:text;
      degree,eps,d,sum,t,x,xsq:real;
             i:integer;
begin
       write('Введите величину угла в градусах  '); readln(degree);
       write('Введите условие останова  eps   '); readln(eps);
       write('Введите имя файла  '); readln(name);
       assign(g,name);
       rewrite(g);
       writeln(g,'                Лабораторная работа N 1');
       writeln(g,'   Пример вычисления f(x)=sin(x) по формуле Тейлора');
       writeln(g,'   Выполнил студент 4 курса группы КФА Данилов Максим');
       writeln(g);
       writeln(g,'Величина угла в градусах   ',degree,'    eps=  ',eps);
       writeln(g);
       x:=degree*pi/180; i:=1;
       writeln(g,'Величина угла в радианах   ',x);
       sum:=x; t:=x; d:=3.0; xsq:=x*x;
       while abs(t)>=eps
       do begin
       t:=-t*xsq/(d*(d-1.0));
       sum:=sum+t;
       d:=d+2; i:=i+1
       end;
       writeln(g,'   Найденное значение функции      ',sum);
       writeln(g,'   Число членов в формуле Тейлора   ',i);
       writeln(g,'   Тестовое значение функции     ',sin(x));
       close(g)
end.
