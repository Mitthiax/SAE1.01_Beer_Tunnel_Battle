unit unitForgeLogic;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  {
    Procedure qui ouvre la forge
  }
  procedure ouvrirForge();
  
implementation
  uses
    SysUtils, Classes, unitForgeIHM, Inventaire;

  {
    Procedure qui achete un équipement si cela est possible
    Parametre:
      idEquipememt: integer; Identifiant de l'équipement
  }
  procedure acheter(idEquipement: integer);
  begin
    if equipementAchetable(idEquipememt) then
    begin
      if      listeEquipement[idEquipememt].materiau = 'Cuivre'  then setinvent(cuivre,  getinvent(cuivre)  - listeEquipement[idEquipememt].prix)
      else if listeEquipement[idEquipememt].materiau = 'Fer'     then setinvent(fer,     getinvent(fer)     - listeEquipement[idEquipememt].prix)
      else    listeEquipement[idEquipememt].materiau = 'Mythril' then setinvent(mythril, getinvent(mythril) - listeEquipement[idEquipememt].prix);
      setinvent(monnaie, getinvent(monnaie) - listeEquipement[idEquipememt].prixOr);
      debloquer(idEquipememt);
    end;
  end;
  
  {
    Procedure qui ouvre la forge
  }
  procedure ouvrirForge();
  var
    choix: integer; // Choix dans la forge parmi les équipements et quitter

  begin
    forgeIHM();

    repeat
      choix := choixForgeIHM();
      acheter(choix);
    until (choix = 0);
  end;
end.