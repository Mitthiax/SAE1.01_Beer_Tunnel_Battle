unit marchand;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
procedure achat(objet:integer);

implementation
uses
  SysUtils, Classes,Inventaire,GestionEcran,unitMarchandIHM;
  
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
        Argentmanquant();
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
        Argentmanquant();
      end;
    end;
  end;
end;

  
end.