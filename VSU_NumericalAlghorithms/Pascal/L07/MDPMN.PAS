{         ������ୠ� ࠡ�� N 7
   ��⮤ ������� ������� ��� ���᫥��� ��୥� �����童��
   �믮���� ��㤥�� 4 ���� ��㯯�   }
Program mdpmnog;
const nm=15;
type  vec=array[1..nm] of real;
var
   name,namev      :string;
   g,t             :text;
   p               :vec;
   n               :word;
   a,b,x0,e        :real;
   i,k             :integer;
function f(x:real):real;
        var
           z      :vec;
           i      :integer;
begin
     z[1]:=p[1];
     for i:=2 to n+1 do z[i]:=p[i]+z[i-1]*x;
     f:=z[n+1]
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
       write(' ������ ��� �室���� 䠩�� '); readln(name);
       write(' ������ ��� ��室���� 䠩�� '); readln(namev);
       assign(t,name); assign(g,namev);
       reset(t); rewrite(g);
       readln(t,n); if n>nm then exit;
       for i:=1 to n+1 do readln(t,p[i]);
       write('������ �᫮��� ��⠭��� e  '); readln(e);
       writeln(g,'      ������ୠ� ࠡ�� N 7');
       writeln(g,'     ��⮤ ������� �������');
       writeln(g,' ��� ���᫥��� ��୥� �����童��');
       writeln(g,'   �믮���� ��㤥�� 4 ���� ��㯯�         ');
       writeln(g);
       writeln(g,'    ��୨ �ࠪ�����᪮�� �����童��');
       writeln(g);
       writeln(g,'    �᫮��� ��⠭��� eps= ',e);
       writeln(g);
       for i:=1 to n do
                     begin
       write('������ ����� ��१�� a, b  '); readln(a,b);
       writeln(g,'-----------------------------------------------------');
       writeln(g, '   ����� ��१��');
       writeln(g,'a=  ',a,' b=  ',b);
       writeln(g);
       delp(a,b,k,x0,e);
       writeln(g,'��७� ',i,'  ',x0);
       writeln(g,' ���祭�� �����童��  ',f(x0));
       writeln(g,'��᫮ ���権 k=  ',k);
       writeln(g,'-----------------------------------------------------');
                    end;
       close(g)
end.
