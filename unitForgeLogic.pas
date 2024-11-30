unit unitForgeLogic;

{$codepage utf8}
{$mode objfpc}{$H+}

interface

  {
    Fonction qui retourne si un équipement est achetable
    Sortie:
      boolean; True si l'équipement n'est pas déjà possédé et achetable, sinon false
  }
  function equipementAchetable(idEquipememt: integer): boolean;

  {
    Procedure qui ouvre la forge
  }
  procedure ouvrirForge();
  




implementation
  uses
    SysUtils, Classes, unitForgeIHM, Inventaire, unitCoffreLogic, unitCoffreConst;

  {
    Fonction qui retourne si un équipement est possédé
    Sortie:
      boolean; True si l'équipement n'est pas déjà possédé, sinon false
  }
  function equipementPossede(idEquipememt: integer): boolean;
  begin
    equipementPossede := estDisponibleEquipement(idEquipememt);
  end;

  {
    Fonction qui retourne si un équipement est achetable
    Sortie:
      boolean; True si l'équipement n'est pas déjà possédé et achetable, sinon false
  }
  function equipementAchetable(idEquipememt: integer): boolean;
  var
    estAchetable: boolean // True si l'équipement n'est pas déjà possédé et achetable, sinon false

  begin
    // Initialisation des variables
    estAchetable := true

    estAchetable := not equipementPossede(idEquipememt);
    
    if      listeEquipement[idEquipememt].materiau = 'Cuivre'  then estAchetable := getinvent(cuivre)  >= listeEquipement[idEquipememt].prix
    else if listeEquipement[idEquipememt].materiau = 'Fer'     then estAchetable := getinvent(fer)     >= listeEquipement[idEquipememt].prix
    else    listeEquipement[idEquipememt].materiau = 'Mythril' then estAchetable := getinvent(mythril) >= listeEquipement[idEquipememt].prix;

    // Sortie
    equipementAchetable := estAchetable;
  end;

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