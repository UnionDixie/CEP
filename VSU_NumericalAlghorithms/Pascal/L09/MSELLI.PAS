program msetellip;
{                  ������ୠ� ࠡ�� N 9
             ��⮤ �⮪ ��� �ࠢ����� ������
             �믮����� ��㤥�⪠ 4 ���� ��㯯� ���
             ����� ����ਭ� ����������   }
const nm=101;
type
       matr=array[0..nm,0..nm] of real;
var
        g1                       :text;
        name                     :string;
        i,j,k,nx,ny              :word;
        m,sx,sy                  :integer;
        a,am,r,t,hx,hy,eps,x,y   :real;
        u                        :matr;

function f1(y:real):real;
begin
      f1:=y*y
end;
function f2(y:real):real;
begin
      f2:=Cos(y)+(2-Cos(1))*y
end;
function f3(x:real):real;
begin
      f3:=x*x*x
end;
function f4(x:real):real;
begin
      f4:=x+1
end;

begin
        write('������ ��� ��室���� 䠩��  '); readln(name);
        assign(g1,name); rewrite(g1);
        writeln(g1,'             ������ୠ� ࠡ�� N 9');
        writeln(g1,'       ��⮤ �⮪ ��� �ࠢ����� ������');
        writeln(g1,' �믮���� ��㤥�� 4 ���� ��㯯�         ');
        writeln(g1);
        write('������ �᫮ 蠣�� �� �� x '); read(nx);
        write('������ �᫮ 蠣�� �� �� y '); read(ny);
        write('������ �᫮��� ��⠭��� eps '); read(eps);
        writeln(g1,'�᫮��� ��⠭��� eps =  ',eps);
        write('������ ���ᨬ��쭮 �����⨬�� �᫮ ���権 m ');
        read(m);
        write('������ 蠣� ���� �� �� x � �� �� y '); readln(sx,sy);
        hx:=1.0/nx; writeln(g1,'��� �� �� x  ',hx);
        hy:=1.0/ny; writeln(g1,'��� �� �� y  ',hy);
        t:=sqr(hx/hy);
        for j:=0 to ny do
        begin y:=j*hy; u[0,j]:=f1(y); u[ny,j]:=f2(y) end;
        for i:=0 to nx do
        begin x:=i*hx; u[i,0]:=f3(x); u[i,nx]:=f4(x) end;
        for i:=1 to nx-1 do
        for j:=1 to ny-1 do u[i,j]:=1.0;
        k:=1;
repeat
        am:=0;
        for i:=1 to nx-1 do
        for j:=1 to ny-1 do
      begin
        a:=0.5*(u[i-1,j]+u[i+1,j]+u[i,j-1]*t+u[i,j+1]*t)/(1+t);
        if abs(a-u[i,j])>=am then am:=abs(a-u[i,j]);
        u[i,j]:=a;
      end;
        r:=am; k:=k+1; if k>m then
begin
        Writeln(g1,'��᫮ ���権 �ॢ�蠥� m=  ',m); close(g1);
        exit;
        end;
        until  r<=eps;
          writeln(g1,'                        ��襭�� �����');
Writeln(g1,'*******************************************************************');
write(g1,  '     y= ');
for j:=0 to ny div sy do begin y:=j*sy*hy; write(g1,y:4:2,'     ') end;
writeln(g1);
Writeln(g1,'x=');
Writeln(g1,'*******************************************************************');
        for i:=0 to nx div sx do
        begin x:=i*sx*hx; write(g1,' ',x:4:2,'* ');
        for j:=0 to ny div sy do write(g1,u[i*sx,j*sy]:7:4,'  ');
        writeln(g1)
        end;
Writeln(g1);
Writeln(g1,'*******************************************************************');
writeln(g1,'��᫮ ���権 k=  ',k);
   close(g1)
end.
