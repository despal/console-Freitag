import 'cards.dart';

class card{
  String title;
  int fightingValue;
  Ability ability;
  int destroyCost;

  getTitle()=>title;
  getFightingValue()=>fightingValue;
  getAbility()=>ability;
  getDestroyCost()=>destroyCost;

  card(String t, int fV, Ability a, int dC){
    title = t;
    fightingValue = fV;
    destroyCost = dC;
    ability = a;
  }

  card.forHazard(String t,int fV, Ability a, int dC,String h_t, int fC, int lowHV, int medHV, int highHV){

  }

  startingCard toStartingCard(){
    startingCard c;
    c.setTitle(title);
    c.setFightingValue(fightingValue);
    c.setAbility(ability);
    c.setDestroyCost(destroyCost);
    return c;
  }

  setTitle(String t)=> title = t;
  setFightingValue(int f)=>fightingValue = f;
  setAbility(Ability a)=>ability = a;
  setDestroyCost(int d)=>destroyCost = d;

}

class agingCard extends card{
  agingCard(String t, int fV, Ability a, int dC) : super(t, fV, a, dC);


}

class startingCard extends card{
  startingCard(String t, int fV, Ability a, int dC) : super(t, fV, a, dC);
  
}

class hazardCard extends card{
  String h_title;
  int freeCard;
  int lowHazard;
  int medHazard;
  int highHazard;

  hazardCard(String t,int fV, Ability a, int dC,String h_t, int fC, int lowHV, int medHV, int highHV) : super.forHazard(t, fV, a, dC, h_t, fC, lowHV, medHV, highHV){
    title = t;
    fightingValue = fV;
    ability = a;
    destroyCost = dC;
    h_title = h_t;
    freeCard = fC;
    lowHazard = lowHV;
    medHazard = medHV;
    highHazard = highHV;
  }

  getHazard(int S){
    switch(S){
      case 0:
        return lowHazard;
      case 1:
        return medHazard;
      case 2:
        return highHazard;
      default:
        return null;
    }
  }
  getHTitle()=>h_title;
  getFreeCard()=>freeCard;
  /*getLowHazard()=>lowHazard;
  getMedHazard()=>medHazard;
  getHighHazard()=>highHazard;*/
}