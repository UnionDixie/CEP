{         Лабораторная работа N 7
   Метод деления пополам для вычисления корней многочлена
   Выполнил студент 4 курса группы   }
Program mdpmnog;
const nm=15;
type  vec=array[1..nm] of real;
var
   name,namev      :string;
   g,t             :text;
   p               :vec;
   n               :word;
   a,b,x0,e        :real;
   i,k             :integer;
function f(x:real):real;
        var
           z      :vec;
           i      :integer;
begin
     z[1]:=p[1];
     for i:=2 to n+1 do z[i]:=p[i]+z[i-1]*x;
     f:=z[n+1]
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
       write(' Введите имя входного файла '); readln(name);
       write(' Введите имя выходного файла '); readln(namev);
       assign(t,name); assign(g,namev);
       reset(t); rewrite(g);
       readln(t,n); if n>nm then exit;
       for i:=1 to n+1 do readln(t,p[i]);
       write('Введите условие останова e  '); readln(e);
       writeln(g,'      Лабораторная работа N 7');
       writeln(g,'     Метод деления пополам');
       writeln(g,' для вычисления корней многочлена');
       writeln(g,'   Выполнил студент 4 курса группы         ');
       writeln(g);
       writeln(g,'    Корни характеристического многочлена');
       writeln(g);
       writeln(g,'    Условие останова eps= ',e);
       writeln(g);
       for i:=1 to n do
                     begin
       write('Введите концы отрезка a, b  '); readln(a,b);
       writeln(g,'-----------------------------------------------------');
       writeln(g, '   Концы отрезка');
       writeln(g,'a=  ',a,' b=  ',b);
       writeln(g);
       delp(a,b,k,x0,e);
       writeln(g,'Корень ',i,'  ',x0);
       writeln(g,' Значение многочлена  ',f(x0));
       writeln(g,'Число итераций k=  ',k);
       writeln(g,'-----------------------------------------------------');
                    end;
       close(g)
end.
