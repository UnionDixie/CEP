{                          Лабораторная работа N 7
                Решение полной проблемы собственных значений
                               методом Крылова

      Выполнил студент 4 курса группы           }
program mkryl;

const maxk=15;                               {Максимальный размер
                                                    матрицы}
type sharray=array[1..maxk] of real;
      matr=array[1..maxk] of sharray;


var    name,namevy,namev   :string;
       a,a1,a2             :matr;
       f,x,y,b,fs          :sharray;
       n                   :word;
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

procedure   proverka(a:matr;x,f:sharray;Var fs:sharray); {Вычисление невязки}
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
procedure   um(a:matr; var x,y:sharray); {Умножение матрицы на вектор}
Var i,j:word;
    Begin
         for i:=1 to n do
             begin
                   y[i]:=0 ;
                   for j:=1 to n do y[i]:=y[i]+a[i,j]*x[j];
             end;
    end;

Begin
     write('Введите имя входного файла  '); readln(name);
     write('Введите имя выходного файла  '); readln(namevy);
     write('Введите имя текстового файла  '); readln(namev);
     assign(rm,name); assign(rv,namevy); assign(t,namev);
     reset(rm); rewrite(rv); rewrite(t);
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
                writeln(t,'   Лабораторная работа N 7');
        writeln(t);
        writeln(t,'  Решение полной проблемы собственных значений');
        writeln(t,'                 методом Крылова      ');
        writeln(t,'   Выполнил студент 4 курса группы            ');
                writeln(t);
                writeln(t,'   Матрица ');
                    for i:=1 to n do
                    begin
                         for j:=1 to n do
                            begin
                            write(t,a[i,j]:8:5,' ');
                            end;
                         writeln(t)
                    end;
             writeln(t);
             writeln(t,'  Вектор для системы Крылова');
                    for i:=1 to n do
                    write(t,f[i]:8:5,' ');
             writeln(t); writeln(t);
             writeln(t,'  Матрица системы Крылова');
             x:=f; for i:=1 to n do a1[i,n]:=x[i];
             for i:=1 to n-1 do
                          begin um(a,x,y); x:=y;
                          for j:=1 to n do a1[j,n-i]:=y[j]
                          end;
          for i:=1 to n do
                    begin
                         for j:=1 to n do
                            begin
                            write(t,a1[i,j]:8:5,' ');
                            end;
                         writeln(t)
                    end;
             writeln(t);
            writeln(t,'  Вектор правой части системы Крылова');
     um(a,y,x); for i:=1 to n do
                              begin b[i]:=-x[i];
                              writeln(t,b[i])
                              end;
     x:=b; a2:=a1; gauss(n,a2,x);
             writeln(t);
             writeln(t,'  Коэффициенты характеристического многочлена');
             y[1]:=1; for i:=1 to n do y[i+1]:=x[i];
                 for i:=1 to n+1 do
                 writeln(t,y[i]);
             writeln(t);
             writeln(rv,n);
             writeln(rv);
             for i:=1 to n+1 do writeln(rv,y[i],' ');
     writeln(t,'  Невязка');
     proverka(a1,x,b,fs);
                for i:=1 to n do writeln(t,fs[i]);
     close(t); close(rv)
End.
