unit unitContratsLogic;
{Role: Partie métier des contrat.}
{$mode objfpc}{$H+}

interface
  uses
    unitCombatConst;

  type
    TStatut = (Disponibles, Accepte, Accompli, Echoue);

    TContrat = record
      typeEnnemi:     TEnnemi; // Type d'ennemi à éliminer
      statut:          TStatut;  // Statut du contrat
      nbEnnemis:      integer;  // Nombre d'ennemis à tuer pour remplir le contrat
      nbEnnemisTues:  integer;  // Nombre d'ennemis déjà tués par le joueur
      quantiteCuivre:  integer;  // Quantité de Cuivre  reçu après avoir remplie le contrat
      quantiteFer:     integer;  // Quantité de Fer     reçu après avoir remplie le contrat
      quantiteMythril: integer;  // Quantité de Mythril reçu après avoir remplie le contrat
      quantiteOr:      integer;  // Quantité de d'or    reçu après avoir remplie le contrat
      quantiteXP:      integer;  // Quantité de d'or    reçu après avoir remplie le contrat
    end;

    TListeContrats = array[1..3] of TContrat;

  //Procédure qui initialise les contrats disponibles
  procedure initialiserContrats();

  //Procédure qui arrête le contrat on cours
  procedure arreterContrat();

  //Procédure qui permet d'accomplir le contrat on cours
  procedure accomplirContrat();

  //Procédure qui fait écchouer le contrat en courd
  procedure echouerContrat();

  {
    Procédure qui permet d'accepter un contrat
    Parametres:
      numero: integer; Numero du contrat
  }
  procedure accepterContrat(numero: integer);

  //Procédure qui incrémente le nombre d'ennemi tués du contrat en cours
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
    Fonction qui retourne si un contrat est actuellement accepté
    Sortie:
      boolean; True si un contrat est accepté, sinon false
  }
  function contratAccepte(): boolean;


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
      ennemi: TEnnemi; Ennemi du contrat
    Sortie:
      TContrat; contrat avec des caractéristiques aléatoire
  }
  function creerContrat(ennemi: TEnnemi): TContrat;
  var
    contrat: TContrat; // Contrat créé

  begin
    // Initialisation de chaque attibuts du contrats
    contrat.typeEnnemi      := ennemi;
    contrat.statut          := Disponibles;
    contrat.nbEnnemis       := randomInteger(1, 6);
    contrat.nbEnnemisTues   := 0;

    contrat.quantiteCuivre  := 0;
    contrat.quantiteFer     := 0;
    contrat.quantiteMythril := 0;
    contrat.quantiteOr      := 0;
    contrat.quantiteXP      := 0;

    // Les quantités des ressources sont aléatoires entre 25% et 100% (exclu) des récompences maximum des ennemis
    contrat.quantiteCuivre  := round(contrat.nbEnnemis * ennemi.cuivreMax * randomReal(0.25, 1));
    contrat.quantiteFer     := round(contrat.nbEnnemis * ennemi.ferMax * randomReal(0.25, 1));
    contrat.quantiteMythril := round(contrat.nbEnnemis * ennemi.mythrilMax * randomReal(0.25, 1));
    contrat.quantiteOr      := round(contrat.nbEnnemis * ennemi.orMax * randomReal(0.25, 1));
    contrat.quantiteXP      := round(contrat.nbEnnemis * ennemi.XPMax * randomReal(0.25, 1));

    // Sortie
    creerContrat := contrat;
  end;

  //Procédure qui initialise les contrats disponibles
  procedure initialiserContrats();
  begin
    contratEnCours := 0; // Code pour aucun contrat accepter
    listeContrats[1] := creerContrat(GOBLIN);
    listeContrats[2] := creerContrat(TROLL);
    listeContrats[3] := creerContrat(ORC);
  end;

  //Procédure qui arrête le contrat on cours
  procedure arreterContrat();
  begin
    if contratEnCours <> 0 then
    begin
      listeContrats[contratEnCours].statut := Disponibles;
      contratEnCours := 0;
    end;
  end;

  //Procédure qui permet d'accomplir le contrat on cours
  procedure accomplirContrat();
  begin
    if contratEnCours <> 0 then
    begin
      listeContrats[contratEnCours].statut := Accompli;
      contratEnCours := 0;
    end;
  end;

  //Procédure qui fait écchouer le contrat en courd
  procedure echouerContrat();
  begin
    if contratEnCours <> 0 then
    begin
      listeContrats[contratEnCours].statut := Echoue;
      contratEnCours := 0;
    end;
  end;

  {
    Procédure qui permet d'accepter un contrat
    Parametres:
      numero: integer; Numero du contrat
  }
  procedure accepterContrat(numero: integer);
  begin
    if listeContrats[numero].statut = Disponibles then
    begin
      arreterContrat();
      contratEnCours := numero;
      listeContrats[contratEnCours].statut := Accepte;
    end
    else if listeContrats[numero].statut = Accepte then arreterContrat();
  end;

  //Procédure qui incrémente le nombre d'ennemi tués du contrat en cours
  procedure incrementeVictoire();
  begin
    listeContrats[contratEnCours].nbEnnemisTues += 1;
    if listeContrats[contratEnCours].nbEnnemisTues = listeContrats[contratEnCours].nbEnnemis then
    begin
      listeContrats[contratEnCours].statut := Accompli;
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
    contratAccompli := (contratEnCours <> 0) and (listeContrats[contratEnCours].statut = Accompli);
  end;

  {
    Fonction qui retourne si un contrat est actuellement accepté
    Sortie:
      boolean; True si un contrat est accepté, sinon false
  }
  function contratAccepte(): boolean;
  begin
    contratAccepte := contratEnCours <> 0;
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
