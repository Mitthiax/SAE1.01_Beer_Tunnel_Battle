unit marchand;

{$codepage utf8}
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
      if getinvent(monnaie)>= 30 then
      begin
        setinvent(bombe,getinvent(bombe)+1);
        setinvent(monnaie,getinvent(monnaie)-30);
      end
      else
      begin
        setinvent(bombe,getinvent(bombe));
         deplacerCurseurXY(9, 34); Write('Sort de ma boutique sale pieçard');
         
      end;
    end;
  
    2:
     begin
      if getinvent(monnaie)>= 50 then
      begin
        setinvent(potion,getinvent(potion)+1);
        setinvent(monnaie,getinvent(monnaie)-50);
      end
      else
      begin
        setinvent(potion,getinvent(potion));
         deplacerCurseurXY(9, 34); Write('Sort de ma boutique sale pieçard');
      end;
    end;
  end;
end;

  
end.