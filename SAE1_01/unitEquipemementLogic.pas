unit unitEquipemementLogic;

{$mode objfpc}{$H+}

interface
  type
    TListeEquipement = array[1..18] of boolean;
  
implementation
  uses
    unitEquipemementConst, unitEquipemementIHM;

  var
    estDisponibleEquipement: TListeEquipement; // Liste des équipements disponibles
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
    for i := low(estDisponibleEquipement) to high(estDisponibleEquipement) do estDisponibleEquipement[i] := false;
    estDisponibleEquipement[epeeCuivre] := true;

    armeEquipe := 0;
    casqueEquipe := 0;
    plastronEquipe := 0;
    jambieresEquipe := 0;
    bottesEquipe := 0;
  end;

  {
    Procedure qui équipe un equipement au joueur
    parametres:
      numero: integer; Numero de l'équipement à équiper
  }
  procedure equiper(numero: integer);
  var
    choix: integer; // Choix du joueur dans le coffre

  begin
    choix := equiperIHM();

    if estDisponibleEquipement[numero] then
    begin
      case choix of
        1..6:
        begin
          if armeEquipe = choix then armeEquipe = 0;
          else armeEquipe := choix;
        end;
        
        7..9:
        begin
          if armeEquipe = choix then casqueEquipe = 0;
          else casqueEquipe := choix;
        end;
        
        10..12:
        begin
          if armeEquipe = choix then plastronEquipe = 0;
          else plastronEquipe := choix;
        end;
        
        13..15:
        begin
          if armeEquipe = choix then jambieresEquipe = 0;
          else jambieresEquipe := choix;
        end;
        
        16..18:
        begin
          if armeEquipe = choix then bottesEquipe = 0;
          else bottesEquipe := choix;
        end;
      end;
    end;
  end;

  {
    Fonction qui retourne le nom de l'arme équipée
    Sortie:
      string: Nom de l'armure équipée
  }
  function getArmeEquipe(): string;
  var
    nom: string; // Nom de l'armure équipée
  begin
    if (1 < armeEquipe) and (armeEquipe < 6) then nom := getNomEquipement(armeEquipe)
    else nom := 'Aucun';

    getArmeEquipe := nom;
  end;

  {
    Fonction qui retourne le nom du casque équipé
    Sortie:
      string: du casque équipé
  }
  function getCasqueEquipe(): string;
  var
    nom: string; // Nom du casque équipé
  begin
    if (7 < casqueEquipe) and (casqueEquipe < 9) then nom := getNomEquipement(casqueEquipe)
    else nom := 'Aucun';

    getCasqueEquipe := nom;
  end;

  {
    Fonction qui retourne le nom du plastron équipé
    Sortie:
      string: Nom du plastron équipé
  }
  function getPlastronEquipe(): string;
  var
    nom: string; // Nom du plastron équipé
  begin
    if (10 < plastronEquipe) and (plastronEquipe < 12) then nom := getNomEquipement(plastronEquipe)
    else nom := 'Aucun';

    getPlastronEquipe := nom;
  end;

  {
    Fonction qui retourne le nom des jambières équipées
    Sortie:
      string: Nom des jambières équipées
  }
  function getJambieresEquipe(): string;
  var
    nom: string; // Nom des jambières équipées
  begin
    if (13 < jambieresEquipe) and (jambieresEquipe < 15) then nom := getNomEquipement(jambieresEquipe)
    else nom := 'Aucun';

    getJambieresEquipe := nom;
  end;

  {
    Fonction qui retourne le nom des bottes équipées
    Sortie:
      string: Nom des bottes équipées
  }
  function getBottesEquipe(): string;
  var
    nom: string; // Nom des bottes équipées
  begin
    if (16 < bottesEquipe) and (bottesEquipe < 18) then nom := getNomEquipement(bottesEquipe)
    else nom := 'Aucun';

    getBottesEquipe := nom;
  end;
  
end.