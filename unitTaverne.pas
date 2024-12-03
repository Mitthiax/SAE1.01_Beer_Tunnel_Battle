unit unitTaverne;
{Role: Partie métier du hall de la Taverne qui propose de boire une bière ou de manger.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Permet de savoir quel choix est fait
procedure gererChoixTaverne(choix : Integer);
//Permet d'aller boire une bière
procedure boireBiere();
//Permet d'aller manger
procedure manger();
//Permet de quitter la taverne
procedure quitter();

implementation
uses
  SysUtils, Classes, unitBeersIhm, unitTaverneAnecdote, unitTaverneAnecdoteIHM,gestionbuff,unitTaverneIHM, unitTaverneManger, unitTaverneMangerIhm;


//Procédure qui gere les choix fait par le joueur a la taverne
procedure gererChoixTaverne(choix : Integer);
begin
  case choix of 
    1 : boireBiere();
    2 : manger();
    3 : quitter();
  end;
end;

procedure boireBiere();
begin
  afficherInterfaceBiere(); // Appel de l'interface de consommation bière
end;

procedure manger();
begin
  afficherInterfaceManger(); //Appel de l'interface de consommation de nourriture
end;

procedure quitter();
begin
  afficherInterface(); // Appel de l'interface du hall pour revenir dans le hall
end;
end.
