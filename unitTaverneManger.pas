unit unitTaverneManger;
{Role: Partie logic de la consommation de nourriture de la Taverne, le joueur peux ainsi manger deux plat qui lui accorde differents buffs.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface

//Permet de gerer les choix entre manger un plat et retouner au hall de la taverne
procedure gererChoixTaverneManger(choix : Integer);


implementation

uses
  SysUtils, Classes, unitTaverneIHM,Inventaire,gestionBuff, unitTaverneMangerIhm, journalihm;

//Permet de gerer les choix entre manger un plat et retouner au hall de la taverne
procedure gererChoixTaverneManger(choix : Integer);
begin
case choix of
  //Permet un gain de resistance qui passe au maximum pour cela le joueur doit avoir 18 pièce d'or au minimum 
  1 : if getinvent(monnaie)>= 18 then
  begin
    setbuffResistanceMax();
    setinvent(monnaie,getinvent(monnaie)-18);
  end; 
  //Permet un gain de santée qui passe au maximum pour cela le joueur doit avoir 25 pièce d'or au minimum
  2 : if getinvent(monnaie)>= 25 then
  begin
    setBuffSanteeMax();
    setinvent(monnaie,getinvent(monnaie)-25);
  end;
  //Permet de quittez en retournant au hall de la taverne
  3 : afficherInterfaceTaverne();
end;
end;
end.
