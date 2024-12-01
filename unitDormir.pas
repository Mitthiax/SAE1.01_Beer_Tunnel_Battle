unit unitDormir;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
uses
  SysUtils, Classes, unitDate, GestionPerso, unitDormirIhm, unitChambreIhm;

// Permet d'arrêter de dormir 
procedure gererChoixDormir();
// Affichage du journal du joueur avec toutes les informations sur son personnage
procedure afficherJournal();
function getDatejour():integer;
function getDatesemaine():TJourSemaine;
function getDatemois():TMois;
implementation

// Procedure qui permet d'arrêter de dormir
procedure gererChoixDormir();
var
pvrestore:integer;
begin
  pvrestore:=getSantemax();
  soignerJoueur(pvrestore); 
  AvancerDate(); // Avancer la date d'un jour
end;

// Procedure qui affiche le journal du joueur avec toutes les informations sur son personnage
procedure afficherJournal();
begin
  //afficherJournalIHM();
end;
function getDatejour():integer;
begin
  getDatejour:=ObtenirDateActuelle().Jour;
end;
function getDatemois():TMois;
begin
  getDatemois:=ObtenirDateActuelle().Mois
end;
function getDatesemaine():TJourSemaine;
begin
  getDatesemaine:=ObtenirDateActuelle().JourSemaine
end;
end.
