{                    ������ୠ� ࠡ�� N 2
           ������ ���祭�� �㭪樨 � �� �ந�������
           �믮���� ��㤥�� 4 ���� ��㯯� �� �������� ��ࣥ�                    }
Program tab0;
const n=3;
type
   vector=array[1..n] of real;
var
      name:string;
         g:text;
       i,m:integer;
      x0,h:real;
         y:vector;
Procedure f(x:real; var y:vector);
   begin
       y[1]:=(x-1)*(x-1)-0.5*exp(x);
       y[2]:=2*(x-1)-0.5*exp(x);
       y[3]:=2-0.5*exp(x)
   end;
begin
       write('������ x0, h, m  '); readln(x0,h,m);
       write('������ ��� 䠩��  '); readln(name);
       assign(g,name);
       rewrite(g);
writeln(g,'             ������ୠ� ࠡ�� N 2');
writeln(g,'������ ���祭�� �㭪樨 f(x)=(x-1)*(x-1)-0.5*exp(x) � �� �ந�������');
       writeln(g,'   �믮���� ��㤥�� 4 ���� ��㯯� �� �������� ��ࣥ�         ');
       writeln(g);
       for i:=1 to m do
                      begin
                      f(x0,y);
writeln(g,'x= ',x0:4:2,' y[1]= ',y[1],' y[2]= ',y[2],' y[3]= ',y[3]);
writeln('  x= ',x0:4:2,' y[1]= ',y[1],' y[2]= ',y[2],' y[3]= ',y[3]);
                      writeln(g);
                      x0:=x0+h
                      end;
      close(g)
end.


