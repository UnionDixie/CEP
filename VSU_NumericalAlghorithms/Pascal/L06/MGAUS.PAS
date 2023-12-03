{                          Лабораторная работа N 6
                  Решение линейной системы методом Гаусcа,

      Выполнил студент 4 курса группы             }
program mgauss;
{$N+}
const maxk=15;                               {Максимальное
                                              число уравненией}
type sharray=array[1..maxk] of extended;
      matr=array[1..maxk] of sharray;


var    name,namev:string;
            a,a1:matr;
          f,x,fs:sharray;
               n:word;
            rm,t:text;
             i,j:integer;

procedure gauss(n:word; var a:matr; var x:sharray);         {Решение}
  var i,j,ii,im:word;                                       {системы}
            m,b:extended;
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

procedure   proverka(a:matr;x,f:sharray;Var fs:sharray); {Вычисление невязки}
Var i,j:word;
    summ:extended;
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
         for i:=1 to n do
             read(rm,f[i]);
             close(rm);
                writeln(t,'   Лабораторная работа N 6');
                writeln(t);
                writeln(t,'  Решение линейной системы методом Гаусса');
                writeln(t,'   Выполнил студент 4 курса группы            ');
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
                    for i:=1 to n do
                    write(t,f[i]:8:5,' ');
             writeln(t);
     x:=f;a1:=a;
     gauss(n,a1,x);
             writeln(t);
             writeln(t,'  Решение системы');
                 for i:=1 to n do
                 writeln(t,x[i]);
             writeln(t);
     writeln(t,'  Невязка');
     proverka(a,x,f,fs);
                for i:=1 to n do
                writeln(t,fs[i]);
     close(t);
End.
