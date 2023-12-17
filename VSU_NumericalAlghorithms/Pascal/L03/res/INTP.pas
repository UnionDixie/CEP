{                  ������ୠ� ࠡ�� N 3
          ���௮���� �����ࠨ�᪨�� �����童����
   ���௮��樮��� �����童�� ���⮭�, ��૨���, ���ᥫ�
          �믮���� ��㤥�� 4 ���� ��㯯�    �������� ��ࣥ�   }
program internew;
const maxn=50;
type
        tabsub=array[1..maxn,1..maxn] of real;
var
        g,g1              :text;
        name,name1        :string;
        i,j,k,m,n         :integer;
        x1,x2,x3,w        :real;
        fr                :tabsub;
function newt(m,k:integer; x:real):real;
var
        i      :integer;
        y,z,q :real;
begin
        y:=fr[k,1]; q:=x*10-k+1;
        z:=1;
        for i:=1 to m do begin
                          z:=z*(q-i+1)/i;
                          y:=y+z*fr[k,i+1]
                         end;
        newt:=y
end;
function newt1(m,k:integer; x:real):real;
var
        i      :integer;
        y,z,q  :real;
begin
        y:=fr[k,1]; q:=x*10-k+1;
        z:=1;
        for i:=1 to m do begin
                          z:=z*(q+i-1)/i;
                          y:=y+z*fr[k-i,i+1]
                         end;
        newt1:=y
end;

function stir(m,k:integer; x:real):real;
var
        i,j,ii,jj,l  :integer;
        y,z,q,r,s    :real;
begin
        l:=trunc(m/2); q:=x*10-k+1; z:=1.0; i:=2;
        y:=fr[k,1]+0.5*q*(fr[k-1,2]+fr[k,2]);
        repeat
              ii:=trunc((i-1)/2);
              z:=z*(q+ii)*(q-ii)/((i-1)*i);
              y:=y+z*fr[k-trunc(i/2),i+1];
              i:=i+2
        until i>2*l;
        r:=0.0; s:=q; j:=3;
        repeat
              jj:=trunc((j-1)/2);
              s:=s*(q+jj)*(q-jj)/((j-1)*j);
r:=r+s*0.5*(fr[k-trunc((j+1)/2),j+1]+(fr[k-trunc(j/2),j+1]));
              j:=j+2
        until j>2*l-1;
        stir:=y+r
end;

function bess(m,k:integer; x:real):real;
var
        i,j,l        :integer;
        y,z,q,r,s    :real;
begin
        l:=trunc(m/2); q:=x*10-k+1; z:=1.0; i:=2;
        y:=(fr[k,1]+fr[k+1,1])*0.5;
        repeat
    z:=z*(q+trunc((i-1)/2))*(q-trunc(i/2))/((i-1)*i);
    y:=y+z*0.5*(fr[k-trunc(i/2),i+1]+fr[k-trunc((i-1)/2),i+1]);
              i:=i+2
        until i>l*2;
        s:=q-0.5; j:=2; r:=fr[k,2]*s;
        repeat
              s:=s*(q+trunc((j-1)/2))*(q-trunc(j/2))/((j+1)*j);
              r:=r+s*fr[k-trunc(j/2),j+2];
              j:=j+2
        until j>2*l+1;
        bess:=y+r
end;

begin
        write('������ ��� �室���� 䠩��  ');readln(name);
        assign(g,name); reset(g);
        write('������ ��� ��室���� 䠩��  '); readln(name1);
        assign(g1,name1); rewrite(g1);
        writeln(g1,'          ������ୠ� ࠡ�� N 3');
        writeln(g1,'  ���௮���� �����ࠨ�᪨�� �����童����');
        writeln(g1,'     �믮���� ��㤥�� 4 ���� ��㯯�  �������� ��ࣥ�     ');
        readln(g,n);
        for i:=1 to n do
        for j:=1 to n+1-i do read(g,fr[i,j]);
   write('������ �⥯��� ���௮��樮����� �����童�� m  ');
   read(m);
        write('������ ��� x1 '); readln(x1);
        write('������ ����� ������襣� 㧫� '); read(k);
   writeln(g1);
   writeln('x1= ',x1,' f(x1)= ',newt(m,k,x1));
writeln(g1,'  ���௮��樮��� �����童�� ���⮭� �⥯���  m = ',m);
   writeln(g1,' x1= ',x1,'  f(x1)= ',newt(m,k,x1));
        write('������ ��� x2 '); readln(x2);
        write('������ ����� ������襣� 㧫�  '); read(k);
   writeln(g1);
   writeln('x2= ',x2,' f(x2)= ',newt1(m,k,x2));
   writeln(g1,' x2= ',x2,'  f(x2)= ',newt1(m,k,x2));
           write('������ ��� x3 '); readln(x3);
   write('������ ����� ������襣� 㧫�  '); read(k);
   w:=x3*10-k+1;
   writeln(g1);
   writeln('�஢���� �롮� ����� ������襣� 㧫�');
   writeln('         -0.25 <= q <= 0.75');
   writeln(' q = ',w:4:2);
   writeln('������ ���� ����� ������襣� 㧫�'); read(k);
   if abs(w)<=0.25 then
   begin
        writeln('x3= ',x3,' f(x3)= ',stir(m,k,x3));
        writeln(g1,'  ���௮��樮��� �����童� ��૨���');
        writeln(g1,'        �⥯���  m = ',trunc(m/2)*2);
        writeln(g1,' x3= ',x3,'  f(x3)= ',stir(m,k,x3))
   end
                    else
   begin
        writeln('x3= ',x3,' f(x3)= ',bess(m,k,x3));
        writeln(g1,'  ���௮��樮��� �����童� ���ᥫ�');
        writeln(g1,'        �⥯���  m = ',trunc(m/2)*2+1);
        writeln(g1,' x3= ',x3,'  f(x3)= ',bess(m,k,x3));
   end;
   close(g1)
end.
