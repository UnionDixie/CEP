{                          Лабораторная работа N 5
                         Численное дифференцирование
         Построение сходящейся формулы численного дифференцирования

      Выполнил студент 4 курса группы     }
program mdiffl;

const maxk=15;                            {Максимальное число узлов}
type sharray=array[1..maxk] of real;
      matr=array[1..maxk] of sharray;


var    name                :string;
       a,a1                :matr;
       x,b,fs              :sharray;
       k,p,r,s             :word;
       rm,rv,t             :text;
       i,j                 :integer;

procedure gauss(n:word; var a:matr; var x:sharray);         {Решение}
  var i,j,ii,im:word;                                       {системы}
      m,b:real;
  begin
  for i:=1 to n do
    begin
    m:=0;
    for ii:=i to n do
     if abs(a[ii,i])>abs(m) then
       begin m:=a[ii,i]; im:=ii end;
    for j:=i to n do
      begin b:=a[im,j]; a[im,j]:=a[i,j]; a[i,j]:=b/m end;
    b:=x[im]; x[im]:=x[i]; x[i]:=b/m;
    for ii:=i+1 to n do
      begin b:=a[ii,i];
      for j:=i+1 to n do a[ii,j]:=a[ii,j]-b*a[i,j];
      x[ii]:=x[ii]-b*x[i] end
    end;
  for i:=n-1 downto 1 do
    for ii:=i downto 1 do x[ii]:=x[ii]-a[ii,i+1]*x[i+1]
  end; {gauss}

procedure   proverka(n:word;a:matr;x,f:sharray;Var fs:sharray);
{Вычисление невязки}
Var i,j:word;
    summ:real;
    Begin
         for i:=1 to n do
             begin
                   summ:=0 ;
                   for j:=1 to n do
                       summ:=summ+a[i,j]*x[j];
                   fs[i]:=summ-f[i];
              end;
     end;
function vf(k:word):real; {Вещественное значение факториала}
Var  s   :real;
     i   :word;
    Begin
         s:=1;
         for i:=1 to k do s:=s*i;
         vf:=s
    end;

Begin
     write('Введите имя выходного файла  '); readln(name);
     assign(t,name); rewrite(t);
     write('Введите порядок производной k '); read(k);
     write('Введите порядок точности формулы p '); read(p);
     write('Введите число узлов (слева) r '); read(r);
     write('Введите число узлов (справа) s '); read(s);
     if (r+s+1)<>(k+p) then exit;
                writeln(t,'   Лабораторная работа N 5');
                writeln(t);
writeln(t,'               Численное дифференцирование');
writeln(t,'Построение сходящейся формулы численного дифференцирования');
writeln(t,'   Выполнил студент 4 курса группы           ');
                writeln(t);
                writeln(t,' Порядок производной  ',k);
                writeln(t,' Порядок точности формулы  ',p);
                for j:=1 to r+s+1 do a[1,j]:=1;
                for i:=1 to k+p-1 do
                for j:=1 to r+s+1 do a[i+1,j]:=a[i,j]*(j-r-1);
                writeln(t);
                writeln(t,'   Матрица системы');
                    for i:=1 to k+p do
                    begin
                         for j:=1 to r+s+1 do
                            begin
                            write(t,a[i,j]:7:0,' ');
                            end;
                         writeln(t)
                    end;
             writeln(t);
             for j:=1 to k+p do b[j]:=0;
             b[k+1]:=vf(k);
            writeln(t,'  Вектор правой части системы');
            for i:=1 to k+p do writeln(t,b[i]);
            a1:=a; x:=b;
            gauss(k+p,a1,x);
             writeln(t);
writeln(t,'  Коэффициенты формулы численного дифференцирования');
     for i:=1 to k+p do writeln(t,' b[',i-r-1:2,']= ',x[i]);
     writeln(t,'  Невязка');
     proverka(k+p,a,x,b,fs);
                for i:=1 to k+p do writeln(t,fs[i]);
     close(t)
End.
