{                          Лабораторная работа N 6
             Решение линейной системы методом Зейделя

           Выполнил студент 4 курса группы         }
program miter;
{$N+}
const maxk=15;                               {Максимальное
                                              число уравненией}
type sharray=array[1..maxk] of double;
      matr=array[1..maxk] of sharray;


var    name,namev        :string;
       a,a1              :matr;
       x,x0,z,z1,z2,f,fs :sharray;
       n                 :word;
       rm,t              :text;
       i,j,k             :integer;
       eps               :double;
function nr(z,z1:sharray):double;
var i  :word;
    q  :double;
    begin
         q:=0; for i:=1 to n do
         if abs(z1[i]-z[i])>=q then q:=abs(z1[i]-z[i]);
         nr:=q
    end;
 function nz(z1:sharray):double;
var i  :word;
    q  :double;
    begin
         q:=0; for i:=1 to n do
         if abs(z1[i])>=q then q:=abs(z1[i]);
         nz:=q
    end;
procedure   proverka(a:matr;x,f:sharray;Var fs:sharray); {Вычисление невязки}
Var i,j:word;
    summ:double;
    Begin
         for i:=1 to n do
             begin
                   summ:=0 ;
                   for j:=1 to n do
                       summ:=summ+a[i,j]*x[j];
                   fs[i]:=summ-f[i];
              end;
     end;

Begin
     write('Введите имя входного файла  '); readln(name);
     write('Введите имя выходного файла  '); readln(namev);
     assign(rm,name); assign(t,namev);
     reset(rm); rewrite(t);
         readln(rm,n);
         if n>maxk then exit;
         for i:=1 to n do
              begin
                   for j:=1 to n do
                       read(rm,a[i,j])
              end;
         for i:=1 to n do read(rm,f[i]);
         for i:=1 to n do read(rm,x0[i]);
             close(rm);
                writeln(t,'   Лабораторная работа N 6');
                writeln(t);
writeln(t,'  Решение линейной системы методом Зейделя');
writeln(t,'   Выполнил студент 4 курса группы      ');
                writeln(t);
                writeln(t,'   Матрица системы');
                    for i:=1 to n do
                    begin
                         for j:=1 to n do
                            begin
                            write(t,a[i,j]:8:5,' ');
                            end;
                         writeln(t)
                    end;
             writeln(t);
             writeln(t,'  Вектор правой части системы');
                    for i:=1 to n do write(t,f[i]:8:5,' ');
             writeln(t);
             writeln(t,'  Вектор начального приближения');
                    for i:=1 to n do write(t,x0[i]:8:5,' ');
             writeln(t);
                 for i:=1 to n do x[i]:=f[i]/a[i,i];
                 for i:=1 to n do
                 for j:=1 to n do a1[i,j]:=-a[i,j]/a[i,i];
                 for i:=1 to n do a1[i,i]:=0.0;
             writeln('Введите условие останова eps  '); read(eps);
             writeln(t,' Условие останова eps  ',eps);
             writeln(t); z:=x0; z2:=x0; k:=0; z1:=x;
                 for i:=1 to n do
                 begin
                 for j:=1 to n do z1[i]:=z1[i]+a1[i,j]*z2[j];
                 z2[i]:=z1[i]
                 end;
     while nr(z,z1)>eps do
           begin k:=k+1; z:=z1; z2:=z1; z1:=x;
                 for i:=1 to n do
                 begin
                 for j:=1 to n do z1[i]:=z1[i]+a1[i,j]*z2[j];
                 z2[i]:=z1[i]
                 end;
                  proverka(a,z1,f,fs);
                  writeln(t,' k=',k:4,'    норма невязки ',nz(fs));
                 if k>=200 then
           begin
                 writeln(t,'  Решение системы');
                 for i:=1 to n do
                 writeln(t,z1[i]);
             writeln(t);
     writeln(t,'  Число итераций   ',k);
     writeln(t);
     writeln(t,'  Невязка');
     proverka(a,z1,f,fs);
                for i:=1 to n do
                writeln(t,fs[i]);
     close(t);
           end;
           end;
     writeln(t,'  Решение системы');
                 for i:=1 to n do
                 writeln(t,z1[i]);
             writeln(t);
     writeln(t,'  Число итераций   ',k);
     writeln(t);
     writeln(t,'  Невязка');
     proverka(a,z1,f,fs);
                for i:=1 to n do
                writeln(t,fs[i]);
     close(t);
End.
