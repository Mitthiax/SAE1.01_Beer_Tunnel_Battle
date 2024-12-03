unit unitTaverneAnecdote;
{Role: Permet de finir sa bière et de retourner au hall de la taverne.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface

//Procédure qui permet de finir sa bière et de retouner dans le hall de la taverne
procedure gererChoixTaverneBiere(choix : Integer);

  
implementation

uses
  SysUtils, Classes, unitTaverneIHM;

//Procédure qui permet de finir sa bièe et de retouner dans le hall de la taverne
procedure gererChoixTaverneBiere(choix : Integer);
begin
  if (choix = 1 ) then
    afficherInterfaceTaverne();
end;  
end.
