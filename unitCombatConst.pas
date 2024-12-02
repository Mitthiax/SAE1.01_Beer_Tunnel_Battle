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
      cuivreMax:  15;
      ferMax:     10;
      mythrilMax: 5;
      orMax:      25;
      XPMax:      15;
    );
    TROLL: TEnnemie =
    (
      nom:        'Troll';
      PV:         200;
      degats:     22;
      cuivreMax:  25;
      ferMax:     15;
      mythrilMax: 7;
      orMax:      50;
      XPMax:      35;
    );
    ORQUE: TEnnemie =
    (
      nom:        'Orque';
      PV:         300;
      degats:     35;
      cuivreMax:  40;
      ferMax:     25;
      mythrilMax: 10;
      orMax:      75;
      XPMax:      70;
    );
  
implementation
  uses
    SysUtils, Classes;
end.