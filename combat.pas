unit combat;

{$mode objfpc}{$H+}

interface
  uses
    unitCombatConst;
  {
    Procedure qui comme un combat contre un ennemie
    Parametre:
      ennemie: TEnnemie; Type d'ennemie
  }
  procedure commencerCombat(ennemie: TEnnemie);

implementation
  uses
    SysUtils, Classes, GestionPerso, unitCoffreLogic, unitCombatIHM;

    
  //fonction qui calcule les dégats infliger à l'ennemie 
  function degatInfliger():integer;
  var
  degatmit:integer;
  begin
    if random(15+level)>2 then // on fait un jeu de harsard pour savoir si on réussi le coup ou pas(les chances sont augmenter avec le niveau)
    begin
      degatmit:= getAttaqueJoueur()+random(5+level); //on donne la possibilité de mettre plus de dégats (une sorte de coup critique)(augmenter avec le niveau)
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
    if random(30-level)<>0 then //on laisse une chance au joueur d'esquiver le coup(c'est petit un nain aussi, ça peut se baisser)
    begin
      degatrecureal:=couprecu+random(11-level);//Augmente les degats que l'ennemie inflige (bah oui pourquoi ça serais que dans 1 sens lui aussi il a le droit au coup critique)(baisse avec le niveau)
      degatrecureal:=degatrecureal-(degatrecureal*(getDefenceJoueur()/100));//calcul les degats reçu avec le bonus de protection (svp faites en sortes que la deffense depasse pas 100 sinon il risque de give des points de vie)
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

  procedure lancerBombe();
  begin
    
  end;

  procedure boirePotion();
  begin
    
  end;

  procedure tenterFuite();
  begin
    
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
    a: integer;

  begin
    estTermine := false;

    choix := combatIHM();

    case choix of
      1: ennemie.PV-=degatInfliger();
      2: lancerBombe();
      3: boirePotion();
      4: tenterFuite();
    end;

    a := degatInfliger();

    if ennemie.PV <= 0 then estTermine := true;

    if not estTermine then gestionSante(subirdegats(ennemie.degats));

    tourCombat := estTermine
  end;

  {
    Procedure qui comme un combat contre un ennemie
    Parametre:
      ennemie: TEnnemie; Type d'ennemie
  }
  procedure commencerCombat(ennemie: TEnnemie);
  var
    estTermine: boolean; // True si le joueur est mort, false sinon

  begin
    estTermine := false;
    while (not estTermine) do estTermine := tourCombat(ennemie);
    if ennemie.PV <= 0 then write('Gagné');
  end;


end.