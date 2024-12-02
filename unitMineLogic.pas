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
    SysUtils, Classes, libRandom, unitMineIHM, unitBeersIhm, unitContratsLogic, Inventaire, GestionPerso;

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

    if choix <> 0 then accepterContrat(choix);

    afficherInterface(); // Retour au hall
  end;
  
end.