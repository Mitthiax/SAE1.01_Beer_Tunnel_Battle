unit unitMineLogic;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  uses
    unitCombatConst;

  {
    Procedure qui ouvre la mine
  }
  procedure ouvrirMine();
  




implementation
  uses
    SysUtils, Classes, libRandom, unitMineIHM, unitBeersIhm, unitContratsLogic, Inventaire, GestionPerso, combat;

  {
    Procedure qui gère un contrat accompli
  }
  procedure recompensesContrat();
  begin
    setinvent(cuivre, (getinvent(cuivre)  + getContratEnCours().quantiteCuivre));
    setinvent(fer,    (getinvent(fer)     + getContratEnCours().quantiteFer));
    setinvent(mythril,(getinvent(mythril) + getContratEnCours().quantiteMythril));
    setinvent(monnaie,(getinvent(monnaie) + getContratEnCours().quantiteOr));
    Experience(getContratEnCours().quantiteXP);
  
    afficherRecompenses(getContratEnCours());
    arreterContrat();
  end;
  
  {
    Procedure qui ouvre la mine
  }
  procedure ouvrirMine();
  var
    choix: integer; // Choix dans la mine parmi les ennemies et quitter

  begin
    if contratAccompli() then recompensesContrat();

    mineIHM();
    choix := choixMineIHM();

    
    {while (1 <= choix) and (choix <= 3) or () do
    begin
      accepterContrat(choix);
      mineIHM();
      choix := choixMineIHM();
    end;}

    if choix = 4 then commencerCombat(getContratEnCours().typeEnnemie);

    afficherInterface(); // Retour au hall
  end;
  
end.