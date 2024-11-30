unit unitForgeLogic;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  {
    Fonction qui retourne si un équipement est possédé
    Sortie:
      boolean; True si l'équipement n'est pas déjà possédé, sinon false
  }
  function equipementPossede(idEquipement: integer): boolean;

  {
    Fonction qui retourne si un équipement est achetable
    Sortie:
      boolean; True si l'équipement n'est pas déjà possédé et achetable, sinon false
  }
  function equipementAchetable(idEquipement: integer): boolean;

  {
    Procedure qui ouvre la forge
  }
  procedure ouvrirForge();
  




implementation
  uses
    SysUtils, Classes, unitForgeIHM, Inventaire, unitCoffreLogic, unitCoffreConst, unitBeersIhm;

  {
    Fonction qui retourne si un équipement est possédé
    Sortie:
      boolean; True si l'équipement n'est pas déjà possédé, sinon false
  }
  function equipementPossede(idEquipement: integer): boolean;
  begin
    equipementPossede := estDisponibleEquipement(idEquipement);
  end;

  {
    Fonction qui retourne si un équipement est achetable
    Sortie:
      boolean; True si l'équipement n'est pas déjà possédé et achetable, sinon false
  }
  function equipementAchetable(idEquipement : integer): boolean;
  var
    estAchetable: boolean; // True si l'équipement n'est pas déjà possédé et achetable, sinon false

  begin
    // Initialisation des variables
    estAchetable := true;

    estAchetable := not equipementPossede(idEquipement);
    
    if estAchetable then
    begin
      if      listeEquipement[idEquipement].materiau = 'Cuivre'  then estAchetable := getinvent(cuivre)  >= listeEquipement[idEquipement].prix
      else if listeEquipement[idEquipement].materiau = 'Fer'     then estAchetable := getinvent(fer)     >= listeEquipement[idEquipement].prix
      else if listeEquipement[idEquipement].materiau = 'Mythril' then estAchetable := getinvent(mythril) >= listeEquipement[idEquipement].prix;
    end;

    // Sortie
    equipementAchetable := estAchetable;
  end;

  {
    Procedure qui achete un équipement si cela est possible
    Parametre:
      idEquipement: integer; Identifiant de l'équipement
  }
  procedure acheter(idEquipement : integer);
  begin
    if equipementAchetable(idEquipement) then
    begin
      if      listeEquipement[idEquipement].materiau = 'Cuivre'  then setinvent(cuivre,  getinvent(cuivre)  - listeEquipement[idEquipement].prix)
      else if listeEquipement[idEquipement].materiau = 'Fer'     then setinvent(fer,     getinvent(fer)     - listeEquipement[idEquipement].prix)
      else if listeEquipement[idEquipement].materiau = 'Mythril' then setinvent(mythril, getinvent(mythril) - listeEquipement[idEquipement].prix);
      setinvent(monnaie, getinvent(monnaie) - listeEquipement[idEquipement].prixOr);
      debloquer(idEquipement);
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

    afficherInterface();
  end;
end.