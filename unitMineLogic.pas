unit unitMineLogic;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  uses
    unitCombatConst;

  type
    TListeEnnemies = array[1..3] of TEnnemie;

  {
    Procedure qui ouvre la mine
  }
  procedure ouvrirMine();
  




implementation
  uses
    SysUtils, Classes, libRandom,  combat, unitMineIHM, unitBeersIhm;

  {
    Fonction qui créer un ennemie avec des caractéristiques aléatoire (± 25%)
    Parametres:
      ennemie: TEnnemie; Ennemie de base
    Sortie:
      TEnnemie; Ennemie avec des caractéristiques aléatoire (± 25%)
  }
  function creerEnnemie(ennemie: TEnnemie): TEnnemie;
  begin
    // Modification des points de vie et dégats
    ennemie.PV := round(ennemie.PV * randomReal(0.75, 1.25));
    ennemie.degats := round(ennemie.degats * randomReal(0.75, 1.25));

    // Sortie
    creerEnnemie := ennemie;
  end;
  
  {
    Procedure qui ouvre la mine
  }
  procedure ouvrirMine();
  var
    choix: integer; // Choix dans la mine parmi les ennemies et quitter
    listeEnnemies: TListeEnnemies; // Listes des ennemies proposés dans la mine

  begin
    listeEnnemies[1] := creerEnnemie(GOBLIN);
    listeEnnemies[2] := creerEnnemie(TROLL);
    listeEnnemies[3] := creerEnnemie(ORQUE);

    mineIHM(listeEnnemies);
    choix := choixMineIHM();

    if choix <> 0 then commencerCombat(listeEnnemies[choix]);

    afficherInterface(); // Retour au hall
  end;
  
end.