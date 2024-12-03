unit unitDormir;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
uses
  SysUtils, Classes, unitDate, GestionPerso, unitDormirIhm, unitChambreIhm, marchand, gestionbuff, unitContratsLogic;

// Permet d'arrêter de dormir 
procedure gererChoixDormir();
// Affichage du journal du joueur avec toutes les informations sur son personnage
procedure afficherJournal();
function getDatejour():integer;
function getDatesemaine():TJourSemaine;
function getDatemois():TMois;
implementation

// Procédure qui permet d'arrêter de dormir
procedure gererChoixDormir();
var
pvrestore:integer;
begin
  pvrestore:=getSantemax();
  soignerJoueur(pvrestore); 
  AvancerDate(); // Avancer la date d'un jour
  Initstockboutique(); //Initialise le stock de la boutique pour la journée
  resetBuffs(); //Initialise les buffs a 0 apres avoir dormi
  initialiserContrats();
end;

// Procédure qui affiche le journal du joueur avec toutes les informations sur son personnage
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
