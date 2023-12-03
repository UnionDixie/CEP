{                  Лабораторная работа N 4
                   Численное интегрирование
                 Формула Гаусса с пятью узлами
        Выполнил студент 4 курса группы КФА Данилов Максим   }
Program prgauss;
type  vec=array[1..5] of real;
var
      a,b,y1,y2,eps     :real;
      g                 :text;
      name              :string;
      n                 :integer;

function f(x:real):real;
   begin
       if x = 0 then f:=0.3 else f:=sin(0.3*x)/x;
   end;
Procedure gauss(a,b:real; var n:integer; var y:real);
var
   i,j         :word;
   h,x,x1      :real;
   ag,xg       :vec;
   z           :real;
   begin
            ag[1]:=0.2369268850; xg[1]:=-0.9061798459;
            ag[2]:=0.4786286705; xg[2]:=-0.5384693101;
            ag[3]:=0.5688888889; xg[3]:=0.0;
            ag[4]:=ag[2]; xg[4]:=-xg[2];
            ag[5]:=ag[1]; xg[5]:=-xg[1];
            h:=(b-a)/n; z:=0; x1:=a+0.5*h;
            for j:=1 to n do
                     begin
                        for i:=1 to 5 do
                        begin x:=x1+0.5*h*xg[i];
                              z:=z+ag[i]*f(x);
                        end;
                        x1:=x1+h
                     end;
            y:=z*0.5*h
   end;
   begin
       write('Введите число частичных отрезков N  '); readln(n);
       {write('Введите концы отрезка интегрирования a,b  '); readln(a,b);}
       a:=0; b:=pi/2;
       write('Введите условие останова eps  '); readln(eps);
  write('Введите имя выходного файла  '); readln(name);
       assign(g,name); rewrite(g);
       writeln(g,'  Лабораторная работа N 4'); writeln(g);
       writeln(g,'          Численное интегрирование');
       writeln(g,'        Формула Гаусса с пятью узлами');
       writeln(g);
       writeln(g,'Выполнил студент 4 курса группы КФА Данилов Максим');
       writeln(g);
       writeln(g,'Стартовое число частичных отрезков  ',n);
       writeln(g,'Условие останова eps = ', eps);
       writeln(g);
       gauss(a,b,n,y1); n:=2*n; gauss(a,b,n,y2);
       while abs(y1-y2)>=eps do
       begin y1:=y2; n:=2*n; gauss(a,b,n,y2) end;
       writeln(g,'Интеграл равен  ',y2); writeln(g);
       writeln(g,'Число частичных отрезков  ',n);
       writeln(g);
       close(g)
end.


