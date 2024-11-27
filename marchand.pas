unit marchand;

{$mode objfpc}{$H+}

interface
  
uses
  SysUtils, Classes,Inventaire;
  
implementation

procedure achat();
var
objet:integer;
begin
  readln(objet);
  case objet of
    1:
    begin
      if tab_invent[monnaie]>= 30 then
      begin
        tab_invent[bombe]+=1;
      end;
      else
      begin
        tab_invent[bombe]:=tab_invent[bombe];
        //ecrire dans l'IHM "Sort de ma boutique sale pieçard"
      end;
    end;
  
    2:
     begin
      if tab_invent[monnaie]>= 50 then
      begin
        tab_invent[potion]+=1;
      end;
      else
      begin
        tab_invent[potion]:=tab_invent[potion];
        //ecrire dans l'IHM "Sort de ma boutique sale pieçard"
      end;
    end;
  end;
end;

  
end.