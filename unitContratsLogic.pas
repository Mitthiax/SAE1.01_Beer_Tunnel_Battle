unit unitContratsLogic;

{$mode objfpc}{$H+}

interface
  uses
    unitCombatConst;

  type
    TContrat = record
      typeEnnemie:     TEnnemie; // Type d'ennemie à éliminer
      estAccompli:     boolean;  // True si le contrat est accompli, sinon false
      estEchoue:       boolean;  // True si le contrat est échoué, sinon false
      estAccepte:      boolean;  // True si le contrat est accepté, sinon false
      nbEnnemies:      integer;  // Nombre d'ennemies à tuer pour remplir le contrat
      nbEnnemiesTues:  integer;  // Nombre d'ennemies déjà tués par le joueur
      quantiteCuivre:  integer;  // Quantité de Cuivre  reçu après avoir remplie le contrat
      quantiteFer:     integer;  // Quantité de Fer     reçu après avoir remplie le contrat
      quantiteMythril: integer;  // Quantité de Mythril reçu après avoir remplie le contrat
      quantiteOr:      integer;  // Quantité de d'or    reçu après avoir remplie le contrat
      quantiteXP:      integer;  // Quantité de d'or    reçu après avoir remplie le contrat
    end;

    TListeContrats = array[1..3] of TContrat;

  {
    Procedure qui initialise les contrats disponibles
  }
  procedure initialiserContrats();

  {
    Procedure qui arrête le contrat on cours
  }
  procedure arreterContrat();

  {
    Procedure qui permet d'accepter un contrat
    Parametres:
      numero: integer; Numero du contrat
  }
  procedure accepterContrat(numero: integer);

  {
    Procedure qui incrémente le nombre d'ennemie tués du contrat en cours
  }
  procedure incrementeVictoire();


  {
    Fonction qui retourne la liste des contrats disponibles
    Sortie:
      TListeContrats; Liste des contrats disponibles
  }
  function getListeContrats(): TListeContrats;

  {
    Fontion qui retourne si le contrat en cours est accompli
    Sortie:
      boolean; True si le contrat en cours est accompli, sinon false
  }
  function contratAccompli(): boolean;


  {
    Fonction qui retourne le contrat en cours
    Sortie:
      TContrat; Contrat en cours
  }
  function getContratEnCours(): TContrat;




  
implementation
  uses
    SysUtils, Classes, libRandom, combat;

  var
    listeContrats: TListeContrats; // Liste des contrats disponibles
    contratEnCours: integer; // Numéro du contrat actuellement accepté

  {
    Fonction qui créer un contrat avec des caractéristiques aléatoire
    Parametres:
      ennemie: TEnnemie; Ennemie du contrat
    Sortie:
      TContrat; contrat avec des caractéristiques aléatoire
  }
  function creerContrat(ennemie: TEnnemie): TContrat;
  var
    contrat: TContrat; // Contrat créé
    i: integer; // Variable de boucle

  begin
    // Initialisation de chaque attibuts du contrats
    contrat.typeEnnemie     := ennemie;
    contrat.estAccompli     := false;
    contrat.estEchoue       := false;
    contrat.estAccepte      := false;
    contrat.nbEnnemies      := randomInteger(1, 6);
    contrat.nbEnnemiesTues  := 0;

    contrat.quantiteCuivre  := 0;
    contrat.quantiteFer     := 0;
    contrat.quantiteMythril := 0;
    contrat.quantiteOr      := 0;
    contrat.quantiteXP      := 0;

    // Les quantités dependent du nombre d'ennemies, mais on ne veut pas que ce soit un multiple
    for i := 1 to contrat.nbEnnemies do
    begin
      contrat.quantiteCuivre  += randomInteger(0, ennemie.cuivreMax);
      contrat.quantiteFer     += randomInteger(0, ennemie.ferMax);
      contrat.quantiteMythril += randomInteger(0, ennemie.mythrilMax);
      contrat.quantiteOr      += randomInteger(0, ennemie.orMax);
      contrat.quantiteXP      += randomInteger(0, ennemie.XPMax);
    end;

    // Sortie
    creerContrat := contrat;
  end;

  {
    Procedure qui initialise les contrats disponibles
  }
  procedure initialiserContrats();
  begin
    contratEnCours := 0; // Code pour aucun contrat accepter
    listeContrats[1] := creerContrat(GOBLIN);
    listeContrats[2] := creerContrat(TROLL);
    listeContrats[3] := creerContrat(ORQUE);
  end;

  {
    Procedure qui arrête le contrat on cours
  }
  procedure arreterContrat();
  begin
    listeContrats[contratEnCours].estAccepte := false;
    contratEnCours := 0;
  end;

  {
    Procedure qui permet d'accepter un contrat
    Parametres:
      numero: integer; Numero du contrat
  }
  procedure accepterContrat(numero: integer);
  begin
    if not listeContrats[numero].estEchoue and not listeContrats[numero].estAccompli then
    begin
      contratEnCours := numero;
      commencerCombat(listeContrats[contratEnCours].typeEnnemie)
    end
  end;

  {
    Procedure qui incrémente le nombre d'ennemie tués du contrat en cours
  }
  procedure incrementeVictoire();
  begin
    listeContrats[contratEnCours].nbEnnemiesTues += 1;
    if listeContrats[contratEnCours].nbEnnemiesTues = listeContrats[contratEnCours].nbEnnemies then
    begin
      listeContrats[contratEnCours].estAccompli := true;
    end;
  end;

  {
    Fonction qui retourne la liste des contrats disponibles
    Sortie:
      TListeContrats; Liste des contrats disponibles
  }
  function getListeContrats(): TListeContrats;
  begin
    getListeContrats := listeContrats;
  end;

  {
    Fontion qui retourne si le contrat en cours est accompli
    Sortie:
      boolean; True si le contrat en cours est accompli, sinon false
  }
  function contratAccompli(): boolean;
  begin
    contratAccompli := (contratEnCours <> 0) and listeContrats[contratEnCours].estAccompli;
  end;

  {
    Fonction qui retourne le contrat en cours
    Sortie:
      TContrat; Contrat en cours
  }
  function getContratEnCours(): TContrat;
  begin
    getContratEnCours := listeContrats[contratEnCours];
  end;
end.