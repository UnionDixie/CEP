program msetpar;
{                  Лабораторная работа N 9
        Метод сеток для уравнения теплопроводности
        Выполнил студент 4 курса группы              }
const nm=1001;
type
        vec=array[1..nm] of real;
var
        g1                :text;
        name              :string;
        i,j,nx,nt,n,m     :word;
        sx,st             :integer;
        t,t1,ht,hx        :real;
        c,u               :vec;

function f(x:real):real;
begin
        if (x-0.5)<=0 then f:=10-20*x else f:=40*x-20
end;
procedure par(hx,ht:real; n:word; var u:vec);
var
        i             :word;
        b,a,z         :real;
        p,q           :vec;
begin
        b:=ht/(hx*hx); a:=1.0+2*b;
        p[1]:=0.0; q[1]:=u[1];
        for i:=2 to n-1 do
            begin
                  z:=1.0/(a-b*p[i-1]);
               p[i]:=b*z;
               q[i]:=(u[i]+b*q[i-1])*z
            end;
        for i:=1 to n-2 do u[n-i]:=q[n-i]+p[n-i]*u[n-i+1]
end;

begin
        write('Введите имя выходного файла  '); readln(name);
        assign(g1,name); rewrite(g1);
        writeln(g1,'             Лабораторная работа N 9');
        writeln(g1,'   Метод сеток для уравнения теплопроводности');
        writeln(g1,' Выполнил студент 4 курса группы'             );
        writeln(g1);
        write('Введите шаг по оси t '); read(ht);
        write('Введите число шагов по оси x '); read(nx);
        write('Введите число шагов по оси t '); read(nt);
        write('Введите шаги печати по оси x и t '); read(sx,st);
        hx:=1.0/nx; n:=nx div sx +1; sx:=sx-1;
        writeln(g1,'Шаг по оси x  ',hx);
        writeln(g1,'Шаг по оси t  ',ht);
        u[1]:=f(0); u[nx+1]:=f(1);
        c[1]:=0; c[nx+1]:=1;
        for i:=2 to nx do begin c[i]:=(i-1)*hx; u[i]:=f((i-1)*hx) end;
        writeln(g1);
        writeln(g1,'                        Решение задачи');
Writeln(g1,'*******************************************************************');
write(g1,  '       *x= ');
for i:=1 to n do write(g1,c[i+(i-1)*sx]:4:2,'      ');
writeln(g1);
Writeln(g1,'*******************************************************************');
        t:=0; t1:=(st-1)*ht;
        writeln(g1);
        write(g1,'t= ',t:4:2,'*');
        for i:=1 to n do write(g1,u[i+(i-1)*sx]:9:4,' ');
        writeln(g1);
        for i:=1 to nt do
begin
        par(hx,ht,nx+1,u); t:=t+ht; if(t-0.00001)>=t1 then
        begin t1:=t1+st*ht; write(g1,'t= ',t:4:2,'*');
              for j:=1 to n do  write(g1,u[j+(j-1)*sx]:9:4,' '); writeln(g1)
        end
end;
Writeln(g1);
Writeln(g1,'*******************************************************************');
   close(g1)
end.
