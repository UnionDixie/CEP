{      Лабораторная работа N 2
      Метод простых итераций
      Выполнил студент 4 курса группы кфа Данилов Максим     }
Program mit;
var
          name:string;
             g:text;
      a,b,x0,e:real;
           i,k:integer;
function f(x:real):real;
begin
        f:=(x-1)*(x-1)-0.5*exp(x)
end;
function f1(x:real):real;
begin
        f1:=x+1.0/2.07*((x-1)*(x-1)-0.5*exp(x))
end;
Procedure iter(var x,e:real;
               var   k:integer);
var
        x1,y:real;
begin
        k:=0;
        x1:=x; y:=f1(x1);
        while abs(x1-y)>e  do begin
                           k:=k+1;
                           if f(x1)=0 then exit;
                           x1:=y;
                           y:=f1(x1); x:=y;
                           if abs(y-x1)<e then exit;
                              end
end;
begin
       write('Введите начальное приближение x0  '); readln(x0);
       write('Введите условие останова e  '); readln(e);
       write('Введите имя файла  '); readln(name);
       assign(g,name);
       rewrite(g);
       writeln(g,'      Лабораторная работа N 2 ');
       writeln(g,'Решение уравнения f(x)=(x-1)*(x-1)-0.5*exp(x)');
       writeln(g,'     методом простых итераций');
       writeln(g);
       writeln(g,'Начальное приближение x0=  ',x0,' eps=  ',e);
       writeln(g);
       iter(x0,e,k);
       writeln('Решение уравнения x=  ',x0);
       writeln(g,'Решение уравнения x=  ',x0);
       write('  f(x)=  ',f(x0));
       writeln(g,'f(x)=  ',f(x0));
       write('Число итераций k=  ',k);
       writeln(g,'Число итераций k=  ',k);
       close(g)
end.
