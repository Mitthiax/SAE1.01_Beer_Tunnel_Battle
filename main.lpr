program main;

{$codepage utf8}
{$mode objfpc}{$H+}

uses
  classes,sysutils, unitMenuPrincipalLogic,GestionEcran,unitBeersTestUnitaire,unitBuffTestUnitaire,Testunitairegestionperso,unitTestUnitaireTous;
begin 
  changerTailleConsole(200,40);
  randomize;
  //menu();
  //testgestionperso();
  //testbeer();
  // testsbuffs();
  testsunitaireTous();

end.