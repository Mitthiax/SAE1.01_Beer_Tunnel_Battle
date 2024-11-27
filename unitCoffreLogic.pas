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
    Parametre:
      numero: integer; Numero de l'équipement à équiper
  }
  procedure equiper(numero: integer);

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
    Parametre:
      numero: integer; Numero de l'équipement à équiper
  }
  procedure equiper(numero: integer);
  begin
    if estDisponible[numero] then
    begin
      case numero of
        1..6:
        begin
          if armeEquipe = numero then armeEquipe := 0
          else armeEquipe := numero;
        end;
        
        7..9:
        begin
          if armeEquipe = numero then casqueEquipe := 0
          else casqueEquipe := numero;
        end;
        
        10..12:
        begin
          if armeEquipe = numero then plastronEquipe := 0
          else plastronEquipe := numero;
        end;
        
        13..15:
        begin
          if armeEquipe = numero then jambieresEquipe := 0
          else jambieresEquipe := numero;
        end;
        
        16..18:
        begin
          if armeEquipe = numero then bottesEquipe := 0
          else bottesEquipe := numero;
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
    choix := coffreChoixEquipementIHM();
    while (1 <= choix) and (choix <= 18) do
    begin
      equiper(choix);
      coffreIHM();
    end;
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