{                          ������ୠ� ࠡ�� N 7
                ��襭�� ������ �஡���� ᮡ�⢥���� ���祭��
                             ��⮤�� �������᪮��

      �믮���� ��㤥�� 4 ���� ��㯯�              }
program mkryl;

const maxk=15;                               {���ᨬ���� ࠧ���
                                                    ������}
type sharray=array[1..maxk] of real;
      matr=array[1..maxk] of sharray;


var    name,namevy,namev   :string;
       a,b                 :matr;
       d,s,y               :sharray;
       n,k                 :word;
       rm,rv,t             :text;
       i,j                 :integer;



Begin
     write('������ ��� �室���� 䠩��  '); readln(name);
     write('������ ��� ��室���� 䠩��  '); readln(namevy);
     write('������ ��� ⥪�⮢��� 䠩��  '); readln(namev);
     assign(rm,name); assign(rv,namevy); assign(t,namev);
     reset(rm); rewrite(rv); rewrite(t);
         readln(rm,n);
         if n>maxk then exit;
         for i:=1 to n do
              begin
                   for j:=1 to n do
                       read(rm,a[i,j])
              end;
             close(rm);
                writeln(t,'   ������ୠ� ࠡ�� N 7');
                writeln(t);
        writeln(t,'  ��襭�� ������ �஡���� ᮡ�⢥���� ���祭��');
        writeln(t,'               ��⮤�� �������᪮��      ');
        writeln(t,'   �믮���� ��㤥�� 4 ���� ��㯯�           ');
                writeln(t);
                writeln(t,'   ����� ');
                    for i:=1 to n do
                    begin
                         for j:=1 to n do
                            begin
                            write(t,a[i,j]:8:5,' ');
                            end;
                         writeln(t)
                    end;
             writeln(t);
             k:=1; while n>k do
        begin
             for i:=1 to n do d[i]:=-a[n-k+1,i]/a[n-k+1,n-k];
             d[n-k]:=1.0/a[n-k+1,n-k];
             for i:=1 to n do
             for j:=1 to n do  b[i,j]:=a[i,j]+a[i,n-k]*d[j];
             for i:=1 to n do b[i,n-k]:=a[i,n-k]*d[n-k];
             for i:=1 to n do
             begin s[i]:=0.0;
             for j:=1 to n do s[i]:=s[i]+a[n-k+1,j]*b[j,i];
             end;
             for j:=1 to n do b[n-k,j]:=s[j];
             a:=b; k:=k+1
        end;
             writeln(t,'  ����� � �ଥ �஡�����');
          for i:=1 to n do
                    begin
                         for j:=1 to n do
                            begin
                            write(t,a[i,j],' ');
                            end;
                         writeln(t)
                    end;
             writeln(t);
             writeln(t,'  �����樥��� �ࠪ�����᪮�� �����童��');
             y[1]:=1; for i:=1 to n do y[i+1]:=-a[1,i];
                 for i:=1 to n+1 do
                 writeln(t,y[i]);
             writeln(t);
             writeln(rv,n);
             writeln(rv);
             for i:=1 to n+1 do writeln(rv,y[i],' ');
     close(t); close(rv)
End.
