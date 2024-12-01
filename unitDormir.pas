unit unitDormir;

{$mode objfpc}{$H+}

interface
uses
  SysUtils, Classes, unitDate, GestionPerso, unitDormirIhm, unitChambreIhm;

// Permet d'arrêter de dormir 
procedure gererChoixDormir(choix: Integer);
// Affichage du journal du joueur avec toutes les informations sur son personnage
procedure afficherJournal();
// Initialise le premier jour
procedure InitialiserDate();
function getDatejour():integer;
function getDatesemaine():TJourSemaine;
function getDatemois():TMois;
implementation


var
  DateCourante: TDateJeu;

// Procedure qui initialise la date du premier jour
procedure InitialiserDate();
begin
  DateCourante.JourSemaine := Oranor;
  DateCourante.Jour := 1;
  DateCourante.Mois := Gwaeron;
end;

// Procedure qui permet d'arrêter de dormir
procedure gererChoixDormir(choix: Integer);
var
pvrestore:integer;
begin
  if (choix = 1) then
  begin
  pvrestore:=getSantemax();
    soignerJoueur(pvrestore); 
    AvancerDate(); // Avancer la date d'un jour
  end;
end;

// Procedure qui affiche le journal du joueur avec toutes les informations sur son personnage
procedure afficherJournal();
begin
  //afficherJournalIHM();
end;
function getDatejour():integer;
begin
  getDatejour:=DateCourante.Jour;
end;
function getDatemois():TMois;
begin
  getDatemois:=DateCourante.Mois
end;
function getDatesemaine():TJourSemaine;
begin
  getDatesemaine:=DateCourante.JourSemaine
end;
end.
