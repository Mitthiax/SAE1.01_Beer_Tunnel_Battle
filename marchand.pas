unit marchand;

{$mode objfpc}{$H+}

interface
procedure achat(objet:integer);

implementation
uses
  SysUtils, Classes,Inventaire,GestionEcran;
  
procedure achat(objet:integer);

begin
  case objet of
    1:
    begin
      if invent[monnaie]>= 30 then
      begin
        invent[bombe]+=1;
        invent[monnaie]-=30;
      end
      else
      begin
        invent[bombe]:=invent[bombe];
         deplacerCurseurXY(9, 34); Write('Sort de ma boutique sale pieçard');
         
      end;
    end;
  
    2:
     begin
      if invent[monnaie]>= 50 then
      begin
        invent[potion]+=1;
        invent[monnaie]-=50;
      end
      else
      begin
        invent[potion]:=invent[potion];
         deplacerCurseurXY(9, 34); Write('Sort de ma boutique sale pieçard');
      end;
    end;
  end;
end;

  
end.