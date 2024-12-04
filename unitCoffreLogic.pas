unit unitCoffreLogic;
{Role: Partie métier de fonctionnement du coffre.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
  type
    TListeEquipement = array[1..18] of boolean;
  
  //Procédure qui initialise tous les equipements
  procedure initialisationEquipement();
  
  //Procédure qui ouvre le coffre
  procedure ouvrirCoffre();

  {
    Procédure qui équipe ou déséquipe un equipement au joueur
    Parametre:
      idEquipement: integer; Identifiant de l'équipement à équiper
  }
  procedure equiper(idEquipement: integer);

  {
    Fonction qui retourne si un equipement est débloqué ou non
    Parametres:
      idEquipement: integer; Identifiant de l'équipement
    Sortie:
      boolean; True si l'équipement est débloqué, sinon false
  }
  function estDisponibleEquipement(idEquipement: integer): boolean;

  {
    Fonction qui retourne si un equipement est équipé ou non
    Parametres:
      idEquipement: integer; Identifiant de l'équipement
    Sortie:
      boolean; True si l'équipement est équipé, sinon false
  }
  function estEquipe(idEquipement: integer):boolean;

  {
    Fonction qui retourne l'identifiant de l'arme équipée
    Sortie:
      integer: Identifiant de l'armure équipée
  }
  function getArmeEquipee(): integer;

  {
    Fonction qui retourne l'identifiant du casque équipé
    Sortie:
      integer: Identifiant du casque équipé
  }
  function getCasqueEquipe(): integer;

  {
    Fonction qui retourne l'identifiant du plastron équipé
    Sortie:
      integer: Identifiant du plastron équipé
  }
  function getPlastronEquipe(): integer;

  {
    Fonction qui retourne l'identifiant des jambières équipées
    Sortie:
      integer: Identifiant des jambières équipées
  }
  function getJambieresEquipees(): integer;

  {
    Fonction qui retourne l'identifiant des bottes équipées
    Sortie:
      integer: Identifiant des bottes équipées
  }
  function getBottesEquipees(): integer;

  {
    Fonction qui donne les points d'attaques de l'arme équipée
    Sortie:
      integer; Points d'attaques de l'arme équipée
  }
  function getAttaqueJoueur(): integer;


  {
    Fonction qui donne la sommes des points de défence des pièces d'armure équipées
    Sortie:
      integer; Points de défence des pièces d'armure équipées
  }
  function getDefenceJoueur(): integer;

  {
    Procédure qui débloque un équipement
    Parametres:
      idEquipement: integer; Identifiant de l'équipement
  }
  procedure debloquer(idEquipement: integer);



implementation
  uses
    unitCoffreConst, unitCoffreIHM, unitChambreIhm;

  var
    estDisponible: TListeEquipement; // Liste des équipements disponibles
    armeEquipe: integer; // Arme actuellement équipée
    casqueEquipe: integer; // Casque actuellement équipée
    plastronEquipe: integer; // Plastron actuellement équipée
    jambieresEquipees: integer; // Jambieres actuellement équipée
    bottesEquipees: integer; // Bottes actuellement équipée

  {
    Procédure qui débloque un équipement
    Parametres:
      idEquipement: integer; Identifiant de l'équipement
  }
  procedure debloquer(idEquipement: integer);
  begin
    estDisponible[idEquipement] := true;
  end;
  
  //Procédure qui initialise tous les equipements
  procedure initialisationEquipement();
  var
    i: integer; // Variable de boucle
  begin
    for i := 1 to 18 do estDisponible[i] := false;
    
    debloquer(epeeCuivre);
    debloquer(casqueCuivre);

    armeEquipe := 0;
    casqueEquipe := 0;
    plastronEquipe := 0;
    jambieresEquipees := 0;
    bottesEquipees := 0;
  end;

  {
    Procédure qui équipe ou déséquipe un equipement au joueur
    Parametre:
      idEquipement: integer; Identifiant de l'équipement à équiper
  }
  procedure equiper(idEquipement: integer);
  begin
    if estDisponible[idEquipement] then
    begin
      case idEquipement of
        1..6:
        begin
          if armeEquipe = idEquipement then armeEquipe := -1 // Code arme non équipée
          else armeEquipe := idEquipement;
        end;
        
        7..9:
        begin
          if casqueEquipe = idEquipement then casqueEquipe := 0 // Code armure non équipée
          else casqueEquipe := idEquipement;
        end;
        
        10..12:
        begin
          if plastronEquipe = idEquipement then plastronEquipe := 0 // Code armure non équipée
          else plastronEquipe := idEquipement;
        end;
        
        13..15:
        begin
          if jambieresEquipees = idEquipement then jambieresEquipees := 0 // Code armure non équipée
          else jambieresEquipees := idEquipement;
        end;
        
        16..18:
        begin
          if bottesEquipees = idEquipement then bottesEquipees := 0 // Code armure non équipée
          else bottesEquipees := idEquipement;
        end;
      end;
    end;
  end;
  
  //Procédure qui ouvre le coffre
  procedure ouvrirCoffre();
  var
    choix: integer; // Choix du joueur dans le coffre

  begin
    coffreIHM();
    choix := coffreChoixEquipementIHM();
    while (choix <> 0) do
    begin
      equiper(choix);
      coffreIHM();
      choix := coffreChoixEquipementIHM();
    end;
    afficherInterfaceChambre();
  end;

  {
    Fonction qui retourne si un equipement est débloqué ou non
    Parametres:
      idEquipement: integer; Identifiant de l'équipement
    Sortie:
      boolean; True si l'équipement est débloqué, sinon false
  }
  function estDisponibleEquipement(idEquipement: integer): boolean;
  begin
    estDisponibleEquipement := estDisponible[idEquipement];
  end;

  {
    Fonction qui retourne si un equipement est équipé ou non
    Parametres:
      idEquipement: integer; Identifiant de l'équipement
    Sortie:
      boolean; True si l'équipement est équipé, sinon false
  }
  function estEquipe(idEquipement: integer):boolean;
  begin
    estEquipe := (idEquipement = armeEquipe) or
                 (idEquipement = casqueEquipe) or
                 (idEquipement = plastronEquipe) or
                 (idEquipement = jambieresEquipees) or
                 (idEquipement = bottesEquipees)
  end;

  {
    Fonction qui retourne l'identifiant de l'arme équipée
    Sortie:
      integer: Identifiant de l'armure équipée
  }
  function getArmeEquipee(): integer;
  begin
    getArmeEquipee := armeEquipe;
  end;

  {
    Fonction qui retourne l'identifiant du casque équipé
    Sortie:
      integer: Identifiant du casque équipé
  }
  function getCasqueEquipe(): integer;
  begin
    getCasqueEquipe := casqueEquipe;
  end;

  {
    Fonction qui retourne l'identifiant du plastron équipé
    Sortie:
      integer: Identifiant du plastron équipé
  }
  function getPlastronEquipe(): integer;
  begin
    getPlastronEquipe := plastronEquipe;
  end;

  {
    Fonction qui retourne l'identifiant des jambières équipées
    Sortie:
      integer: Identifiant des jambières équipées
  }
  function getJambieresEquipees(): integer;
  begin
    getJambieresEquipees := jambieresEquipees;
  end;

  {
    Fonction qui retourne l'identifiant des bottes équipées
    Sortie:
      integer: Identifiant des bottes équipées
  }
  function getBottesEquipees(): integer;
  begin
    getBottesEquipees := bottesEquipees;
  end;

  {
    Fonction qui donne les points d'attaques de l'arme équipée
    Sortie:
      integer; Points d'attaques de l'arme équipée
  }
  function getAttaqueJoueur(): integer;
  begin
    getAttaqueJoueur := listeEquipement[armeEquipe].points;
  end;

  {
    Fonction qui donne la sommes des points de défence des pièces d'armure équipées
    Sortie:
      integer; Points de défence des pièces d'armure équipées
  }
  function getDefenceJoueur(): integer;
  begin
    getDefenceJoueur := listeEquipement[casqueEquipe].points
                      + listeEquipement[plastronEquipe].points
                      + listeEquipement[jambieresEquipees].points
                      + listeEquipement[bottesEquipees].points;
  end;
  
end.
