unit unitCoffreLogic;

{$mode objfpc}{$H+}

interface
  type
    TListeEquipement = array[1..18] of boolean;
  
  {
    Procedure qui initialise tous les equipements
  }
  procedure initialisationEquipement();
  
  {
    Procedure qui ouvre le coffre
  }
  procedure ouvrirCoffre();

  {
    Procedure qui équipe ou déséquipe un equipement au joueur
  }
  procedure equiper();

  function estDisponibleEquipement(numero: integer): boolean;

  {
    Fonction qui retourne le numero de l'arme équipée
    Sortie:
      integer: Numero de l'armure équipée
  }
  function getArmeEquipe(): integer;

  {
    Fonction qui retourne le numero du casque équipé
    Sortie:
      integer: Numero du casque équipé
  }
  function getCasqueEquipe(): integer;

  {
    Fonction qui retourne le numero du plastron équipé
    Sortie:
      integer: Numero du plastron équipé
  }
  function getPlastronEquipe(): integer;

  {
    Fonction qui retourne le numero des jambières équipées
    Sortie:
      integer: Numero des jambières équipées
  }
  function getJambieresEquipe(): integer;

  {
    Fonction qui retourne le numero des bottes équipées
    Sortie:
      integer: Numero des bottes équipées
  }
  function getBottesEquipe(): integer;





implementation
  uses
    unitCoffreConst, unitCoffreIHM, unitBeerslogic;

  var
    estDisponible: TListeEquipement; // Liste des équipements disponibles
    armeEquipe: integer; // Arme actuellement équipée
    casqueEquipe: integer; // Casque actuellement équipée
    plastronEquipe: integer; // Plastron actuellement équipée
    jambieresEquipe: integer; // Jambieres actuellement équipée
    bottesEquipe: integer; // Bottes actuellement équipée
  
  {
    Procedure qui initialise tous les equipements
  }
  procedure initialisationEquipement();
  var
    i: integer; // Variable de boucle
  begin
    for i := low(estDisponible) to high(estDisponible) do estDisponible[i] := false;
    estDisponible[epeeCuivre] := true;

    armeEquipe := 0;
    casqueEquipe := 0;
    plastronEquipe := 0;
    jambieresEquipe := 0;
    bottesEquipe := 0;
  end;

  {
    Procedure qui équipe ou déséquipe un equipement au joueur
  }
  procedure equiper();
  var
    choix: integer; // Choix du joueur dans le coffre

  begin
    choix := coffreChoixEquipementIHM();

    if estDisponible[choix] then
    begin
      case choix of
        1..6:
        begin
          if armeEquipe = choix then armeEquipe := 0
          else armeEquipe := choix;
        end;
        
        7..9:
        begin
          if armeEquipe = choix then casqueEquipe := 0
          else casqueEquipe := choix;
        end;
        
        10..12:
        begin
          if armeEquipe = choix then plastronEquipe := 0
          else plastronEquipe := choix;
        end;
        
        13..15:
        begin
          if armeEquipe = choix then jambieresEquipe := 0
          else jambieresEquipe := choix;
        end;
        
        16..18:
        begin
          if armeEquipe = choix then bottesEquipe := 0
          else bottesEquipe := choix;
        end;
      end;
    end;
  end;
  
  {
    Procedure qui ouvre le coffre
  }
  procedure ouvrirCoffre();
  var
    choix: integer; // Choix du joueur dans le coffre

  begin
    coffreIHM();
    choix := 
    while choix 
  end;

  function estDisponibleEquipement(numero: integer): boolean;
  begin
    estDisponibleEquipement := estDisponible[numero];
  end;

  {
    Fonction qui retourne le numero de l'arme équipée
    Sortie:
      integer: Numero de l'armure équipée
  }
  function getArmeEquipe(): integer;
  begin
    getArmeEquipe := armeEquipe;
  end;

  {
    Fonction qui retourne le numero du casque équipé
    Sortie:
      integer: Numero du casque équipé
  }
  function getCasqueEquipe(): integer;
  begin
    getCasqueEquipe := casqueEquipe;
  end;

  {
    Fonction qui retourne le numero du plastron équipé
    Sortie:
      integer: Numero du plastron équipé
  }
  function getPlastronEquipe(): integer;
  begin
    getPlastronEquipe := plastronEquipe;
  end;

  {
    Fonction qui retourne le numero des jambières équipées
    Sortie:
      integer: Numero des jambières équipées
  }
  function getJambieresEquipe(): integer;
  begin
    getJambieresEquipe := jambieresEquipe;
  end;

  {
    Fonction qui retourne le numero des bottes équipées
    Sortie:
      integer: Numero des bottes équipées
  }
  function getBottesEquipe(): integer;
  begin
    getBottesEquipe := bottesEquipe;
  end;
  
end.