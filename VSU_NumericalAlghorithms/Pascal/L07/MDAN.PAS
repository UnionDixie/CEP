{                          Лабораторная работа N 7
                Решение полной проблемы собственных значений
                             методом Данилевского

      Выполнил студент 4 курса группы              }
program mkryl;

const maxk=15;                               {Максимальный размер
                                                    матрицы}
type sharray=array[1..maxk] of real;
      matr=array[1..maxk] of sharray;


var    name,namevy,namev   :string;
       a,b                 :matr;
       d,s,y               :sharray;
       n,k                 :word;
       rm,rv,t             :text;
       i,j                 :integer;



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
             close(rm);
                writeln(t,'   Лабораторная работа N 7');
                writeln(t);
        writeln(t,'  Решение полной проблемы собственных значений');
        writeln(t,'               методом Данилевского      ');
        writeln(t,'   Выполнил студент 4 курса группы           ');
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
             k:=1; while n>k do
        begin
             for i:=1 to n do d[i]:=-a[n-k+1,i]/a[n-k+1,n-k];
             d[n-k]:=1.0/a[n-k+1,n-k];
             for i:=1 to n do
             for j:=1 to n do  b[i,j]:=a[i,j]+a[i,n-k]*d[j];
             for i:=1 to n do b[i,n-k]:=a[i,n-k]*d[n-k];
             for i:=1 to n do
             begin s[i]:=0.0;
             for j:=1 to n do s[i]:=s[i]+a[n-k+1,j]*b[j,i];
             end;
             for j:=1 to n do b[n-k,j]:=s[j];
             a:=b; k:=k+1
        end;
             writeln(t,'  Матрица в форме Фробениуса');
          for i:=1 to n do
                    begin
                         for j:=1 to n do
                            begin
                            write(t,a[i,j],' ');
                            end;
                         writeln(t)
                    end;
             writeln(t);
             writeln(t,'  Коэффициенты характеристического многочлена');
             y[1]:=1; for i:=1 to n do y[i+1]:=-a[1,i];
                 for i:=1 to n+1 do
                 writeln(t,y[i]);
             writeln(t);
             writeln(rv,n);
             writeln(rv);
             for i:=1 to n+1 do writeln(rv,y[i],' ');
     close(t); close(rv)
End.
