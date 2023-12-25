{                   Лабораторная работа  N 3
                  Таблица конечных разностей
             Выполнил студент 4 курса группы  Данилов Максим       }
program tabrazn;
const maxn=50;
type
        vec=array [0..maxn] of real;
        tabsub=array[1..maxn,1..maxn] of real;
var
        g,g1,g2           :text;
        name,name1,name2  :string;
        i,j,n             :integer;
        x0,h              :real;
        fr                :tabsub;
        f,x               :vec;

begin
        write('Введите имя входного файла  ');readln(name);
        assign(g,name);
        reset(g);
        n:=0;
        while not eof(g) do begin
                              n:=n+1; if n<=maxn then
                              readln(g,fr[n,1])
                              else exit;
                            end;
        close(g);
        write('Введите имя выходного файла  '); readln(name1);
        assign(g1,name1); rewrite(g1);
        write(g1);
        write('Введите имя текстового файла  '); readln(name2);
        assign(g2,name2); rewrite(g2);
        x0:=0.0; h:=0.1;
        for j:=2 to n do
        for i:=1 to n+1-j do fr[i,j]:=(fr[i+1,j-1]-fr[i,j-1]);
        writeln(g1,n);
        for i:=1 to n do
                      begin
                        writeln(g1);
                        for j:=1 to n+1-i do
                        write(g1,fr[i,j],' ');
                      end;
       writeln(g2,'     Лабораторная работа N 3  ');
       writeln(g2,'   Таблица конечных разностей');
       writeln(g2,'   Выполнил студент 4 курса группы Данилов Максим        ');
       x[1]:=x0;
       for i:=1 to n do  x[i]:=x0+(i-1)*h;
       for i:=1 to 65 do write(g2,'-');
       for i:=1 to n do
                         begin
                         writeln(g2); write(g2,x[i]:4:2,' ');
                         for j:=1 to n+1-i do
      if j<=6 then write(g2,fr[i,j]:9:6,' ');
                         end;
        close(g1);close(g2)
end.
