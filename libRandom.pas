unit libRandom;

{$mode objfpc}{$H+}

interface
  
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
      integer; Réel aléatoire entre a inclus et b exclus
  }
  function randomReal(a, b: integer): integer;
  begin
    randomReal := random() * (b-a) + a;
  end;

  {
    Fonction qui génère un réel aléatoire entre 0 inclus et a exclus avec 0 <= a
    Parametres:
      a: real; Borne supérieur
    Sortie:
      integer; Réel aléatoire entre 0 inclus et a exclus
  }
  function randomReal(a: integer): integer;
  begin
    randomReal := random() * (a);
  end;
  
end.