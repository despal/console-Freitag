import 'card.dart';
import 'cards.dart';
import 'deck.dart';

class game {
  //var agingStack = [];
  //var agingStackN = [];
  //var agingStackD = [];
  //var robinzonStack = [];
  //var hazardStack = [];
  //var discardRobinzon = [];
  //var discardHazard = [];
  bool isFirstRound = true;

  List<startingCard> cardToDel = [];
  List <bool> abilityInGame = [];

  var health;
  var step;
  var freeCards;
  var hazardValue;
  var fightValue;
  var deletePoints;
  //***************** NEW
  playDeck pD = new playDeck();
  hazardDeck hD = new hazardDeck();
  agingDeck aD = new agingDeck();

  //List hazardSelect = new List(2);
  List<hazardCard> hazardSelect = new List(2);
  //var currentHazard;
  hazardCard currentHazard;
  //var cardInGame = [];
  List<startingCard> cardInGame = new List();

  game(){
    /*
    for(var i in agingCard)
      agingStack.add(i);

    for(var i in startingCard)
      robinzonStack.add(i);

    for(var i in hazardCard)
      hazardStack.add(i);*/

    health = 20;
    step = 0;
    fightValue = 0;
    currentHazard = null;
  }

  String getAbility(Ability N) {
    switch(N) {
      case Ability.none:
        return '...';
      case Ability.plus1Life: // + 1 life
        return '+1 life';
      case Ability.plus2Life:
        return '+2 life';
      case Ability.double:
        return '1x double';
      case Ability.plus1Card:
        return '+1 card';
      case Ability.plus2Card:
        return '+2 cards';
      case Ability.belowTheStack:
        return '1x below the stack';
      case Ability.destroy:
        return '1x destroy';
      case Ability.exchange1x:
        return '1x exchange';
      case Ability.exchange2x:
        return '2x exchange';
      case Ability.stop:
        return 'stop';
      case Ability.sort3cards:
        return 'sort 3 cards';
      case Ability.minus1Life:
        return '-1 life';
      case Ability.minus2Life:
        return '-2 life';
      case Ability.highestCard0:
        return 'highest card = 0';
      case Ability.copy:
        return '1x copy';
      case Ability.stepMinus1:
        return 'step -1';
      default:
        return 'null';
    }
  }


    List<hazardCard> chooseHazardCard(){
      List<hazardCard> sel = new List(2);
      //choose one
      if(hD.getLength() > 0){
        sel[0] = hD.pick();
      }
      else{
        if(step < 2)
          step++;
        hD.replaceDeck();
        if(hD.getLength() > 0)
          sel[0] = hD.pick();
        else{
          sel[0] = null;
          //PIRATES!!!
        }
      }
      //choose two
      if(hD.getLength() > 0){
        sel[1] = hD.pick();
      }
      else{
        if(step < 2)
          step++;
        hD.replaceDeck();
        if(hD.getLength() > 0)
          sel[1] = hD.pick();
        else{
          sel[1] = null;
          //PIRATES!!!
        }
      }
      hazardSelect[0] = sel[0];
      hazardSelect[1] = sel[1];
      return sel;


      /*
    var r = new Random(new DateTime.now().millisecondsSinceEpoch);
    if(hazardStack.length > 1) {
      var n = r.nextInt(hazardStack.length);
      hazardSelect[0] = hazardStack[n];
      hazardStack.remove(hazardSelect[0]);
      n = r.nextInt(hazardStack.length);
      hazardSelect[1] = hazardStack[n];
      hazardStack.remove(hazardSelect[1]);
    }
    else if(hazardStack.length==1){
      hazardSelect[0] = hazardStack[0];
      if(discardHazard.length > 0) {
        for (var i in discardHazard){
          hazardStack.add(i);
        }
        discardHazard.clear();
        if(step<2)
          step++;
        var n = r.nextInt(hazardStack.length);
        hazardSelect[1] = hazardStack[n];
        hazardStack.remove(hazardSelect[1]);
      }
      else
        hazardSelect[1] = null;
    }
    else{
      if(discardHazard.length > 0){
        for(var i in discardHazard)
          hazardStack.add(i);
        discardHazard.clear();
        chooseHazardCard();
      }
      else {
        hazardSelect[0] = null;
        hazardSelect[1] = null;
      }
    }
    return hazardSelect;*/
    }
/*
  printAging(){
    for(var i in agingStack) {
      print(i);
    }
  }

  printStack(var stack){
    for(var i in stack)
      print(i);
  }
*/
    removeVSCard(){
      aD.deleteVeryStupid();
      /*
    for(var i in agingCard)
      if(i['title']=='very stupid')
        agingStack.remove(i);*/
    }
/*
  shuffleAgingCards(){
    for(var i in agingStack) {
      if(i['difficult'] == 'difficult')
        agingStackD.add(i);
      else if(i['difficult'] == 'normal')
        agingStackN.add(i);
    }
  }*/

    selectHazardCard(int N){
      if(N==0){
        currentHazard = hazardSelect[0];
        hD.add(hazardSelect[1]);
      }
      else if(N==1){
        currentHazard = hazardSelect[1];
        hD.add(hazardSelect[0]);
      }

      processHazardCard();
      /* drawRobinzonCard();*/
    }

    hazardCard getCurrentHazard()=> currentHazard;
    int getHealth()=> health;
    int getStep()=> step;

    processHazardCard(){
      hazardValue = currentHazard.getHazard(step);
      freeCards = currentHazard.getFreeCard();
/*
    var hv;
    if(step==0)
      hv = currentHazard['h_lowHazard'];
    else if(step == 1)
      hv = currentHazard['h_mediumHazard'];
    else if(step == 2)
      hv = currentHazard['h_highHazard'];
    else hv = 'error';
    hazardValue = hv;
    freeCards = currentHazard['h_freeCard'];*/
    }

    int getHazardValue()=> hazardValue;
    int getFightValue()=> fightValue;
    int getFreeCard()=> freeCards;

    drawRobinzonCard(){
      //добавить проверку свойства stop
      if(/*freeCards > 0*/true) {
        startingCard c = null;
        if(pD.getLength() > 0){
          c = pD.pick();
        }
        else{
          if(aD.getLength() > 0) {
            agingCard beard;
            beard = aD.pick();
            pD.add(beard.toStartingCard());
          }
          pD.replaceDeck();
          if(pD.getLength() > 0)
            c = pD.pick();
        }

        if(c != null){
          freeCards--;
          cardInGame.add(c);
          calcFightValue();
          abilityInGame.add(false);
        }

        /*
      var r = new Random(new DateTime.now().millisecondsSinceEpoch);
      var card;
      if (robinzonStack.length > 0) {
        freeCards--;
        if (r.nextInt(robinzonStack.length) > 1)
          card = robinzonStack[r.nextInt(robinzonStack.length)];
        else
          card = robinzonStack[0];
        cardInGame.add(card);
        robinzonStack.remove(card);
        abilityInGame.add(false);
      }
      else {
        //Кончилась колода
        if (discardRobinzon.length > 0) {
          for (var i in discardRobinzon) {
            robinzonStack.add(i);
          }
          discardRobinzon.clear();
          addBeard();
          drawRobinzonCard();
        }
      }
      calcFightValue();*/
      }
    }
    List<startingCard> getCardInGame()=> cardInGame;

    bool getAbilityInGame(int N)=> abilityInGame[N];

    List<startingCard> getCardToDel() =>cardToDel;
    int getDeletePoints() => deletePoints;

    calcFightValue(){
      //Добавить highest card = 0
      List<startingCard> cards = getCardInGame();
      int v = 0;
      for(var i in cards){
        v+= i.getFightingValue();
      }
      fightValue = v;
    }

    playCard(int N){
      if(! abilityInGame[N]) {
        Ability a = cardInGame[N].getAbility();
        switch (a) {
          case Ability.none:
            abilityInGame[N] = true;
            break;
          case Ability.plus1Life: // + 1 life
            if(health<22)
              health++;
            abilityInGame[N] = true;
            break;
          case Ability.plus2Life:
            health+=2;
            abilityInGame[N] = true;
            break;
          case Ability.double:
            break;
          case Ability.plus1Card:
            break;
          case Ability.plus2Card:
            break;
          case Ability.belowTheStack:
            break;
          case Ability.destroy:
            break;
          case Ability.exchange1x:
            break;
          case Ability.exchange2x:
            break;
          case Ability.stop:
            break;
          case Ability.sort3cards:
            break;
          case Ability.minus1Life:
            break;
          case Ability.minus2Life:
            break;
          case Ability.highestCard0:
            break;
          case Ability.copy:
            break;
          case Ability.stepMinus1:
            break;
        }
      }
    }

    fightHazard(){
      //сравнить значения?
      //если победа, то добавить карту в сброс, добавить сыгранные карты в сброс
      //если поражение, то заплатить жизнями и вернуть список карт для удаления
      if(fightValue>=hazardValue){
        //победа
        //Map c = new Map();
        pD.add(currentHazard.toStartingCard());
        /*
      'title':'ingenious',
    'fightingValue':2,
    'ability':0,
    'destroyCost':1},
    -------------------
    'h_title':'cannibal',
    'h_freeCard':5,
    'h_lowHazard':5,
    'h_mediumHazard':9,
    'h_highHazard':14,
    'k_title':'weapon',
    'k_fightingValue':4,
    'k_ability':0,
    'k_destroyCost':1},*/
        /*
      c['title'] = currentHazard['k_title'];
      c['fightingValue'] = currentHazard['k_fightingValue'];
      c['ability'] = currentHazard['k_ability'];
      c['destroyCost'] = currentHazard['k_destroyCost'];
      discardRobinzon.add(c);
      for(var i in cardInGame){
        discardRobinzon.add(i);
      }
      cardInGame.clear();*/
      }
      else{
        deletePoints = hazardValue - fightValue;
        health-=deletePoints;
        if(health>=0) {
          //var deleteCards = [];
          //discardHazard.add(currentHazard);
          hD.add(currentHazard);
          //processCardToDel();
        }
      }
      //return null;
    }

    deleteCardFromGame(int N){
      if( N < cardToDel.length && deletePoints > 0 ) {
        startingCard t = cardToDel[N];
        cardInGame.remove(t);
        processCardToDel();
        deletePoints-=t.getDestroyCost();
      }
    }

    processCardToDel(){
      cardToDel.clear();
      for(var i in cardInGame){
        if(i.getDestroyCost()<=deletePoints)
          cardToDel.add(i);
      }
    }

    processToNewRound(){
      cardInGame.clear();
      cardToDel.clear();
      deletePoints = 0;
      abilityInGame.clear();
      currentHazard = null;
      freeCards = 0;
      hazardValue = 0;
      fightValue = 0;
      hazardSelect[0] = null;
      hazardSelect[1] = null;
    }

    addBeard(){
      //Random r = new Random(new DateTime.now().millisecondsSinceEpoch);
      //Перенести в основную функцию
      /*if(isFirstRound){
      isFirstRound = false;
      //removeVSCard();
      //shuffleAgingCards();
    }*/
      pD.add(aD.pick().toStartingCard());
      /*
    if(agingStackN.length > 0){
      var t = agingStackN[r.nextInt(agingStackN.length)];
      robinzonStack.add(t);
      agingStackN.remove(t);
    }
    else if(agingStackD.length > 0){
      var t = agingStackD[r.nextInt(agingStackD.length)];
      robinzonStack.add(t);
      agingStackD.remove(t);
    }*/

  }

}

