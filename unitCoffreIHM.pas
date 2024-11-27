unit unitCoffreIHM;

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
    GestionEcran, unitCoffreConst, unitCoffreLogic;

  {
    Procedure qui affiche la liste des armes
  }
  procedure afficherArmes();
  var
    i: integer; // Variable de boucle
  begin
    deplacerCurseurXY(10, 7); write('--- Vos armes ---');
    for i := 1 to 6 do
    begin
      if i = getArmeEquipe() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      deplacerCurseurXY(10, 7 + i*2); write(i, ' -  ', getNomEquipement(i));
      deplacerCurseurXY(37, 7 + i*2); write('-> ', getAttaqueArme(i), ' points');
      couleurTexte(White)
    end;
  end;

  {
    Procedure qui affiche la liste des casques
  }
  procedure afficherArmures();
  var
    i: integer; // Variable de boucle
  begin
    deplacerCurseurXY(75, 7); write('--- Vos pièces d''armure ---');

    // Liste des casques
    for i := 7 to 9 do
    begin
      if i = getCasqueEquipe() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      deplacerCurseurXY(75, 7 + i*2 - 12); write(i, ' -  ', getNomEquipement(i));
      deplacerCurseurXY(102, 7 + i*2 - 12); write('-> ', getDefenceArmure(i), ' points');
      couleurTexte(White)
    end;

    // Liste des plastron
    for i := 10 to 12 do
    begin
      if i = getPlastronEquipe() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      deplacerCurseurXY(75, 7 + i*2 - 12); write(i, ' -  ', getNomEquipement(i));
      deplacerCurseurXY(102, 7 + i*2 - 12); write('-> ', getDefenceArmure(i), ' points');
      couleurTexte(White)
    end;

    // Liste des jambières
    for i := 13 to 15 do
    begin
      if i = getJambieresEquipe() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      deplacerCurseurXY(75, 7 + i*2 - 12); write(i, ' -  ', getNomEquipement(i));
      deplacerCurseurXY(102, 7 + i*2 - 12); write('-> ', getDefenceArmure(i), ' points');
      couleurTexte(White)
    end;

    // Liste des bottes
    for i := 16 to 18 do
    begin
      if i = getBottesEquipe() then couleurTexte(Green)
      else if not estDisponibleEquipement(i) then couleurTexte(Red);
      deplacerCurseurXY(75, 7 + i*2 - 12); write(i, ' -  ', getNomEquipement(i));
      deplacerCurseurXY(102, 7 + i*2 - 12); write('-> ', getDefenceArmure(i), ' points');
      couleurTexte(White)
    end;
  end;

  {
    IHM du coffre
  }
  procedure coffreIHM();
  begin
    // Entête
    dessinerCadreXY(1, 0, 198, 39, simple, White, Black);
    dessinerCadreXY(80, 0, 120, 2, simple, White, Black);
    dessinerCadreXY(90, 1, 110, 3, simple, White, Black);
    deplacerCurseurXY(93, 2); write('Coffre');

    deplacerCurseurXY(35, 35); write('Choisir un équipement à équiper ou déséquiper');
    deplacerCurseurXY(35, 36); write('0 - Quitter le coffre');

    afficherArmes();
    afficherArmures();
  end;

  {
    IHM du choix d'équipement dans le coffre
    Sortie:
      integer; Choix du joueur dans le coffre
  }
  function coffreChoixEquipementIHM():integer;
  begin
    dessinerCadreXY(97, 35, 103, 37, simple, White, Black);
    deplacerCurseurXY(100, 36); readln(coffreChoixEquipementIHM);
  end;
  
end.