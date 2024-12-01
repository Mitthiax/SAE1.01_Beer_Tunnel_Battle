unit combat;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  uses
    unitCombatConst;
  {
    Procedure qui comme un combat contre un ennemie aléatoire
    Parametres:
      ennemie: TEnnemie; Ennemie lors du combat
  }
  procedure commencerCombat(ennemie: TEnnemie);

  {
    Procedure qui comme un combat contre un ennemie aléatoire
  }
  procedure commencerCombat();

implementation
  uses
    SysUtils, Classes, GestionPerso, unitCoffreLogic, unitCombatIHM, libRandom, gestionbuff, Inventaire, unitBeersIhm;

    
  //fonction qui calcule les dégats infliger à l'ennemie 
  function degatInfliger():integer;
  var
  degatmit:integer;
  begin
    if random(15+getlevel())>2 then // on fait un jeu de harsard pour savoir si on réussi le coup ou pas(les chances sont augmenter avec le niveau)
    begin
      degatmit:= getAttaqueJoueur()+random(5+getlevel()); //on donne la possibilité de mettre plus de dégats (une sorte de coup critique)(augmenter avec le niveau)
    end
    else
    begin
    degatmit:=0;
    end;
    degatInfliger:=degatmit;
  end;

  function subirdegats(couprecu:integer):integer;
  var
  degatrecureal:real;
  begin
    if random(30-getlevel())<>0 then //on laisse une chance au joueur d'esquiver le coup(c'est petit un nain aussi, ça peut se baisser)
    begin
      degatrecureal:=couprecu+random(11-getlevel());//Augmente les degats que l'ennemie inflige (bah oui pourquoi ça serais que dans 1 sens lui aussi il a le droit au coup critique)(baisse avec le niveau)
      degatrecureal:=degatrecureal-(degatrecureal*((getDefenceJoueur()+getBuffResistanceMax)/100));//calcul les degats reçu avec le bonus de protection (svp faites en sortes que la deffense depasse pas 100 sinon il risque de give des points de vie)
      if degatrecureal<0 then
      begin
        degatrecureal:=0;
      end;
    end
    else
    begin
      degatrecureal:=0;
    end;
    subirdegats:=round(degatrecureal);
  end;

  {
    Procedure qui permet d'attaquer l'ennemie
  }
  procedure attaquer(var ennemie: TEnnemie);
  var
    degats: integer; // Dégats infligées à l'ennemie

  begin
    degats := degatInfliger();
    ennemie.PV -= degats;
    afficherAttaque(degats, ennemie.nom);
  end;

  {
    Procedure qui permet à l'ennemie d'attaquer le joueur
    Parametres:
      ennemie: TEnnemie; Ennemie du combat
  }
  procedure attaqueEnnemie(var ennemie: TEnnemie);
  var
    degats: integer; // Dégats subits par le joueur
    
  begin
    degats := subirdegats(ennemie.degats);
    gestionSante(degats);
    afficherAttaqueEnnemie(degats, ennemie.nom);
  end;

  {
    Procedure qui lance une bombe sur l'ennemie et lui inflige de dégats
    Parametres:
      ennemie: TEnnemie; Ennemie du combat
  }
  procedure lancerBombe(var ennemie: TEnnemie);
  var
    degats: integer; // Dégats infligées à l'ennemie
    
  begin
    if getinvent(bombe) > 0 then
    begin
        setinvent(bombe, getinvent(bombe) - 1);
        degats := round(30 * randomReal(0.9, 1.1));
        ennemie.PV -= degats;
        afficherBombe(degats, ennemie.nom);
    end
    else afficherBombeVide();
  end;

  {
    Procedure qui fait boire une potion qui soigne le joueur
  }
  procedure boirePotion();
  begin
    if getinvent(potion) > 0 then
    begin
      setinvent(potion, getinvent(potion) - 1);
      soignerJoueur();
    end
    else afficherPotionVide();
  end;

  {
    Fonction qui permet de tenter une fuite avec une taux de réussite de 20%
    Sortie:
      boolean; True si la fuite est réussi, false sinon
  }
  function tenterFuite(var ennemie: TEnnemie): boolean;
  var
    fuiteReussie: boolean; // True si une fuite à été réussi, false sinon

  begin
    fuiteReussie := randomReal(1) < 0.2;

    if fuiteReussie then afficherFuite()

    else
    begin
      afficherFuiteRatee(ennemie.nom);
      attaqueEnnemie(ennemie);
    end;

    tenterFuite := fuiteReussie;
  end;
  
  {
    Fonction qui gère un tour de combat et retourne si le combat est terminé
    Parametres:
      ennemie: TEnnemie; Ennemie du combat
  }
  function tourCombat(var ennemie: TEnnemie): boolean;
  var
    choix: integer; // Choix du joueur lors du tour de combat
    estTermine: boolean; // True si le combat est terminer, false sinon

  begin
    estTermine := false;

    choix := combatIHM(ennemie);

    case choix of
      1: attaquer(ennemie);
      2: lancerBombe(ennemie);
      3: boirePotion();
      4: estTermine := tenterFuite(ennemie);
    end;

    // On termine le combat si l'ennemie est mort
    if ennemie.PV <= 0 then estTermine := true;

    // Si le combat n'est pas terminé, l'ennemie attaque
    if not estTermine then attaqueEnnemie(ennemie);

    tourCombat := estTermine
  end;

  {
    Procedure qui donnne au joueur ce qu'il a gagné en gagnant le combat
    Parametres:
      ennemie: TEnnemie; Ennemie tué
  }
  procedure gagneCombat(var ennemie: TEnnemie);
  var
    cuivreGagne    : integer; // Cuivre gagné par le joueur
    ferGagne       : integer; // Fer gagné par le joueur
    mythrilGagne   : integer; // Mythril gagné par le joueur
    monnaieGagne   : integer; // Monnaie gagnée par le joueur
    experienceGagne: integer; // Experience gagnée par le joueur

  begin
    cuivreGagne     := randomInteger(7, 26);
    ferGagne        := randomInteger(5, 16);
    mythrilGagne    := randomInteger(0, 6);
    monnaieGagne    := round(ennemie.gold * randomReal(0.75, 1.25));
    experienceGagne := round(ennemie.XP   * randomReal(0.75, 1.25));

    setinvent(cuivre, (getinvent(cuivre)  + cuivreGagne));
    setinvent(fer,    (getinvent(fer)     + ferGagne));
    setinvent(mythril,(getinvent(mythril) + mythrilGagne));
    setinvent(monnaie,(getinvent(monnaie) + monnaieGagne));
    Experience(experienceGagne);
    
    afficherRecompensesCombat(
      cuivreGagne,
      ferGagne,
      mythrilGagne,
      monnaieGagne,
      experienceGagne
    );
  end;

  {
    Procedure qui comme un combat contre un ennemie aléatoire
    Parametres:
      ennemie: TEnnemie; Ennemie lors du combat
  }
  procedure commencerCombat(ennemie: TEnnemie);
  var
    estTermine: boolean; // True si le joueur est mort, false sinon

  begin
    estTermine := false;

    while (not estTermine) do estTermine := tourCombat(ennemie);
    
    if ennemie.PV <= 0 then gagneCombat(ennemie);
    afficherInterface();
  end;

  {
    Procedure qui comme un combat contre un ennemie aléatoire
  }
  procedure commencerCombat();
  var
    choixEnnemie: integer; // Choix aléatoire d'un ennemie
    ennemie: TEnnemie; // Ennemie lors du combat

  begin
    // Choix de l'ennemie
    choixEnnemie := randomInteger(1, 3);
    case choixEnnemie of
      1: ennemie := GOBLIN;
      2: ennemie := TROLL;
      3: ennemie := ORQUE;
    end;

    commencerCombat(ennemie)
  end;
end.