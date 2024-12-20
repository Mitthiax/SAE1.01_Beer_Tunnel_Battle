unit libRandom;
{Role: Bibliotèque proposant différentes fonctions d'aléatoires}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
  {
    Fonction qui génère un entier aléatoie entre a inclus et b exclus avec 0 <= a <= b
    Parametres:
      a, b: integer; Bornes
    Sortie:
      integer; Entier aléatoire entre a inclus et b exclus
  }
  function randomInteger(a, b: integer): integer;

  {
    Fonction qui génère un réel aléatoire entre a inclus et b exclus avec 0 <= a <= b
    Parametres:
      a, b: real; Bornes
    Sortie:
      real; Réel aléatoire entre a inclus et b exclus
  }
  function randomReal(a, b: real): real;

  {
    Fonction qui génère un réel aléatoire entre 0 inclus et a exclus avec 0 <= a
    Parametres:
      a: real; Borne supérieur
    Sortie:
      real; Réel aléatoire entre 0 inclus et a exclus
  }
  function randomReal(a: real): real;
  
implementation
  uses
    SysUtils, Classes;
  
  {
    Fonction qui génère un entier aléatoie entre a inclus et b exclus avec 0 <= a <= b
    Parametres:
      a, b: integer; Bornes
    Sortie:
      integer; Entier aléatoire entre a inclus et b exclus
  }
  function randomInteger(a, b: integer): integer;
  begin
    randomInteger := random(b-a) + a
  end;

  {
    Fonction qui génère un réel aléatoire entre a inclus et b exclus avec 0 <= a <= b
    Parametres:
      a, b: real; Bornes
    Sortie:
      real; Réel aléatoire entre a inclus et b exclus
  }
  function randomReal(a, b: real): real;
  begin
    randomReal := random() * (b-a) + a;
  end;

  {
    Fonction qui génère un réel aléatoire entre 0 inclus et a exclus avec 0 <= a
    Parametres:
      a: real; Borne supérieur
    Sortie:
      real; Réel aléatoire entre 0 inclus et a exclus
  }
  function randomReal(a: real): real;
  begin
    randomReal := random() * (a);
  end;
  
end.
