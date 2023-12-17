{          Лабораторная работа N 3
   Интерполяция алгебраическими многочленами
 Интерполяционный естественный кубический сплайн
 Выполнил студент 4 курса группы КФА Алендарь Сергей              }
program intspl;
const maxn=50;
type
        vec=array[0..maxn] of real;
var
        g,g1              :text;
        name,name1        :string;
        i,i0,n            :integer;
        x3,y              :real;
        x,f,a,b,c,d       :vec;

procedure sy(il,ir:integer; a,b,d:vec; var c:vec);
var
        i,j,l   :integer;
        r       :real;
begin
        l:=il+1;
        for i:=l to ir do begin
                           r:=b[i]/d[i-1];
                        d[i]:=d[i]-r*a[i-1];
                        c[i]:=c[i]-r*c[i-1]
                          end;
        c[ir]:=c[ir]/d[ir];
        for i:=l to ir do begin
                           j:=ir-i+il;
                        c[j]:=(c[j]-a[j]*c[j+1])/d[j]
                          end
end;
procedure spl(n:integer; x,f:vec; var x0,y0:real; var i0:integer);
var
        i           :integer;
        r,t         :real;
        a,b,c,d     :vec;
begin
        for i:=1 to n do b[i]:=x[i]-x[i-1];
        for i:=1 to n do if (x[i-1]<x0) and (x0<=x[i]) then i0:=i;
        write('i0= ',i0);
        for i:=1 to n-1 do
        begin
         d[i]:=2*(b[i]+b[i+1]);
         a[i]:=b[i+1];
         c[i]:=6*((f[i+1]-f[i])/b[i+1]-(f[i]-f[i-1])/b[i])
        end;
        sy(1,n-1,a,b,d,c); c[0]:=0; c[n]:=0;
        r:=(x[i0]-x0); t:=(x0-x[i0-1]);
        y0:=(c[i0-1]*r*r*r+c[i0]*t*t*t)/(6*b[i0]);
        y0:=y0+(f[i0-1]/b[i0]-c[i0-1]*b[i0]/6)*r;
        y0:=y0+(f[i0]/b[i0]-c[i0]*b[i0]/6)*t
end;
begin
        write('Введите имя входного файла  ');readln(name);
        assign(g,name); reset(g);
        write('Введите имя выходного файла  '); readln(name1);
        assign(g1,name1); rewrite(g1);
        writeln(g1,'          Лабораторная работа N 3');
        writeln(g1,'   Интерполяция алгебраическими многочленами');
        writeln(g1,'Интерполяционный естественный кубический сплайн');
        writeln(g1,'Выполнил студент 4 курса группы КФА  Алендарь Сергей              ');
        writeln(g1);
        readln(g,n);
        for i:=0 to n do readln(g,x[i],f[i]);
        write('Введите точку x3 '); readln(x3);
        spl(n,x,f,x3,y,i0);
   writeln('x3= ',x3,' f(x3)= ',y);
   writeln(g1,' номер частичного отрезка  ',i0);
   writeln(g1,' x3= ',x3,'  f(x3)= ',y);
   close(g1)
end.
