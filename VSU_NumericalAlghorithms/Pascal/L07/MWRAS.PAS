{                          Лабораторная работа N 7
                Решение полной проблемы собственных значений
                             методом вращений

      Выполнил студент 4 курса группы        }
program mwras;

const maxk=15;                               {Максимальный
                                              размер матрицы}
type sharray=array[1..maxk] of real;
      matr=array[1..maxk] of sharray;


var    name,namev   :string;
            a,a1    :matr;
               x    :sharray;
         i0,j0,n    :word;
            rm,t    :text;
           i,j,k    :integer;
      am,c,s,eps    :real;
function sgn(x:real):integer;
begin
        sgn:=0;
        if x<0 then sgn:=-1;
        if x>0 then sgn:=1;
end;
 procedure max(n:word;var a:matr;var i0,j0:word;var am,c,s:real);
  var i,j      :word;
      r        :real;
  begin
      am:=0.0;
      for i:=2 to n do
      for j:=1 to i-1 do if abs(a[i,j])>=abs(am) then
              begin i0:=i; j0:=j; am:=a[i,j] end;
      if a[i0,i0]=a[j0,j0]
      then begin c:=1/sqrt(2.0); s:=c*sgn(am) end
      else begin r:=2*am/(a[i0,i0]-a[j0,j0]);
                 c:=sqrt(0.5*(1+1/sqrt(1+r*r)));
                 s:=sqrt(0.5*(1-1/sqrt(1+r*r)))*sgn(r)
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
             close(rm);
      write(' Введите условие останова eps  '); read(eps);
                writeln(t,'   Лабораторная работа N 7');
                writeln(t);
                writeln(t,'  Решение полной проблемы собственных значений');
                writeln(t,'                 методом вращений            ');
                writeln(t,'   Выполнил студент 4 курса группы          ');
                writeln(t);
                writeln(t,'                  Исходная матрица ');
                    for i:=1 to n do
                    begin
                         for j:=1 to n do
                            begin
                            write(t,a[i,j]:8:5,' ');
                            end;
                         writeln(t)
                    end;
             writeln(t);
             writeln(t,'  Условие останова eps   ',eps);
             writeln(t);
             a1:=a; k:=0;
             max(n,a1,i0,j0,am,c,s);
             while abs(am)>=eps do
         begin
             k:=k+1;
             for i:=1 to n do
      begin
                      begin if i=i0 then
                      a[i,i]:=a1[i0,i0]*c*c+a1[j0,j0]*s*s+2*a1[i0,j0]*c*s;
                      if i=j0 then
                      a[i,i]:=a1[i0,i0]*s*s+a1[j0,j0]*c*c-2*a1[i0,j0]*c*s
                      end;
             for j:=1 to n do
                      begin
                      if (i=i0) and (j=j0) then a[i,j]:=0.0;
                      if (i=j0) and (j=i0) then a[i,j]:=0.0;
                      if (i=i0) and (j<>i0) and (j<>j0) then
                      a[i,j]:=a1[i0,j]*c+a1[j0,j]*s;
                      if (i=j0) and (j<>i0) and (j<>j0) then
                      a[i,j]:=-a1[i0,j]*s+a1[j0,j]*c;
                      if (j=i0) and (i<>i0) and (i<>j0) then
                      a[i,j]:=a1[i,i0]*c+a1[i,j0]*s;
                      if (j=j0) and (i<>i0) and (i<>j0) then
                      a[i,j]:=-a1[i,i0]*s+a1[i,j0]*c
                      end;
     end;
             max(n,a,i0,j0,am,c,s); a1:=a;
             if k>=200 then exit
        end;
             for i:=1 to n do x[i]:=a[i,i];
             writeln(t,'  Собственные значения матрицы');
                 for i:=1 to n do
                 writeln(t,x[i]);
             writeln(t);
             writeln(t,'  Число итераций  ',k);
     close(t);
End.
