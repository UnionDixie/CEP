{      ������ୠ� ࠡ�� N 2
      ��⮤ ������ ���権
      �믮���� ��㤥�� 4 ���� ��㯯�      }
Program mit;
var
          name:string;
             g:text;
      a,b,x0,e:real;
           i,k:integer;
function f(x:real):real;
begin
        f:=x*x-5.0*sin(x)
end;
function f1(x:real):real;
begin
        f1:=x-1.0/9.0*(x*x-5.0*sin(x))
end;
Procedure iter(var x,e:real;
               var   k:integer);
var
        x1,y:real;
begin
        k:=0;
        x1:=x; y:=f1(x1);
        while abs(x1-y)>e  do begin
                           k:=k+1;
                           if f(x1)=0 then exit;
                           x1:=y;
                           y:=f1(x1); x:=y;
                           if abs(y-x1)<e then exit;
                              end
end;
begin
       write('������ ��砫쭮� �ਡ������� x0  '); readln(x0);
       write('������ �᫮��� ��⠭��� e  '); readln(e);
       write('������ ��� 䠩��  '); readln(name);
       assign(g,name);
       rewrite(g);
       writeln(g,'      ������ୠ� ࠡ�� N 2 ');
       writeln(g,'��襭�� �ࠢ����� f(x)=x*x-5*sin(x)=0');
       writeln(g,'     ��⮤�� ������ ���権');
       writeln(g);
       writeln(g,'��砫쭮� �ਡ������� x0=  ',x0,' eps=  ',e);
       writeln(g);
       iter(x0,e,k);
       writeln('��襭�� �ࠢ����� x=  ',x0);
       writeln(g,'��襭�� �ࠢ����� x=  ',x0);
       write('  f(x)=  ',f(x0));
       writeln(g,'f(x)=  ',f(x0));
       write('��᫮ ���権 k=  ',k);
       writeln(g,'��᫮ ���権 k=  ',k);
       close(g)
end.
