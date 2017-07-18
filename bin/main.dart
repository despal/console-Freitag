// Copyright (c) 2017, user. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'card.dart';
import 'dart:io';
import 'game.dart';

game Game = new game();
main(List<String> arguments) {

  //Game.removeVSCard();
  //Game.shuffleAgingCards();
  // select one of two Hazard card
  bool okAnswer,playingGame;
  playingGame = true;
  List<hazardCard> hCards = new List(2);
  //Удаляем карту very stupid
  Game.removeVSCard();
  //Выбираем карту угрозы:
  while(playingGame) {
    Game.processToNewRound();
    hCards = Game.chooseHazardCard();
    printHazard(hCards);
    okAnswer = false;
    while (!okAnswer) {
      var action = stdin.readLineSync();
      switch (action) {
        case '1':
          print('you select first card to fight!');
          Game.selectHazardCard(0);
          okAnswer = true;
          break;
        case '2':
          print('you select second card to fight!');
          Game.selectHazardCard(1);
          okAnswer = true;
          break;
        default:
          print('unknown command, try again');
      }
    }
    //fight with hazard
    //printGame();
    okAnswer = false;
    while (!okAnswer) {
      printGame();
      var action = stdin.readLineSync();
      var num = int.parse(action, onError: (action) => null);
      if (num != null) {
        //сыграть карту номером...
        Game.playCard(num - 1);
      }
      else {
        switch (action) {
          case 'draw':
            Game.drawRobinzonCard();
            break;
          case 'end':
            okAnswer = true;
            break;
          case 'fight':
            Game.fightHazard();
            var toDel = [];
            toDel = Game.getCardToDel();
            if (toDel.length == 0) {
              if (Game.getHealth() < 0) {
                stdout.writeln('You lose');
                return 0;
              }
              //перейти к следующему туру игры
              okAnswer = true;
              break;
            }
            else {
              //int tmp = (Game.getHazardValue()-Game.getFightValue());
              //stdout.writeln('You can select card to delete it from the game for ['+tmp.toString()+'] points (enter numbers or exit)');

              bool goON = true;
              while (goON) {
                //int r = 0;
                printLine('═');
                stdout.writeln(
                    'You can select card to delete it from the game for [' +
                        Game.getDeletePoints().toString() +
                        '] points (enter numbers or exit)');
                printLine('═');
                int N = 0;
                for (var i in toDel) {
                  N++;
                  stdout.writeln(N.toString() + i.toString());
                }
                var delAction = stdin.readLineSync();
                var delNum = int.parse(delAction, onError: (delAction) => null);
                if (delNum != null) {
                  Game.deleteCardFromGame(delNum - 1);
                }
                else {
                  if (delAction == 'exit') {
                    goON = false;
                    //подготовиться к новому раунду
                    okAnswer = true;
                  }
                  else
                    stdout.writeln('enter numbers or type exit');
                }
                //tmp = tmp-r;
                toDel = Game.getCardToDel();
                if (Game.getDeletePoints() <= 0) {
                  goON = false;
                  okAnswer = true;
                }
              }
            }
            //срабатывают плохие свойства.
            break;
        }
      }
      // printGame();
    }
  }

}

printLine(var c,[int N]){
  if(N==null)
    N = 144;
  for(var i=0;i<N;i++)
  {
    stdout.write(c);
  }
  stdout.write('\n');
}

printHazard(List<hazardCard> card){
  printLine('═');
  printByWidth(' ', 24);
  printByWidth('      Card 1', 24);
  printByWidth('      Card 2', 24);
  stdout.writeln('');
  printLine('─');
  printByWidth('Title', 24);
  if(card[0] != null)
    printByWidth(card[0].getHTitle(), 24);
  else
    printByWidth('NULL', 24);
  if(card[1] != null)
    printByWidth(card[1].getHTitle(), 24);
  else
    printByWidth('NULL', 24);
  stdout.writeln('');
  printByWidth('Draw cards:', 24);
  if(card[0] != null)
    printByWidth(card[0].getFreeCard().toString(), 24);
  else
    printByWidth('NULL', 24);
  if(card[1] != null)
    printByWidth(card[1].getFreeCard().toString(), 24);
  else
    printByWidth('NULL', 24);
  stdout.writeln('');
  printByWidth('Hazard Value:', 24);
  if(card[0] != null)
    printByWidth(card[0].getHazard(Game.getStep()).toString(), 24);
  else
    printByWidth('NULL', 24);
  if(card[1] != null)
    printByWidth(card[1].getHazard(Game.getStep()).toString(), 24);
  else
    printByWidth('NULL', 24);
  stdout.writeln('');
  printLine('─');
  printByWidth('Title:', 24);
  if(card[0] != null)
    printByWidth(card[0].getTitle(), 24);
  else
    printByWidth('NULL', 24);
  if(card[1] != null)
    printByWidth(card[1].getTitle(), 24);
  else
    printByWidth('NULL', 24);
  stdout.writeln('');
  printByWidth('Fighting Value:', 24);
  if(card[0] != null)
    printByWidth(card[0].getFightingValue().toString(), 24);
  else
    printByWidth('NULL', 24);
  if(card[1] != null)
    printByWidth(card[1].getFightingValue().toString(), 24);
  else
    printByWidth('NULL', 24);
  stdout.writeln('');
  printByWidth('Ability:', 24);
  if(card[0] != null)
    printByWidth(Game.getAbility(card[0].getAbility()), 24);
  else
    printByWidth('NULL', 24);
  if(card[1] != null)
    printByWidth(Game.getAbility(card[1].getAbility()), 24);
  else
    printByWidth('NULL', 24);
  stdout.writeln('');
  printLine('═');
  print('select one to fight (print 1 or 2)');
}

printGame(){
  printLine('═');

  printByWidth('       Hazard side', 36);
  printByWidth('    Knowledge side', 36);
  printByWidth('Stats:', 18);
  printByWidth('     Fighting', 30);
  stdout.writeln('');
  printLine('─');

  printByWidth('Title:', 14);
  printByWidth(Game.getCurrentHazard().getHTitle(), 20);
  printByWidth('Title:', 14);
  printByWidth(Game.getCurrentHazard().getTitle(), 20);
  printByWidth('Health:', 12);
  printByWidth(Game.getHealth().toString(), 4);
  printByWidth('hazard:    /    fight value:', 30);
  stdout.writeln('');

  printByWidth('Hazard value:', 14);
  printByWidth(Game.getHazardValue().toString(), 20);
  printByWidth('Fight point:', 14);
  printByWidth(Game.getCurrentHazard().getFightingValue().toString(), 20);
  printByWidth('Free cards:', 12);
  printByWidth(Game.getFreeCard().toString(), 4);
  printByWidth('     '+Game.getHazardValue().toString()+'     /     '+Game.getFightValue().toString(), 30);
  stdout.writeln('');

  printByWidth('Free cards:', 14);
  printByWidth(Game.getCurrentHazard().getFreeCard().toString(), 20);
  printByWidth('Ability:', 14);
  printByWidth(Game.getAbility(Game.getCurrentHazard().getAbility()), 20);
  printByWidth(' ', 12);
  printByWidth(' ', 4);
  printByWidth(' ', 30);
  stdout.writeln('');
  printLine('═');

  var cards = Game.getCardInGame();
  int n = 0;
  printByWidth('   Cards in game:', 40);
  printByWidth('Not played abilities', 20);
  printByWidth('  Played abilities', 20);
  stdout.writeln('');
  printLine('─');
  for(var i in cards){
    String str;
    str = (n+1).toString()+' '+ i.getTitle()+' / '+
        i.getFightingValue().toString()+' / '+
        Game.getAbility(i.getAbility()) + ' / '+
        i.getDestroyCost().toString();
    printByWidth(str, 40);

    bool a = Game.getAbilityInGame(n);
    str = '';
      if( !a)
        str = Game.getAbility(i.getAbility());
      else
        str = ' ';
    printByWidth(str, 20);
      if( a)
        str = Game.getAbility(i.getAbility());
      else
        str = ' ';
    printByWidth(str, 20);
    stdout.writeln('');
    n++;
  }
}

printByWidth(String str, int W){
  int t = str.length.toInt();
  stdout.write(str);
  for(int i = 0; i<W-t; i++)
    stdout.write(' ');
  stdout.write('║ ');
}