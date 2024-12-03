unit unitTaverneAnecdote;

{$codepage utf8}
{$mode objfpc}{$H+}

interface

//Procedure qui permet de finir sa biere et de retouner au hall de la taverne
function gererChoixTaverneBiere(choix : Integer):Integer;

  
implementation

uses
  SysUtils, Classes, unitTaverneIHM;

//Procedure qui permet de finir sa biere et de retouner au hall de la taverne
function gererChoixTaverneBiere(choix : Integer):Integer;
begin
  if (choix = 1 ) then
    afficherInterfaceTaverne();
end;  
end.
