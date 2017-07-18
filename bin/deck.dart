import 'card.dart';
import 'cards.dart';
import 'dart:math';

class deck{

  Ability createAbility(int a){
    Ability ab = null;
    switch(a){
      case 0: ab = Ability.none;
        break;
      case 1: ab = Ability.plus1Life;
      break;
      case 2: ab = Ability.plus2Life;
      break;
      case 3: ab = Ability.plus1Card;
      break;
      case 4: ab = Ability.plus2Card;
      break;
      case 5: ab = Ability.destroy;
      break;
      case 6: ab = Ability.double;
      break;
      case 7: ab = Ability.copy;
      break;
      case 8: ab = Ability.stepMinus1;
      break;
      case 9: ab = Ability.sort3cards;
      break;
      case 10: ab = Ability.exchange1x;
      break;
      case 11: ab = Ability.exchange2x;
      break;
      case 12: ab = Ability.belowTheStack;
      break;
      case 13: ab = Ability.minus1Life;
      break;
      case 14: ab = Ability.minus2Life;
      break;
      case 15: ab = Ability.highestCard0;
      break;
      case 16: ab = Ability.stop;
      break;
    }
    return ab;
  }

}
class playDeck extends deck{
  List<startingCard> deck;
  List<startingCard> discard;

  playDeck(){
    for(var i in startingCards ){
      deck.add(new startingCard(i['title'], i['fightingValue'], createAbility(i['ability']), i['destroyCost']));
    }
  }

  replaceDeck(){
    if(discard.length>0){
      for(var i in discard)
        deck.add(i);
      discard.clear();
    }
  }

  add(startingCard sC ){
    if(sC != null)
      discard.add(sC);
  }

  startingCard pick(){
    Random r = new Random(new DateTime.now().millisecondsSinceEpoch);
    startingCard c = null;
    if(deck.length>0){
      c = deck[r.nextInt(deck.length)];
      deck.remove(c);
    }
    return c;
  }

  getLength()=>deck.length;
}

class hazardDeck extends deck{
  List<hazardCard> deck;
  List<hazardCard> discard;

  hazardDeck(){
    for(var i in hazardCards ){
      //{ 'h_title' 'h_freeCard' 'h_lowHazard' 'h_mediumHazard' 'h_highHazard' 'k_title' 'k_fightingValue' 'k_ability' 'k_destroyCost'
      //String h_t, int fC, int lowHV, int medHV, int highHV
      deck.add(new hazardCard(i['k_title'], i['k_fightingValue'],createAbility(i['k_ability']), i['k_destroyCost'], i['h_title'],i['h_freeCard'],i['h_lowHazard'],i['h_mediumHazard'],i['h_highHazard']));
    }
  }

  replaceDeck(){
    if(deck.length == 0 && discard.length>0){
      for(var i in discard)
        deck.add(i);
      discard.clear();
    }
  }

  add(hazardCard hC){
    if(hC != null)
      discard.add(hC);
  }

  hazardCard pick(){
    Random r = new Random(new DateTime.now().millisecondsSinceEpoch);
    //List<hazardCard> c;
    hazardCard c;
    if(deck.length>0){
      c = deck[r.nextInt(deck.length)];
    }
    else
      c = null;
    return c;
    /*
    if(deck.length>1){
      c[0] = deck[r.nextInt(deck.length)];
      deck.remove(c[0]);
      c[1] = deck[r.nextInt(deck.length)];
      deck.remove(c[1]);
    }
    else if(deck.length == 1){
      c[0] = deck[0];
      deck.remove(c[0]);
      if(discard.length>0) {
        c[1] = discard[r.nextInt(discard.length)];
        discard.remove(c[1]);
      }
      else
        c[1] = null;
    }
    else{
      c[0] = null;
      c[1] = null;
    }
    return c;*/
  }

  getLength()=>deck.length;
}

class agingDeck extends deck{
  List<agingCard> normal;
  List<agingCard> difficult;

  agingDeck(){
    for(var i in agingCards ){
      if(i['difficult'] == 'normal')
        normal.add(new agingCard(i['title'], i['fightingValue'],createAbility(i['ability']), i['destroyCost']));
      else if(i['difficult'] == 'difficult')
        difficult.add(new agingCard(i['title'], i['fightingValue'], createAbility(i['ability']), i['destroyCost']));
    }
  }

  deleteVeryStupid(){
    for(var i in normal)
      if(i.getTitle() == 'very stupid')
        normal.remove(i);
  }

/*
  replaceDeck(){
    if(discard.length>0){
      for(var i in discard)
        deck.add(i);
      discard.clear();
    }
  }*/
/*
  add(startingCard sC ){
    discard.add(sC);
  }*/

  agingCard pick(){
    Random r = new Random(new DateTime.now().millisecondsSinceEpoch);
    agingCard c = null;
    if(normal.length>0){
      c = normal[r.nextInt(normal.length)];
      normal.remove(c);
    }
    else if(difficult.length>0) {
      c = difficult[r.nextInt(difficult.length)];
      difficult.remove(c);
    }
    return c;
  }

  getLength()=>(normal.length+difficult.length);
}