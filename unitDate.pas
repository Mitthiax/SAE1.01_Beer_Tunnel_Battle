unit unitDate;

{$codepage utf8}
{$mode objfpc}{$H+}

interface

// Types pour représenter les jours de la semaine et les mois de l'année selon le calendrier Sindarin
type
  TJourSemaine = (Orgilion, Oranor, Orithil, Orgaladh, Ormenel, Oraearon, Orbelain);
  TMois = (Narwain, Ninui, Gwaeron, Gwirith, Lothron, Norui, Cerveth, Urui, Ivanneth, Narbeleth, Hithui, Girithron);

// Structure pour représenter la date du jeu
type
  TDateJeu = record
    JourSemaine: TJourSemaine;
    Jour: Integer;
    Mois: TMois;
  end;

// Initialiser la date du jeu
procedure InitialiserDate();

// Afficher la date sur l'écran principal
procedure AfficherDate();

// Avancer la date (utilisé lorsqu'un joueur dort)
procedure AvancerDate();

// Fonction pour accéder à la date actuelle (pour les tests)
function ObtenirDateActuelle: TDateJeu;

//procédures qui initalise la date à une époque précise pour des test unitaires
procedure InitialiserDateTest();
procedure InitialiserDateTest2();
implementation

uses
  SysUtils, GestionEcran;

const
  JoursDansMois: array[TMois] of Integer = (
    30, 30, 30, 30, 31, 31, 30, 30, 30, 30, 30, 30  // Modifié pour Nórui et Cerveth ayant 31 jours
);

// Variable globale pour stocker la date actuelle du jeu
var
  DateActuelle: TDateJeu;

// Initialiser la date du jeu
procedure InitialiserDate();
begin
  DateActuelle.JourSemaine := Orgilion;
  DateActuelle.Jour := 1;
  DateActuelle.Mois := Narwain;
end;

//pour certains test unitaire
procedure InitialiserDateTest();
begin
  DateActuelle.JourSemaine := Oranor;
  DateActuelle.Jour := 30;
  DateActuelle.Mois := Cerveth;
end;

//pour certains test unitaire
procedure InitialiserDateTest2();
begin
  DateActuelle.JourSemaine := Oranor;
  DateActuelle.Jour := 30;
  DateActuelle.Mois := Girithron;
end;

// Afficher la date sur l'écran principal
procedure AfficherDate();
const
  NomsJoursSemaine: array[TJourSemaine] of string = (
    'Orgilion', 'Oranor', 'Orithil', 'Orgaladh', 'Ormenel', '	Oraearon', 'Orbelain'
  );
  NomsMois: array[TMois] of string = (
    'Narwain', 'Ninui', 'Gwaeron', 'Gwirith', 'Lothron', 'Norui', 'Cerveth', 'Urui', 'Ivanneth', 'Narbeleth', 'Hithui', 'Girithron'
  );
begin
  couleurTexte(White);
  deplacerCurseurXY(2, 2); // Déplacer le curseur à la position où la date doit être affichée
  WriteLn('Date: ', NomsJoursSemaine[DateActuelle.JourSemaine], ' ', DateActuelle.Jour, ' ', NomsMois[DateActuelle.Mois]);
end;

// Avancer la date (utilisé lorsqu'un joueur dort)
procedure AvancerDate();
begin
  // Avancer le jour de la semaine
  if DateActuelle.JourSemaine = high(TJourSemaine) then DateActuelle.JourSemaine := low(TJourSemaine)
  else DateActuelle.JourSemaine := succ(DateActuelle.JourSemaine);

  // Avancer le jour du mois
  Inc(DateActuelle.Jour);
  if DateActuelle.Jour > JoursDansMois[DateActuelle.Mois] then
  begin
    DateActuelle.Jour := 1;
    // Avancer le mois
    if DateActuelle.mois = high(TMois) then DateActuelle.mois := low(TMois)
    else DateActuelle.mois := succ(DateActuelle.mois);
  end;
end;

// Fonction pour accéder à la date actuelle (pour les tests)
function ObtenirDateActuelle: TDateJeu;
begin
  ObtenirDateActuelle := DateActuelle;
end;

end.
