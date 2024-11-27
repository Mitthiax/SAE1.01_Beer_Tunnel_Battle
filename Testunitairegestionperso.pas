unit Testunitairegestionperso;

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
testIsEqual(level,2);

//Test exp insufissant pour la monter en niveau
newTest('Monter en level','donner de l''exp sans monter de level');
InitialisationPersonnage();
Experience(50);
testIsEqual(level,1);

//test pour monter de 2 niveau
newTest('Monter en level','donne l''exp de 2 level');
InitialisationPersonnage();
Experience(400);
testIsEqual(level,3);

//Serie de test sur l'expérience du joueur
newTestsSeries('Test monter en exp');
//Test donne de l'exp sans faire monter de niveau
newTest('Test monter en exp','Donne juste de l''sans faire monter en level');
InitialisationPersonnage();
Experience(50);
testIsEqual(exp,50);
end;

procedure testunitaireMonterdeSante();
begin
  
  newTestsSeries('Monter de Sante');
//Test pour savoir si la santé monte bien de 15 si on passe un level
  newTest('Monter de Sante','fait monter le level et la sante');
  InitialisationPersonnage();
  Experience(100);
  testIsEqual(Santemax,215);

end;

procedure testgestionperso();
begin
  testunitaireExperience();
  testunitaireMonterdeSante();
  Summary();
  readln;
end;
end.