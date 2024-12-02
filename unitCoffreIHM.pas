unit unitCoffreIHM;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  {
    IHM du coffre
    Sortie:
      integer; Choix du joueur dans le coffre
  }
  procedure coffreIHM();

  {
    IHM du choix d'équipement dans le coffre
    Sortie:
      integer; Choix du joueur dans le coffre
  }
  function coffreChoixEquipementIHM():integer;
  



  
implementation
  uses
    GestionEcran, unitCoffreConst, unitCoffreLogic, journalihm;

  {
    Procedure qui affiche la liste des armes
  }
  procedure afficherArmes();
  const
    X = 10; Y = 5; // Coordonnées de l'affichage
  var
    i: integer; // Variable de boucle
  begin
    deplacerCurseurXY(X, Y); write('--- Vos armes ---');
    for i := 1 to 6 do
    begin
      // Choix de la couleur pous les équipements équipés ou bloqués
      if i = getArmeEquipee() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      
      // Affichage du nom et des points d'attaque
      deplacerCurseurXY(X,      Y + i*2); write(i, ' -  ', listeEquipement[i].nom);
      deplacerCurseurXY(X + 27, Y + i*2); write('-> ', listeEquipement[i].points, ' attaque');

      couleurTexte(White);
    end;
  end;

  {
    Procedure qui affiche la liste des casques
  }
  procedure afficherArmures();
  const
    X = 75; Y = 5; // Coordonnées de l'affichage
  var
    i: integer; // Variable de boucle
  begin
    deplacerCurseurXY(X, Y); write('--- Vos pièces d''armure ---');

    // Liste des casques
    for i := 7 to 9 do
    begin
      // Choix de la couleur pous les équipements équipés ou bloqués
      if i = getCasqueEquipe() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      
      // Affichage du nom et des points de defence
      deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', listeEquipement[i].nom);
      deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> ', listeEquipement[i].points, ' défense');

      couleurTexte(White);
    end;

    // Liste des plastron
    for i := 10 to 12 do
    begin
      // Choix de la couleur pous les équipements équipés ou bloqués
      if i = getPlastronEquipe() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      
      // Affichage du nom et des points de defence
      deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', listeEquipement[i].nom);
      deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> ', listeEquipement[i].points, ' défense');

      couleurTexte(White);
    end;

    // Liste des jambières
    for i := 13 to 15 do
    begin
      // Choix de la couleur pous les équipements équipés ou bloqués
      if i = getJambieresEquipees() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      
      // Affichage du nom et des points de defence
      deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', listeEquipement[i].nom);
      deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> ', listeEquipement[i].points, ' défense');

      couleurTexte(White);
    end;

    // Liste des bottes
    for i := 16 to 18 do
    begin
      // Choix de la couleur pous les équipements équipés ou bloqués
      if i = getBottesEquipees() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      
      // Affichage du nom et des points de defence
      deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', listeEquipement[i].nom);
      deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> ', listeEquipement[i].points, ' défense');

      couleurTexte(White);
    end;
  end;

//Procedure qui affiche le choix des actions
procedure afficherOptionsCoffre();
  begin
    dessinerCadreXY(3, 25, 60, 36, double, LightGreen, Black);
    couleurTexte(White);
    deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');

    deplacerCurseurXY(9, 30); Write('?/ Choisir un équipement à équiper ou déséquiper');
    deplacerCurseurXY(9, 32); Write('0/ Quittez le Coffre');
  end;

  {
    IHM du coffre
  }
  procedure coffreIHM();
  begin
    effacerEcran();

    // Entête
    dessinerCadreXY(1, 1, 199, 39, simple, LightGreen, Black);
    dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
    couleurTexte(White);
    deplacerCurseurXY(53, 1); write(' Votre Coffre ');
    
    afficherOptionsCoffre();

    afficherArmes();
    afficherArmures();
    journal();
  end;

  {
    IHM du choix d'équipement dans le coffre
    Sortie:
      integer; Choix du joueur dans le coffre
  }
  function coffreChoixEquipementIHM():integer;
  var
    choix: integer; // Choix du joueur dans le coffre
  begin
    // On redemande jusqu'a ce que le choix soit valide
    repeat
      dessinerCadreXY(40, 32, 50, 34, double, Red, Black);
      deplacerCurseurXY(45, 33); readln(choix);
    until (0 <= choix) and (choix <= 18);
    couleurTexte(White);
    
    coffreChoixEquipementIHM := choix
  end;
  
end.