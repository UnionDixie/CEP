{                          Лабораторная работа N 10
                Решение интегрального уравнения  Фредгольма
                второго рода методом механических квадратур

                Выполнил студент 4 курса группы             }
program mmekw;
const maxk=1001;               {Максимальный размер матрицы}
type sharray=array[1..maxk] of real;
      matr=array[1..maxk] of sharray;


var    name,namevy,namev   :string;
       as                  :matr;
       bs,y                :sharray;
       n                   :word;
       t                   :text;
       i,j                 :integer;
       a,b,h,x,s           :real;
function ak(x,s:real):real;
begin
     ak:=0.3/(pi*(0.64*sqr(cos((x+s)*0.5))-1.0))
end;

function f(x:real):real;
begin
     f:=25-16*sin(-pi+x)*sin(-pi+x)
end;

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
Begin
     write('Введите имя выходного файла  '); readln(name);
     assign(t,name); rewrite(t);
     write('Введите число узлов n  '); read(n); n:=n+1;
{    write('Введите концы отрезка a,b  '); readln(a,b);}
a:=-pi; b:=pi;
        writeln(t,'                Лабораторная работа N 10');
                writeln(t);
        writeln(t,'Решение интегрального уравнения Фредгольма второго рода');
        writeln(t,'          методом механических квадратур      ');
                writeln(t,'Выполнил студент 4 курса группы             ');
                writeln(t);
         h:=(b-a)/(n-1);
         for i:=1 to n do
    begin
         x:=a+(i-1)*h; bs[i]:=f(x);
         for j:=1 to n do
         begin  s:=a+(j-1)*h; as[i,j]:=-h*ak(x,s);
                if (j=1) or (j=n) then as[i,j]:=as[i,j]*0.5;
                if i=j then as[i,j]:=1.0+as[i,j]
         end
    end;
    gauss(n,as,bs); y:=bs;
            writeln(t,' a= ',a,'  b= ',b,'  h= ',h);
            writeln(t);
            writeln(t,'      Решение интегрального уравнения');
                 for i:=1 to n do
                 writeln(t,'x= ',a+(i-1)*h,'    y= ',y[i]);
     close(t)
End.
