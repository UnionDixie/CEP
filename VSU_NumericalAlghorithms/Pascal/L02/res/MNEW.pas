{    Лабораторная работа N 2
        Метод Ньютона
Выполнил студент 4 курса группы кфа Данилов Максим        }
Program mnewt;
var
          name:string;
             g:text;
      a,b,x0,e:real;
           i,k:integer;
function f(x:real):real;
begin
        f:=(x-1)*(x-1)-0.5*exp(x)
end;
function df(x:real):real;
begin
        df:=2*(x-1)-0.5*exp(x)
end;
Procedure newt(var x,e:real;
               var   k:integer);
var
       xp,y:real;
begin
         k:=0;
  repeat
         xp:=x;
         y:=f(xp); k:=k+1;
         if f(xp)=0 then exit;
         if df(xp)=0 then exit;
         x:=xp-y/df(xp); writeln(k,' ',x);
  until abs(x-xp)<e
end;
begin
       write('Введите начальное приближение x0  '); readln(x0);
       write('Введите условие останова e  '); readln(e);
       write('Введите имя файла  '); readln(name);
       assign(g,name);
       rewrite(g);
       writeln(g,'       Лабораторная работа N 2');
       writeln(g,'Решение уравнения f(x)=(x-1)*(x-1)-0.5*exp(x)');
       writeln(g,'          методом Ньютона');
       writeln(g,' Выполнил студент 4 курса группы кфа Данилов Сергей      ');
       writeln(g);
       writeln(g,'Начальное приближение x0=  ',x0,' eps=  ',e);
       writeln(g);
       newt(x0,e,k);
       writeln('Решение уравнения x=  ',x0);
       writeln(g,'Решение уравнения x=  ',x0);
       write('  f(x)=  ',f(x0));
       writeln(g,'f(x)=  ',f(x0));
       write('Число итераций k=  ',k);
       writeln(g,'Число итераций k=  ',k);
       close(g)
end.
