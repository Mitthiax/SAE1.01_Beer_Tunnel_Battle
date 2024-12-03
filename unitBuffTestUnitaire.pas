unit unitBuffTestUnitaire;
{$codepage utf8}
{$mode objfpc}{$H+}

interface
procedure testsbuffs();
 
implementation
uses
  SysUtils, Classes,Inventaire,gestionbuff,unitTaverneManger,GestionPerso,testunitaire,unitDormir;
 
procedure testbuff();
begin
  newTestsSeries('Test getBuff');
  newTest('Test getBuff','Vérification à l''initialisation');
  InitialisationPersonnage();
  testIsEqual(not indicationBuffSanteeMax());
  testIsEqual(not indicationBuffResistanceMax());

  newTest('Test getBuff','Vérification get Résistance');
  gererChoixTaverneManger(1);
  testIsEqual(indicationBuffResistanceMax());
  testIsEqual(getBuffResistanceMax(),20);
  testIsEqual(getinvent(monnaie),200-18);

  newTest('Test getBuff','Vérification get Santée');
  gererChoixTaverneManger(2);
  testIsEqual(indicationBuffSanteeMax());
  testIsEqual(getSantemax(),230);
  testIsEqual(getinvent(monnaie),(200-18)-25);

  newTest('Test getBuff','Vérification reset buff');
  gererChoixDormir();
  testIsEqual(not indicationBuffSanteeMax());
  testIsEqual(not indicationBuffResistanceMax());
  testIsEqual(getSantemax(),200);
  testIsEqual(getBuffResistanceMax(),0);
end;
  
//Lance tous les tests
procedure testsbuffs();
begin
     testbuff();


     Summary();
     readln;
end;

end.