unit unitCombatConst;

{$mode objfpc}{$H+}

interface
  type
    TEnnemie = record
      nom: string; // Nom de l'ennemie
      PV: integer; // Nombre de points de vie de l'ennemie
      degats: integer; // Nombre de dégats infligés par l'ennemie sur le joueur
      XP: integer; // Quantité d'experience donnée au joueur après avoir tué l'ennemie
      gold: integer; // Quantité d'or donnée au joueur après avoir tué l'ennemie
    end;

  const
    GOBLIN: TEnnemie =
    (
      nom: 'Goblin';
      PV: 100;
      degats: 5;
      XP: 15;
      gold: 2;
    );
    TROLL: TEnnemie =
    (
      nom: 'Troll';
      PV: 250;
      degats: 5;
      XP: 15;
      gold: 2;
    );
    ORC: TEnnemie =
    (
      nom: 'Orc';
      PV: 300;
      degats: 5;
      XP: 15;
      gold: 2;
    );
  
implementation
  uses
    SysUtils, Classes;
  

  
end.