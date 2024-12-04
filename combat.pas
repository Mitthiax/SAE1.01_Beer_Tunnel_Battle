unit combat;
{Role: Permet au joueur de combattre.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
  uses
    unitCombatConst;
  {
    Procedure qui comme un combat contre un ennemi aléatoire
    Parametres:
      ennemi: TEnnemi; Ennemi lors du combat
  }
  procedure commencerCombat(ennemi: TEnnemi);

  //Procedure qui commence un combat contre un ennemi aléatoire
  procedure commencerCombat();

implementation
  uses
    SysUtils, Classes, GestionPerso, unitCoffreLogic, unitCombatIHM, libRandom, gestionbuff, Inventaire, unitHallIhm, unitContratsLogic, unitMineLogic;

    
  //fonction qui calcule les dégats infliger à l'ennemi 
  function degatInfliger():integer;
  var
  degatmit:integer;
  begin
    if random(15+getlevel())>2 then // on fait un jeu de harsard pour savoir si on réussi le coup ou pas (la probalisité augmente avec le niveau)
    begin
      degatmit:= getAttaqueJoueur()+random(5+getlevel()); //on donne la possibilité de mettre plus de dégats (une sorte de coup critique) (la probalisité augmente avec le niveau)
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
    if random(30-getlevel())<>0 then //on laisse une chance au joueur d'esquiver le coup
    begin
      degatrecureal:=couprecu+random(11-getlevel());//Augmente les degats que l'ennemi inflige (la probabilité baisse avec le niveau)
      degatrecureal:=degatrecureal-(degatrecureal*((getDefenceJoueur()+getBuffResistanceMax)/100));//calcul les degats reçu avec le bonus de protection
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

  //Procedure qui permet d'attaquer l'ennemi
  procedure attaquer(var ennemi: TEnnemi);
  var
    degats: integer; // Dégats infligées à l'ennemi

  begin
    degats := degatInfliger();
    ennemi.PV -= degats;
    afficherAttaque(degats, ennemi.nom);
  end;

  {
    Procedure qui permet à l'ennemi d'attaquer le joueur
    Parametres:
      ennemi: TEnnemi; Ennemi du combat
  }
  procedure attaqueEnnemi(var ennemi: TEnnemi);
  var
    degats: integer; // Dégats subits par le joueur
    
  begin
    degats := subirdegats(ennemi.degats);
    gestionSante(degats);
    afficherAttaqueEnnemi(degats, ennemi.nom);
  end;

  {
    Procedure qui lance une bombe sur l'ennemi et lui inflige de dégats
    Parametres:
      ennemi: TEnnemi; Ennemi du combat
  }
  procedure lancerBombe(var ennemi: TEnnemi);
  var
    degats: integer; // Dégats infligées à l'ennemi
    
  begin
    if getinvent(bombe) > 0 then
    begin
        setinvent(bombe, getinvent(bombe) - 1);
        degats := round(30 * randomReal(0.9, 1.1));
        ennemi.PV -= degats;
        afficherBombe(degats, ennemi.nom);
    end
    else afficherBombeVide();
  end;

  //Procedure qui fait boire une potion qui soigne le joueur
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
  function tenterFuite(var ennemi: TEnnemi): boolean;
  var
    fuiteReussie: boolean; // True si une fuite à été réussi, false sinon

  begin
    fuiteReussie := randomReal(1) < 0.2;

    if fuiteReussie then
    begin
      echouerContrat();
      afficherFuite();
    end

    else
    begin
      afficherFuiteRatee(ennemi.nom);
      attaqueEnnemi(ennemi);
    end;

    tenterFuite := fuiteReussie;
  end;
  
  {
    Fonction qui gère un tour de combat et retourne si le combat est terminé
    Parametres:
      ennemi: TEnnemi; Ennemi du combat
  }
  function tourCombat(var ennemi: TEnnemi): boolean;
  var
    choix: integer; // Choix du joueur lors du tour de combat
    estTermine: boolean; // True si le combat est terminer, false sinon

  begin
    estTermine := false;

    choix := combatIHM(ennemi);

    case choix of
      1: attaquer(ennemi);
      2: lancerBombe(ennemi);
      3: boirePotion();
      4: estTermine := tenterFuite(ennemi);
    end;

    // On termine le combat si l'ennemi est mort
    if ennemi.PV <= 0 then estTermine := true;

    // Si le combat n'est pas terminé, l'ennemi attaque
    if not estTermine then attaqueEnnemi(ennemi);

    tourCombat := estTermine
  end;

  {
    Procedure qui comme un combat contre un ennemi aléatoire
    Parametres:
      ennemi: TEnnemi; Ennemi lors du combat
  }
  procedure commencerCombat(ennemi: TEnnemi);
  var
    estTermine: boolean; // True si le joueur est mort, false sinon

  begin
    estTermine := false;

    // Modification des points de vie et dégats, pour des valeur plus aléatoires
    ennemi.PV := round(ennemi.PV * randomReal(0.75, 1.25));
    ennemi.degats := round(ennemi.degats * randomReal(0.75, 1.25));

    while (not estTermine) do estTermine := tourCombat(ennemi);
    
    if ennemi.PV <= 0 then incrementeVictoire();
    ouvrirMine();
  end;

  //Procedure qui comme un combat contre un ennemi aléatoire
  procedure commencerCombat();
  var
    choixEnnemi: integer; // Choix aléatoire d'un ennemi
    ennemi: TEnnemi; // Ennemi lors du combat

  begin
    // Choix de l'ennemi
    choixEnnemi := randomInteger(1, 3);
    case choixEnnemi of
      1: ennemi := GOBLIN;
      2: ennemi := TROLL;
      3: ennemi := ORC;
    end;

    commencerCombat(ennemi)
  end;
end.
