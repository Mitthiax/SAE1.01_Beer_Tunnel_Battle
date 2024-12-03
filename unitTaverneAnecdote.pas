unit unitTaverneAnecdote;

{$codepage utf8}
{$mode objfpc}{$H+}

interface

//Procedure qui permet de finir sa biere et de retouner au hall de la taverne
procedure gererChoixTaverneBiere(choix : Integer);

  
implementation

uses
  SysUtils, Classes, unitTaverneIHM;

//Procedure qui permet de finir sa biere et de retouner au hall de la taverne
procedure gererChoixTaverneBiere(choix : Integer);
begin
  if (choix = 1 ) then
    afficherInterfaceTaverne();
end;  
end.
