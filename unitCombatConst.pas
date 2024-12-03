unit unitCombatConst;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  type
    TEnnemie = record
      nom:        string;  // Nom de l'ennemie
      PV:         integer; // Nombre de points de vie de l'ennemie
      degats:     integer; // Nombre de dégats infligés par l'ennemie sur le joueur
      // La quantité exacte de ressources données au joueur est déterminé dans les contrat
      cuivreMax:  integer; // Quantité maximum de cuivre    pour un ennemie
      ferMax:     integer; // Quantité maximum de fer       pour un ennemie
      mythrilMax: integer; // Quantité maximum de mythrile  pour un ennemie
      orMax:      integer; // Quantité maximum d'or         pour un ennemie
      XPMax:      integer; // Quantité maximum d'experience pour un ennemie
    end;

  const
    GOBLIN: TEnnemie =
    (
      nom:        'Goblin';
      PV:         100;
      degats:     5;
      cuivreMax:  20;
      ferMax:     15;
      mythrilMax: 5;
      orMax:      50;
      XPMax:      30;
    );
    TROLL: TEnnemie =
    (
      nom:        'Troll';
      PV:         200;
      degats:     22;
      cuivreMax:  35;
      ferMax:     25;
      mythrilMax: 9;
      orMax:      100;
      XPMax:      75;
    );
    ORQUE: TEnnemie =
    (
      nom:        'Orque';
      PV:         300;
      degats:     35;
      cuivreMax:  50;
      ferMax:     40;
      mythrilMax: 15;
      orMax:      130;
      XPMax:      120;
    );
  
implementation
  uses
    SysUtils, Classes;
end.