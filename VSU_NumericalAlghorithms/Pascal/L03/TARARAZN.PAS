{                   Лабораторная работа  N 3
                 Таблица разделенных разностей
            Выполнил студент 4 курса группы             }
program tabrazdrazn;
const maxn=50;
type
        vec=array [0..maxn] of real;
        tabsub=array[1..maxn,1..maxn] of real;
var
        g,g1,g2           :text;
        name,name1,name2  :string;
        i,j,n             :integer;
        fr                :tabsub;
        f,x               :vec;
begin
        write('Введите имя входного файла  ');readln(name);
        assign(g,name);
        reset(g);
        readln(g,n);
        if n<=maxn then
        for i:=1 to n do readln(g,x[i],fr[i,1])
        else exit;
        write('Введите имя выходного файла  '); readln(name1);
        assign(g1,name1); rewrite(g1);
        write('Введите имя текстового файла  '); readln(name2);
        assign(g2,name2); rewrite(g2);
        for j:=2 to n do
        for i:=1 to n+1-j do
        fr[i,j]:=(fr[i+1,j-1]-fr[i,j-1])/(x[i+j-1]-x[i]);
        for i:=1 to n do
        begin
            write(g1,x[i]);
            for j:=1 to n+1-i do write(g1,fr[i,j]);
        end;
       writeln(g2,'     Лабораторная работа N 3  ');
       writeln(g2,'  Таблица разделенных разностей');
       writeln(g2,' Выполнил студент 4 курса группы             ');
       for i:=1 to 65 do write(g2,'-');
       for i:=1 to n do
                         begin
                         writeln(g2); write(g2,x[i]:4:2,' ');
                         for j:=1 to n+1-i do
      if j<=6 then write(g2,fr[i,j]:9:6,' ');
                         end;
        close(g1);close(g2)
end.
