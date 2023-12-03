{                  Лабораторная работа N 3
          Интерполяция алгебраическими многочленами
             Интерполяционные многочлены Ньютона
          Выполнил студент 4 курса группы       }
program internew;
const maxn=50;
type
        tabsub=array[1..maxn,1..maxn] of real;
var
        g,g1              :text;
        name,name1        :string;
        i,j,k,m,n         :integer;
        x1,x2             :real;
        fr                :tabsub;
function newt(m,k:integer; x:real):real;
var
        i      :integer;
        y,z,q :real;
begin
        y:=fr[k,1]; q:=x*10-k+1;
        z:=1;
        for i:=1 to m do begin
                          z:=z*(q-i+1)/i;
                          y:=y+z*fr[k,i+1]
                         end;
        newt:=y
end;
function newt1(m,k:integer; x:real):real;
var
        i      :integer;
        y,z,q :real;
begin
        y:=fr[k,1]; q:=x*10-k+1;
        z:=1;
        for i:=1 to m do begin
                          z:=z*(q+i-1)/i;
                          y:=y+z*fr[k-i,i+1]
                         end;
        newt1:=y
end;

begin
        write('Введите имя входного файла  ');readln(name);
        assign(g,name); reset(g);
        write('Введите имя выходного файла  '); readln(name1);
        assign(g1,name1); rewrite(g1);
        writeln(g1,'          Лабораторная работа N 3');
        writeln(g1,'  Интерполяция алгебраическими многочленами');
        writeln(g1,'     Интерполяционные многочлены Ньютона');
        writeln(g1,'     Выполнил студент 4 курса группы       ');
        readln(g,n);
        for i:=1 to n do
        for j:=1 to n+1-i do read(g,fr[i,j]);
   write('Введите степень интерполяционного многочлена m  ');
   read(m);
        write('Введите точку x1 '); readln(x1);
        write('Введите номер ближайшего узла '); read(k);
   writeln(g1);
   writeln('x1= ',x1,' f(x1)= ',newt(m,k,x1));
   writeln(g1,' x1= ',x1,'  f(x1)= ',newt(m,k,x1));
        write('Введите точку x2 '); readln(x2);
        write('Введите номер ближайшего узла  '); read(k);
   writeln(g1);
   writeln('x2= ',x2,' f(x2)= ',newt1(m,k,x2));
   writeln(g1,' x2= ',x2,'  f(x2)= ',newt1(m,k,x2));
   close(g1)
end.
