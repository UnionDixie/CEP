{               ������ୠ� ࠡ�� N 2
                 ��⮤ ������� �������
       �믮���� ��㤥�� 4 ���� ��㯯� �� ������� ���ᨬ           }
Program mdp;
var
          name:string;
             g:text;
      a,b,x0,e:real;
           i,k:integer;
function f(x:real):real;
begin
        f:=(x-1)*(x-1)-0.5*exp(x)
end;
function sgn(x:real):integer;
begin
        sgn:=0;
        if x<0 then sgn:=-1;
        if x>0 then sgn:=1;
end;
Procedure delp(var    a,b   :real;
                 var    k   :integer;
                  var x,e:real);

var
        i:integer;
        r:real;
begin
        k:=0;
        i:=sgn(f(a));
        while b-a>e do begin
                         k:=k+1;
                         x:=(a+b)*0.5;
                         r:=f(x);
                         if f(x)=0   then exit;
                         if sgn(r)*i<>1 then b:=x
                                        else a:=x;
                       end
end;
begin
       write('������ ����� ��१�� a, b  '); readln(a,b);
       write('������ �᫮��� ��⠭��� e  '); readln(e);
       write('������ ��� 䠩��  '); readln(name);
       assign(g,name);
       rewrite(g);
       writeln(g,'                ������ୠ� ࠡ�� N 2');
       writeln(g,'        ��襭�� �ࠢ����� f(x)=(x-1)*(x-1)-0.5*exp(x)');
       writeln(g,'                ��⮤�� ������� �������');
       writeln(g,'   �믮���� ��㤥�� 4 ���� ��㯯� �� ������� ���ᨬ           ');
       writeln(g);
       writeln(g,'a=  ',a,' b=  ',b,' eps=  ',e);
       writeln(g);
       delp(a,b,k,x0,e);
       writeln('��襭�� �ࠢ����� x0=  ',x0);
       writeln(g,'��襭�� �ࠢ����� x0=  ',x0);
       write('  f(x0)=  ',f(x0));
       writeln(g,'f(x0)=  ',f(x0));
       write('��᫮ ���権 k=  ',k);
       writeln(g,'��᫮ ���権 k=  ',k);
       close(g)
end.
