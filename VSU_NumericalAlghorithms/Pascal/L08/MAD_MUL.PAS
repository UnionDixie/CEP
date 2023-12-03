{                     Лабораторная работа N 8
            Решение системы дифференциальных уравнений
                    методом Адамса-Мултона
            Выполнил студент 4 курса группы          }
Program ad_mul;
const n=2;
const z=24;
type
   vector=array[1..n] of real;
      kof=array[1..4] of real;
    start=array[1..4] of vector;
var
        x,x0,h,eps        :real;
        i,j,m             :word;
        g,g1              :text;
        name,name1        :string;
        ys                :start;
        yc                :vector;
function nr(z,z1:vector):real;
   var i    :word;
       q    :real;
   begin
         q:=0; for i:=1 to n do
         if abs(z1[i]-z[i])>=q then q:=abs(z1[i]-z[i]);
         nr:=q
   end;
Procedure f(x:real;y:vector;var yf:vector);
   begin
       yf[1]:=y[2];
       yf[2]:=exp(-x*y[1]);
   end;
Procedure ad_mult(x0,h,eps:real;ys:start;var yc:vector);
var
   i,j        :word;
   yt         :start;
   yp,y       :vector;
   ka_b,ka_m  :kof;
   x          :real;
begin
    for j:=1 to 4 do f(x0+(j-1)*h,ys[j],yt[j]);
    yp:=ys[4];
    ka_b[1]:=-9/z; ka_b[2]:=37/z; ka_b[3]:=-59/z; ka_b[4]:=55/z;
    ka_m[1]:=1/z;  ka_m[2]:=-5/z; ka_m[3]:=19/z;  ka_m[4]:=9/z;
    for i:=1 to n do
    for j:=1 to 4 do
    yp[i]:=yp[i]+h*yt[j,i]*ka_b[j];
    for j:=1 to 3 do yt[j]:=yt[j+1];
    f(x0+4*h,yp,yt[4]);
    yc:=ys[4];
    for i:=1 to n do
    for j:=1 to 4 do
    yc[i]:=yc[i]+h*yt[j,i]*ka_m[j];
       while nr(yp,yc)>=eps do
                begin yp:=yc; y:=ys[4];
                f(x0+4*h,yc,yt[4]);
                for i:=1 to n do
                for j:=1 to 4 do
                y[i]:=y[i]+h*yt[j,i]*ka_m[j];
                yc:=y
                end
end;
begin
       write('Введите имя стартового файла  '); readln(name);
       write('Введите имя выходного файла  '); readln(name1);
       assign(g,name); assign(g1,name1);
       reset(g); rewrite(g1);
       readln(g,x0,h); x:=x0;
       for j:=1 to 4 do
       for i:=1 to n do read(g,ys[j,i]);
       write('Введите условие останова коррекции eps ');
       readln(eps);
       writeln(g1, '         Лабораторная работа N 8');
       writeln(g1, 'Решение системы дифференциальных уравнений');
       writeln(g1, '         методом Адамса-Мултона');
       writeln(g1, 'Выполнил студент 4 курса группы           ');
       writeln(g1);
       writeln(g1,'Шаг    ',h);
       writeln(g1);
       writeln(g1,'Стартовые значения решения системы');
       for j:=1 to 4 do
         begin
          writeln(g1,'x = ',x,'  y1= ',ys[j,1],'  y2= ',ys[j,2]);
          x:=x+h; writeln(g1);
         end;
       writeln(g1);
       write('  Введите общее число шагов m  '); readln(m);
   writeln(g1,' Решение системы методом Адамса-Мултона четвертого порядка');
       writeln(g1);
       for j:=4 to m do
                      begin
                 ad_mult(x0,h,eps,ys,yc);
                 writeln(g1,'x = ',x0+4*h,'  y1= ',yc[1],'  y2= ',yc[2]);
                 writeln(g1);
                 x0:=x0+h; for i:=1 to 3 do ys[i]:=ys[i+1];
                 ys[4]:=yc;
                      end;
       close(g1)
end.


