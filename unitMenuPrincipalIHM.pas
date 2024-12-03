unit unitMenuPrincipalIHM;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  {
    IHM de l'écran de fermeture du jeu
  }
  procedure quitterIHM();

  {
    IHM du menu principal
    1 -> Lancer une partie
    sinon quitter
    Renvoi:
      Choix de l'utilisateur
  }
  function menuIHM():integer;
  
implementation
  uses
    GestionEcran;

  {
    Procedure qui dessine une chope de bière
  }
procedure dessinerChope();
begin
  deplacerCurseurXY(35,5); couleurFond(Yellow); write('        '); 
  deplacerCurseurXY(44,5); couleurFond(Yellow); write('      ');
  deplacerCurseurXY(68,5); couleurFond(white); write('     ');

  deplacerCurseurXY(31,6); couleurFond(Yellow); write('    '); 
  deplacerCurseurXY(49,6); couleurFond(Yellow); write('     '); 
  deplacerCurseurXY(66,6); couleurFond(white); write('  ');
  deplacerCurseurXY(71,6); couleurFond(white); write('  ');

  deplacerCurseurXY(27,7); couleurFond(Yellow); write('               '); 
  deplacerCurseurXY(46,7); couleurFond(Yellow); write('          '); 
  deplacerCurseurXY(63,7); couleurFond(white); write('   ');
  deplacerCurseurXY(72,7); couleurFond(white); write('   ');  

  deplacerCurseurXY(26,8); couleurFond(Yellow); write('   '); 
  deplacerCurseurXY(33,8); couleurFond(Yellow); write('   '); 
  deplacerCurseurXY(45,8); couleurFond(Yellow); write('           '); 
  deplacerCurseurXY(62,8); couleurFond(white); write('  ');
  deplacerCurseurXY(73,8); couleurFond(white); write('    ');

  deplacerCurseurXY(24,9); couleurFond(Yellow); write('   '); 
  deplacerCurseurXY(43,9); couleurFond(Yellow); write('   '); 
  deplacerCurseurXY(53,9); couleurFond(Yellow); write('    '); 
  deplacerCurseurXY(59,9); couleurFond(white); write('    ');
  deplacerCurseurXY(76,9); couleurFond(white); write('     ');

  deplacerCurseurXY(23,10); couleurFond(Yellow); write('   '); 
  deplacerCurseurXY(54,10); couleurFond(Yellow); write('    '); 
  deplacerCurseurXY(59,10); couleurFond(white); write('   ');
  deplacerCurseurXY(77,10); couleurFond(white); write('    ');

  deplacerCurseurXY(23,11); couleurFond(Yellow); write('   '); 
  deplacerCurseurXY(40,11); couleurFond(Yellow); write('    '); 
  deplacerCurseurXY(54,11); couleurFond(Yellow); write('  '); 
  deplacerCurseurXY(59,11); couleurFond(white); write('   ');
  deplacerCurseurXY(80,11); couleurFond(white); write('  ');

  deplacerCurseurXY(25,12); couleurFond(Yellow); write('        '); 
  deplacerCurseurXY(36,12); couleurFond(Yellow); write('     '); 
  deplacerCurseurXY(43,12); couleurFond(Yellow); write('   '); 
  deplacerCurseurXY(52,12); couleurFond(Yellow); write('   '); 
  deplacerCurseurXY(60,12); couleurFond(white); write('   ');
  deplacerCurseurXY(80,12); couleurFond(white); write('    ');

   
  deplacerCurseurXY(26,13); couleurFond(white); write('  '); 
  deplacerCurseurXY(54,13); couleurFond(white); write('  ');
  deplacerCurseurXY(63,13); couleurFond(white); write('  ');
  deplacerCurseurXY(83,13); couleurFond(white); write('   ');

  deplacerCurseurXY(20,14); couleurFond(white); write('        ');
  deplacerCurseurXY(54,14); couleurFond(white); write('  ');
  deplacerCurseurXY(64,14); couleurFond(white); write('    ');
  deplacerCurseurXY(84,14); couleurFond(white); write('  ');

  deplacerCurseurXY(18,15); couleurFond(white); write('         ');
  deplacerCurseurXY(54,15); couleurFond(white); write('  ');
  deplacerCurseurXY(63,15); couleurFond(white); write('      ');
  deplacerCurseurXY(82,15); couleurFond(white); write('    ');

  deplacerCurseurXY(16,16); couleurFond(white); write('                ');
  deplacerCurseurXY(49,16); couleurFond(white); write('       ');
  deplacerCurseurXY(61,16); couleurFond(white); write('   ');
  deplacerCurseurXY(66,16); couleurFond(white); write('     ');
  deplacerCurseurXY(80,16); couleurFond(white); write('   ');

  deplacerCurseurXY(16,17); couleurFond(white); write('       ');
  deplacerCurseurXY(25,17); couleurFond(white); write('            ');
  deplacerCurseurXY(44,17); couleurFond(white); write('            ');
  deplacerCurseurXY(59,17); couleurFond(white); write('    ');
  deplacerCurseurXY(64,17); couleurFond(white); write('    ');
  deplacerCurseurXY(70,17); couleurFond(white); write('   ');
  deplacerCurseurXY(78,17); couleurFond(white); write('    ');

  deplacerCurseurXY(16,18); couleurFond(white); write('     ');
  deplacerCurseurXY(25,18); couleurFond(white); write('  ');
  deplacerCurseurXY(36,18); couleurFond(white); write('         ');
  deplacerCurseurXY(49,18); couleurFond(white); write('    ');
  deplacerCurseurXY(54,18); couleurFond(white); write('  ');
  deplacerCurseurXY(58,18); couleurFond(white); write('  ');
  deplacerCurseurXY(62,18); couleurFond(white); write('  ');
  deplacerCurseurXY(72,18); couleurFond(white); write('  ');
  deplacerCurseurXY(77,18); couleurFond(white); write('  ');

  deplacerCurseurXY(16,19); couleurFond(white); write('     ');
  deplacerCurseurXY(25,19); couleurFond(white); write('  ');
  deplacerCurseurXY(31,19); couleurFond(white); write('                   ');
  deplacerCurseurXY(54,19); couleurFond(white); write('     ');
  deplacerCurseurXY(61,19); couleurFond(white); write('   ');
  deplacerCurseurXY(73,19); couleurFond(white); write('     ');

  deplacerCurseurXY(16,20); couleurFond(white); write('     ');
  deplacerCurseurXY(25,20); couleurFond(white); write('  ');
  deplacerCurseurXY(37,20); couleurFond(white); write('       ');
  deplacerCurseurXY(54,20); couleurFond(white); write('   ');
  deplacerCurseurXY(59,20); couleurFond(white); write('   ');

  deplacerCurseurXY(16,21); couleurFond(white); write('     ');
  deplacerCurseurXY(25,21); couleurFond(white); write('  ');  
  deplacerCurseurXY(54,21); couleurFond(white); write('  ');
  deplacerCurseurXY(57,21); couleurFond(white); write('   ');

  deplacerCurseurXY(16,22); couleurFond(white); write('     ');
  deplacerCurseurXY(25,22); couleurFond(white); write('  ');  
  deplacerCurseurXY(54,22); couleurFond(white); write('     ');

  deplacerCurseurXY(16,23); couleurFond(white); write('     ');
  deplacerCurseurXY(25,23); couleurFond(white); write('  ');  
  deplacerCurseurXY(54,23); couleurFond(white); write('  ');

  deplacerCurseurXY(16,24); couleurFond(white); write('      ');
  deplacerCurseurXY(25,24); couleurFond(white); write('    ');
  deplacerCurseurXY(52,24); couleurFond(white); write('    ');

  deplacerCurseurXY(17,25); couleurFond(white); write('  ');
  deplacerCurseurXY(21,25); couleurFond(white); write('  ');
  deplacerCurseurXY(25,25); couleurFond(white); write('  ');
  deplacerCurseurXY(28,25); couleurFond(white); write('    ');
  deplacerCurseurXY(49,25); couleurFond(white); write('    ');
  deplacerCurseurXY(54,25); couleurFond(white); write('  ');


  deplacerCurseurXY(17,26); couleurFond(white); write('   ');
  deplacerCurseurXY(22,26); couleurFond(white); write('                                  ');

  deplacerCurseurXY(19,27); couleurFond(white); write('    ');
  deplacerCurseurXY(24,27); couleurFond(white); write('   ');
  deplacerCurseurXY(29,27); couleurFond(white); write('                        ');
  deplacerCurseurXY(54,27); couleurFond(white); write('  ');

  deplacerCurseurXY(22,28); couleurFond(white); write('     ');
  deplacerCurseurXY(36,28); couleurFond(white); write('         ');
  deplacerCurseurXY(55,28); couleurFond(white); write('   ');

  deplacerCurseurXY(23,29); couleurFond(white); write('     ');
  deplacerCurseurXY(55,29); couleurFond(white); write('   ');

  deplacerCurseurXY(23,30); couleurFond(white); write('     ');
  deplacerCurseurXY(55,30); couleurFond(white); write('   ');

  deplacerCurseurXY(23,31); couleurFond(white); write('     ');
  deplacerCurseurXY(55,31); couleurFond(white); write('   ');

  deplacerCurseurXY(25,32); couleurFond(white); write('     ');
  deplacerCurseurXY(53,32); couleurFond(white); write('   ');

  deplacerCurseurXY(27,33); couleurFond(white); write('          ');
  deplacerCurseurXY(44,33); couleurFond(white); write('          ');

  deplacerCurseurXY(30,34); couleurFond(white); write('                     ');

  
end;

  {
    IHM de l'écran de fermeture du jeu
  }
  procedure quitterIHM();
  begin
    effacerEcran();
    dessinerChope();
    attendre(250);
  end;

  {
    IHM du menu principal
    1 -> Lancer une partie
    sinon quitter
    Renvoi:
      Choix de l'utilisateur
  }
  function menuIHM():integer;
  var
    choix: integer; // Choix du joueur

  begin
    effacerEtColorierEcran(Black);
    changerTailleConsole(200,40);
    dessinerCadreXY(101, 15, 139, 25, double, White, Black);
    deplacerCurseurXY(108, 18); write('##########################');
    deplacerCurseurXY(108, 19); write('#                        #');
    deplacerCurseurXY(108, 20); write('#  Beer Tunnels Battles  #');
    deplacerCurseurXY(108, 21); write('#                        #');
    deplacerCurseurXY(108, 22); write('##########################');

    deplacerCurseurXY(111, 29); write('1/ Nouvelle partie');
    deplacerCurseurXY(111, 31); write('0/ Quitter');

    dessinerChope();
    
    repeat
      dessinerCadreXY(117, 35, 123, 37, simple, White, Black);
      deplacerCurseurXY(120, 36); readln(choix);
    until (0 <= choix) and (choix <= 1);

    menuIHM := choix;
  end;

end.
