unit unitCombatIHM;

{$mode objfpc}{$H+}

interface
  {
    IHM des combats
  }
  function combatIHM(): integer;
  


implementation
  uses
    SysUtils, Classes, GestionEcran;
  
  {
    Fonction qui demande au joueur de choisir entre les options lors d'un tour de combat
    Sortie:
      integer; Choix du joueur lors du tour de combat
  }
  function choixCombatIHM(): integer;
  var
    choix: integer; // Choix du joueur lors du tour de combat
    
  begin
    repeat
      readln(choix);
    until ((1 <= choix) and (choix <= 4));
    choixCombatIHM := choix;
  end;

  {
    IHM des combats
  }
  function combatIHM(): integer;
  begin
    effacerEcran();
    deplacerCurseurXY(20, 30); write('1 - Attaquer');
    deplacerCurseurXY(20, 31); write('2 - Lancer une bombe');
    deplacerCurseurXY(20, 32); write('3 - Boire une potion');
    deplacerCurseurXY(20, 33); write('4 - Fuire');

    combatIHM := choixCombatIHM();
  end;
  
end.