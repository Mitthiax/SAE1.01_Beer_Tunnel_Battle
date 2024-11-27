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





implementation
  uses
    unitCoffreConst, unitCoffreIHM, unitBeerslogic, unitBeersIhm;

  var
    estDisponible: TListeEquipement; // Liste des équipements disponibles
    armeEquipe: integer; // Arme actuellement équipée
    casqueEquipe: integer; // Casque actuellement équipée
    plastronEquipe: integer; // Plastron actuellement équipée
    jambieresEquipe: integer; // Jambieres actuellement équipée
    bottesEquipe: integer; // Bottes actuellement équipée

  {
    Procedure qui débloque un équipement
    Parametres:
      numero: integer; Numero de l'équipement
  }
  procedure debloquer(numero: integer);
  begin
    estDisponible[numero] := true;
  end;
  
  {
    Procedure qui initialise tous les equipements
  }
  procedure initialisationEquipement();
  var
    i: integer; // Variable de boucle
  begin
    for i := 1 to 18 do estDisponible[i] := false;
    debloquer(epeeCuivre);
    debloquer(hacheCuivre);
    debloquer(casqueCuivre);
    debloquer(plastronCuivre);
    debloquer(jambieresCuivre);
    debloquer(bottesCuivre);

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
          if casqueEquipe = numero then casqueEquipe := 0
          else casqueEquipe := numero;
        end;
        
        10..12:
        begin
          if plastronEquipe = numero then plastronEquipe := 0
          else plastronEquipe := numero;
        end;
        
        13..15:
        begin
          if jambieresEquipe = numero then jambieresEquipe := 0
          else jambieresEquipe := numero;
        end;
        
        16..18:
        begin
          if bottesEquipe = numero then bottesEquipe := 0
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
    initialisationEquipement();
    coffreIHM();
    choix := coffreChoixEquipementIHM();
    while (1 <= choix) and (choix <= 18) do
    begin
      equiper(choix);
      coffreIHM();
      choix := coffreChoixEquipementIHM();
    end;
    // Si le choix n'est pas un équipement, on quitte le coffre
    afficherInterface();
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

  {
    Fonction qui donne les points d'attaques de l'arme équipée
    Sortie:
      integer; Points d'attaques de l'arme équipée
  }
  function getAttaqueJoueur(): integer;
  begin
    getAttaqueJoueur := getAttaqueArme(armeEquipe);
  end;

  {
    Fonction qui donne la sommes des points de défence des pièces d'armure équipées
    Sortie:
      integer; Points de défence des pièces d'armure équipées
  }
  function getDefenceJoueur(): integer;
  begin
    getDefenceJoueur := getDefenceArmure(casqueEquipe)
                      + getDefenceArmure(plastronEquipe)
                      + getDefenceArmure(jambieresEquipe)
                      + getDefenceArmure(bottesEquipe);
  end;
  
end.