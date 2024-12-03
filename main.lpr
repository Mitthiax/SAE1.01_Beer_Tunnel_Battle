program main;

{$codepage utf8}
{$mode objfpc}{$H+}

uses
  classes,sysutils, unitMenuPrincipalLogic,GestionEcran,unitBeersTestUnitaire,unitBuffTestUnitaire;
begin 
  changerTailleConsole(200,40);
  randomize;
  menu();
  //testbeer();
  // testsbuffs();

end.