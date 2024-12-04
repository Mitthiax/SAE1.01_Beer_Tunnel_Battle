program BeerTunnelsBattles;

{$codepage utf8}
{$mode objfpc}{$H+}

uses
  classes,sysutils, unitMenuPrincipalLogic,GestionEcran,unitHallTestUnitaire,unitBuffTestUnitaire,Testunitairegestionperso,unitTestUnitaireTous;
begin 
  changerTailleConsole(200,40);
  randomize;
  menu();
  // testsunitaireTous();

end.