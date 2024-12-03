unit unitCombatConst;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  type
    TEnnemi = record
      nom:        string;  // Nom de l'ennemi
      PV:         integer; // Nombre de points de vie de l'ennemi
      degats:     integer; // Nombre de dégats infligés par l'ennemi sur le joueur
      // La quantité exacte de ressources données au joueur est déterminé dans les contrat
      cuivreMax:  integer; // Quantité maximum de cuivre    pour un ennemi
      ferMax:     integer; // Quantité maximum de fer       pour un ennemi
      mythrilMax: integer; // Quantité maximum de mythrile  pour un ennemi
      orMax:      integer; // Quantité maximum d'or         pour un ennemi
      XPMax:      integer; // Quantité maximum d'experience pour un ennemi
    end;

  const
    GOBLIN: TEnnemi =
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
    TROLL: TEnnemi =
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
    ORQUE: TEnnemi =
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