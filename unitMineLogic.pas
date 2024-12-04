unit unitMineLogic;
{Role: Permet d'accéder au contrat ou au combat}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
  uses
    unitCombatConst;

  //Procédure qui ouvre la mine
  procedure ouvrirMine();
  


implementation
  uses
    SysUtils, Classes, libRandom, unitMineIHM, unitHallIhm, unitContratsLogic, Inventaire, GestionPerso, combat;

  //Procédure qui gère un contrat accompli
  procedure recompensesContrat();
  begin
    setinvent(cuivre, (getinvent(cuivre)  + getContratEnCours().quantiteCuivre));
    setinvent(fer,    (getinvent(fer)     + getContratEnCours().quantiteFer));
    setinvent(mythril,(getinvent(mythril) + getContratEnCours().quantiteMythril));
    setinvent(monnaie,(getinvent(monnaie) + getContratEnCours().quantiteOr));
    Experience(getContratEnCours().quantiteXP);
  
    afficherRecompenses(getContratEnCours());
    accomplirContrat();
  end;
  
 //Procédure qui ouvre la mine
  procedure ouvrirMine();
  var
    choix: integer; // Choix dans la mine parmi les ennemis et quitter

  begin
    if contratAccompli() then recompensesContrat();

    mineIHM();
    choix := choixMineIHM();

    // On réaffiche quand le choix est un contrat, ou combattre sans contrat accepté
    while (1 <= choix) and (choix <= 3) or ((choix = 4) and not contratAccepte()) do
    begin
      if (1 <= choix) and (choix <= 3) then accepterContrat(choix);
      mineIHM();
      choix := choixMineIHM();
    end;

    if choix = 4 then commencerCombat(getContratEnCours().typeEnnemi);

    afficherInterface(); // Retour dans le hall
  end;
  
end.
