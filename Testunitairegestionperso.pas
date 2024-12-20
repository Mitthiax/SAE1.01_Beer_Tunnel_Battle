unit Testunitairegestionperso;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
procedure testgestionperso();

implementation
uses
  SysUtils, Classes,testunitaire,GestionPerso;
//Test unitaire de la montée de l'expérience et du niveau
procedure testunitaireExperience();
begin
//Serie de test sur le niveau du joueur
newTestsSeries('Monter en level');
//Test fait monter de 1 niveau
newTest('Monter en level','donne l''exp necessaire');
InitialisationPersonnage();
Experience(100);
testIsEqual(getlevel(),2);

//Test exp insufissant pour la monter en niveau
newTest('Monter en level','donner de l''exp sans monter de level');
InitialisationPersonnage();
Experience(50);
testIsEqual(getlevel(),1);

//test pour monter de 2 niveau
newTest('Monter en level','donne l''exp de 2 level');
InitialisationPersonnage();
Experience(400);
testIsEqual(getlevel(),3);

//Serie de test sur l'expérience du joueur
newTestsSeries('Test monter en exp');
//Test donne de l'exp sans faire monter de niveau
newTest('Test monter en exp','Donne juste de l''sans faire monter en level');
InitialisationPersonnage();
Experience(50);
testIsEqual(getexp(),50);
end;

procedure testunitaireMonterdeSante();
begin
  
  newTestsSeries('Monter de Sante');
//Test pour savoir si la santé monte bien de 15 si on passe un level
  newTest('Monter de Sante','fait monter le level et la sante');
  InitialisationPersonnage();
  Experience(100);
  testIsEqual(getSantemax(),215);

end;

procedure testunitairegestionPV();
begin
  //Test sur la gestion de la santé
  newTestsSeries('Gestion de la santé');
  newTest('Gestion de la santé','Enlever PV');
  InitialisationPersonnage();
  gestionSante(125);
  testIsEqual(getSante(),75);

  newTest('Gestion de la santé','Rajouté PV');
  soignerJoueur(100);
  testIsEqual(getSante(),175);

  newTest('Gestion de la santé','Pv Max');
  soignerJoueur();
  testIsEqual(getSante(),200);
end;

procedure testgestionperso();
begin
  testunitaireExperience();
  testunitaireMonterdeSante();
  testunitairegestionPV();
  Summary();
  readln;
end;
end.