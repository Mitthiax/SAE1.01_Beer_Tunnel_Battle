unit unitDormir;
{Role: Permet de dormir et de remettre a zero avec le sommeil les buffs, et les nombres d'objet vendue par le marchand.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
uses
  SysUtils, Classes, unitDate, GestionPerso, unitDormirIhm, unitChambreIhm, marchand, gestionbuff, unitContratsLogic;

// Permet d'arrêter de dormir 
procedure gererChoixDormir();
//Appel des dates
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
