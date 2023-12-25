{               Лабораторная работа N 2
                 Метод деления пополам
       Выполнил студент 4 курса группы кфа Данилов Максим           }
Program mdp;
var
          name:string;
             g:text;
      a,b,x0,e:real;
           i,k:integer;
function f(x:real):real;
begin
        f:=(x-1)*(x-1)-0.5*exp(x)
end;
function sgn(x:real):integer;
begin
        sgn:=0;
        if x<0 then sgn:=-1;
        if x>0 then sgn:=1;
end;
Procedure delp(var    a,b   :real;
                 var    k   :integer;
                  var x,e:real);

var
        i:integer;
        r:real;
begin
        k:=0;
        i:=sgn(f(a));
        while b-a>e do begin
                         k:=k+1;
                         x:=(a+b)*0.5;
                         r:=f(x);
                         if f(x)=0   then exit;
                         if sgn(r)*i<>1 then b:=x
                                        else a:=x;
                       end
end;
begin
       write('Введите концы отрезка a, b  '); readln(a,b);
       write('Введите условие останова e  '); readln(e);
       write('Введите имя файла  '); readln(name);
       assign(g,name);
       rewrite(g);
       writeln(g,'                Лабораторная работа N 2');
       writeln(g,'        Решение уравнения f(x)=(x-1)*(x-1)-0.5*exp(x)');
       writeln(g,'                методом деления пополам');
       writeln(g,'   Выполнил студент 4 курса группы кфа Данилов Максим           ');
       writeln(g);
       writeln(g,'a=  ',a,' b=  ',b,' eps=  ',e);
       writeln(g);
       delp(a,b,k,x0,e);
       writeln('Решение уравнения x0=  ',x0);
       writeln(g,'Решение уравнения x0=  ',x0);
       write('  f(x0)=  ',f(x0));
       writeln(g,'f(x0)=  ',f(x0));
       write('Число итераций k=  ',k);
       writeln(g,'Число итераций k=  ',k);
       close(g)
end.
