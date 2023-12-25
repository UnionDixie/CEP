{    ������ୠ� ࠡ�� N 2
        ��⮤ ���⮭�
�믮���� ��㤥�� 4 ���� ��㯯� �� ������� ���ᨬ        }
Program mnewt;
var
          name:string;
             g:text;
      a,b,x0,e:real;
           i,k:integer;
function f(x:real):real;
begin
        f:=(x-1)*(x-1)-0.5*exp(x)
end;
function df(x:real):real;
begin
        df:=2*(x-1)-0.5*exp(x)
end;
Procedure newt(var x,e:real;
               var   k:integer);
var
       xp,y:real;
begin
         k:=0;
  repeat
         xp:=x;
         y:=f(xp); k:=k+1;
         if f(xp)=0 then exit;
         if df(xp)=0 then exit;
         x:=xp-y/df(xp); writeln(k,' ',x);
  until abs(x-xp)<e
end;
begin
       write('������ ��砫쭮� �ਡ������� x0  '); readln(x0);
       write('������ �᫮��� ��⠭��� e  '); readln(e);
       write('������ ��� 䠩��  '); readln(name);
       assign(g,name);
       rewrite(g);
       writeln(g,'       ������ୠ� ࠡ�� N 2');
       writeln(g,'��襭�� �ࠢ����� f(x)=(x-1)*(x-1)-0.5*exp(x)');
       writeln(g,'          ��⮤�� ���⮭�');
       writeln(g,' �믮���� ��㤥�� 4 ���� ��㯯� �� ������� ��ࣥ�      ');
       writeln(g);
       writeln(g,'��砫쭮� �ਡ������� x0=  ',x0,' eps=  ',e);
       writeln(g);
       newt(x0,e,k);
       writeln('��襭�� �ࠢ����� x=  ',x0);
       writeln(g,'��襭�� �ࠢ����� x=  ',x0);
       write('  f(x)=  ',f(x0));
       writeln(g,'f(x)=  ',f(x0));
       write('��᫮ ���権 k=  ',k);
       writeln(g,'��᫮ ���権 k=  ',k);
       close(g)
end.
