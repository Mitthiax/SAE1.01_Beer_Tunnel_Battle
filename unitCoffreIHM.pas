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
      deplacerCurseurXY(X,      Y + i*2); write(i, ' -  ', getNomEquipement(i));
      deplacerCurseurXY(X + 27, Y + i*2); write('-> ', getAttaqueArme(i), ' attaque');

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
      deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', getNomEquipement(i));
      deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> ', getDefenceArmure(i), ' défense');

      couleurTexte(White);
    end;

    // Liste des plastron
    for i := 10 to 12 do
    begin
      // Choix de la couleur pous les équipements équipés ou bloqués
      if i = getPlastronEquipe() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      
      // Affichage du nom et des points de defence
      deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', getNomEquipement(i));
      deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> ', getDefenceArmure(i), ' défense');

      couleurTexte(White);
    end;

    // Liste des jambières
    for i := 13 to 15 do
    begin
      // Choix de la couleur pous les équipements équipés ou bloqués
      if i = getJambieresEquipees() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      
      // Affichage du nom et des points de defence
      deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', getNomEquipement(i));
      deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> ', getDefenceArmure(i), ' défense');

      couleurTexte(White);
    end;

    // Liste des bottes
    for i := 16 to 18 do
    begin
      // Choix de la couleur pous les équipements équipés ou bloqués
      if i = getBottesEquipees() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      
      // Affichage du nom et des points de defence
      deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', getNomEquipement(i));
      deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> ', getDefenceArmure(i), ' défense');

      couleurTexte(White);
    end;
  end;

  {
    IHM du coffre
  }
  procedure coffreIHM();
  begin
    effacerEcran();

    // Entête
    dessinerCadreXY(1, 0, 198, 39, simple, White, Black);
    dessinerCadreXY(80, 0, 120, 2, simple, White, Black);
    dessinerCadreXY(90, 1, 110, 3, simple, White, Black);
    deplacerCurseurXY(93, 2); write('Coffre');

    deplacerCurseurXY(35, 35); write('Choisir un équipement à équiper ou déséquiper');
    deplacerCurseurXY(35, 36); write('0 - Quitter le coffre');

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
        dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
        deplacerCurseurXY(105, 33); readln(choix);
    until (0 <= choix) and (choix <= 18);
    couleurTexte(White);
    
    coffreChoixEquipementIHM := choix
  end;
  
end.