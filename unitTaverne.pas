unit unitTaverne;
{Role: Logic du hall de la Taverne qui propose de boire une bière ou de manger.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Permet de savoir quel choix est fait
function gererChoixTaverne(choix : Integer):Integer;
//Permet d'aller boire une biere
function boireBiere():Integer;
//Permet d'aller manger
function manger():Integer;
//Permet de quittez la taverne
function quittez():Integer;

implementation
uses
  SysUtils, Classes, unitBeersIhm, unitTaverneAnecdote, unitTaverneAnecdoteIHM,gestionbuff,unitTaverneIHM, unitTaverneManger, unitTaverneMangerIhm;


//Procedure qui gere les choix fait par le joueur a la taverne
function gererChoixTaverne(choix : Integer):Integer;
begin
  case choix of 
    1 : boireBiere(); 
    2 : manger();
    3 : quittez();
  end;
end;

function boireBiere():Integer;
begin
  afficherInterfaceBiere(); // Appel de l'interface de consommation biere
end;

function manger():Integer;
begin
  afficherInterfaceManger(); //Appel de l'interface de consommation de nourriture
end;

function quittez():Integer;
begin
  afficherInterface(); // Appel de l'interface du hall pour revenir au hall
end;
end.
