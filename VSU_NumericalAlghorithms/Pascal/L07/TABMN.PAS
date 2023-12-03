{              Лабораторная работа N7
            Таблица значений многочлена
         Выполнил студент 4 курса группы          }
Program tabmn;
const nm=15;
type  vec=array[1..nm] of real;
var
      name,namev   :string;
      g,t          :text;
      n,i,m        :word;
      x0,h         :real;
      p            :vec;
function f(x:real):real;
var   z        :vec;
      j        :word;
   begin
       z[1]:=p[1];
       for j:=2 to n+1 do z[j]:=p[j]+z[j-1]*x;
       f:=z[n+1];
   end;
begin
       write('Введите имя входного файла  '); readln(name);
       write('Введите имя выходного файла  '); readln(namev);
       assign(t,name); assign(g,namev);
       reset(t); rewrite(g);
       readln(t,n);
       for i:=1 to n+1 do readln(t,p[i]);
       close(t);
       write('Введите x0, h, m  '); readln(x0,h,m);
       writeln(g,'              Лабораторная работа N7');
       writeln(g,         '  Таблица значений многочлена');
       writeln(g,'  Выполнил студент 4 курса группы             ');
       writeln(g);
       writeln(g,'  Таблица значений многочлена');
       for i:=1 to m do
                      begin
       writeln(g,' x= ',x0,' p[x0]= ',f(x0));
                      x0:=x0+h
                      end;
      close(g)
end.


