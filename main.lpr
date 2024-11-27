program main;
{$mode objfpc}{$H+}
uses
  classes,sysutils, unitMenuPrincipalLogic, unitCoffreLogic, combat, unitCombatConst, GestionEcran, GestionPerso;
begin 
  randomize;
  changerTailleConsole(200, 40);
  InitialisationPersonnage();
  commencerCombat(TROLL);
end.