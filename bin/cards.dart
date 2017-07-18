var agingCards =  [
  //difficult
  { 'title':'idiot',
    'fightingValue':-4,
    'ability':0,
    'destroyCost':2,
    'difficult':'difficult'},
  { 'title':'suicidal',
    'fightingValue':-5,
    'ability':0,
    'destroyCost':2,
    'difficult':'difficult'},
  { 'title':'very hungry',
    'fightingValue':0,
    'ability':14,
    'destroyCost':2,
    'difficult':'difficult'},
  //normal
  { 'title':'unfocused',
    'fightingValue':-1,
    'ability':0,
    'destroyCost':2,
    'difficult':'normal'},
  { 'title':'stupid',
    'fightingValue':-2,
    'ability':0,
    'destroyCost':2,
    'difficult':'normal'},
  { 'title':'stupid',
    'fightingValue':-2,
    'ability':0,
    'destroyCost':2,
    'difficult':'normal'},
  { 'title':'very stupid',
    'fightingValue':-3,
    'ability':0,
    'destroyCost':2,
    'difficult':'normal'},
  { 'title':'scared',
    'fightingValue':0,
    'ability':15,
    'destroyCost':2,
    'difficult':'normal'},
  { 'title':'scared',
    'fightingValue':0,
    'ability':15,
    'destroyCost':2,
    'difficult':'normal'},
  { 'title':'hungry',
    'fightingValue':0,
    'ability':13,
    'destroyCost':2,
    'difficult':'normal'},
  { 'title':'very tired',
    'fightingValue':0,
    'ability':16,
    'destroyCost':2,
    'difficult':'normal'}
];

var startingCards =  [
  { 'title':'ingenious',
    'fightingValue':2,
    'ability':0,
    'destroyCost':1},
  { 'title':'focused',
    'fightingValue':1,
    'ability':0,
    'destroyCost':1},
  { 'title':'focused',
    'fightingValue':1,
    'ability':0,
    'destroyCost':1},
  { 'title':'focused',
    'fightingValue':1,
    'ability':0,
    'destroyCost':1},
  { 'title':'normal',
    'fightingValue':0,
    'ability':0,
    'destroyCost':1},
  { 'title':'normal',
    'fightingValue':0,
    'ability':0,
    'destroyCost':1},
  { 'title':'normal',
    'fightingValue':0,
    'ability':0,
    'destroyCost':1},
  { 'title':'normal',
    'fightingValue':0,
    'ability':0,
    'destroyCost':1},
  { 'title':'normal',
    'fightingValue':0,
    'ability':0,
    'destroyCost':1},
  { 'title':'normal',
    'fightingValue':0,
    'ability':0,
    'destroyCost':1},
  { 'title':'normal',
    'fightingValue':0,
    'ability':0,
    'destroyCost':1},
  { 'title':'normal',
    'fightingValue':0,
    'ability':0,
    'destroyCost':1},
  { 'title':'unfocused',
    'fightingValue':-1,
    'ability':0,
    'destroyCost':1},
  { 'title':'unfocused',
    'fightingValue':-1,
    'ability':0,
    'destroyCost':1},
  { 'title':'unfocused',
    'fightingValue':-1,
    'ability':0,
    'destroyCost':1},
  { 'title':'unfocused',
    'fightingValue':-1,
    'ability':0,
    'destroyCost':1},
  { 'title':'unfocused',
    'fightingValue':-1,
    'ability':0,
    'destroyCost':1},
  { 'title':'food',
    'fightingValue':0,
    'ability':2,
    'destroyCost':1},
];

var hazardCards = [
  { 'h_title':'cannibal',
    'h_freeCard':5,
    'h_lowHazard':5,
    'h_mediumHazard':9,
    'h_highHazard':14,
    'k_title':'weapon',
    'k_fightingValue':4,
    'k_ability':0,
    'k_destroyCost':1},
  { 'h_title':'cannibal',
    'h_freeCard':5,
    'h_lowHazard':5,
    'h_mediumHazard':9,
    'h_highHazard':14,
    'k_title':'weapon',
    'k_fightingValue':4,
    'k_ability':0,
    'k_destroyCost':1},
  { 'h_title':'wild animals',
    'h_freeCard':4,
    'h_lowHazard':4,
    'h_mediumHazard':7,
    'h_highHazard':11,
    'k_title':'strategy',
    'k_fightingValue':3,
    'k_ability':10,
    'k_destroyCost':1},
  { 'h_title':'wild animals',
    'h_freeCard':4,
    'h_lowHazard':4,
    'h_mediumHazard':7,
    'h_highHazard':11,
    'k_title':'vision',
    'k_fightingValue':3,
    'k_ability':9,
    'k_destroyCost':1},
  { 'h_title':'wild animals',
    'h_freeCard':4,
    'h_lowHazard':4,
    'h_mediumHazard':7,
    'h_highHazard':11,
    'k_title':'experience',
    'k_fightingValue':3,
    'k_ability':3,
    'k_destroyCost':1},
  { 'h_title':'wild animals',
    'h_freeCard':4,
    'h_lowHazard':4,
    'h_mediumHazard':7,
    'h_highHazard':11,
    'k_title':'knowledge',
    'k_fightingValue':3,
    'k_ability':5,
    'k_destroyCost':1},
  { 'h_title':'explore deep island',
    'h_freeCard':3,
    'h_lowHazard':2,
    'h_mediumHazard':5,
    'h_highHazard':8,
    'k_title':'repetition',
    'k_fightingValue':2,
    'k_ability':6,
    'k_destroyCost':1},
  { 'h_title':'explore deep island',
    'h_freeCard':3,
    'h_lowHazard':2,
    'h_mediumHazard':5,
    'h_highHazard':8,
    'k_title':'food',
    'k_fightingValue':2,
    'k_ability':1,
    'k_destroyCost':1},
  { 'h_title':'explore deep island',
    'h_freeCard':3,
    'h_lowHazard':2,
    'h_mediumHazard':5,
    'h_highHazard':8,
    'k_title':'strategy',
    'k_fightingValue':2,
    'k_ability':10,
    'k_destroyCost':1},
  { 'h_title':'explore deep island',
    'h_freeCard':3,
    'h_lowHazard':2,
    'h_mediumHazard':5,
    'h_highHazard':8,
    'k_title':'vision',
    'k_fightingValue':2,
    'k_ability':9,
    'k_destroyCost':1},
  { 'h_title':'explore deep island',
    'h_freeCard':3,
    'h_lowHazard':2,
    'h_mediumHazard':5,
    'h_highHazard':8,
    'k_title':'knowledge',
    'k_fightingValue':2,
    'k_ability':5,
    'k_destroyCost':1},
  { 'h_title':'explore deep island',
    'h_freeCard':3,
    'h_lowHazard':2,
    'h_mediumHazard':5,
    'h_highHazard':8,
    'k_title':'experience',
    'k_fightingValue':2,
    'k_ability':3,
    'k_destroyCost':1},
  { 'h_title':'explore island',
    'h_freeCard':2,
    'h_lowHazard':1,
    'h_mediumHazard':3,
    'h_highHazard':6,
    'k_title':'weapon',
    'k_fightingValue':2,
    'k_ability':0,
    'k_destroyCost':1},
  { 'h_title':'explore island',
    'h_freeCard':2,
    'h_lowHazard':1,
    'h_mediumHazard':3,
    'h_highHazard':6,
    'k_title':'weapon',
    'k_fightingValue':2,
    'k_ability':0,
    'k_destroyCost':1},
  { 'h_title':'explore island',
    'h_freeCard':2,
    'h_lowHazard':1,
    'h_mediumHazard':3,
    'h_highHazard':6,
    'k_title':'food',
    'k_fightingValue':1,
    'k_ability':1,
    'k_destroyCost':1},
  { 'h_title':'explore island',
    'h_freeCard':2,
    'h_lowHazard':1,
    'h_mediumHazard':3,
    'h_highHazard':6,
    'k_title':'food',
    'k_fightingValue':1,
    'k_ability':1,
    'k_destroyCost':1},
  { 'h_title':'explore island',
    'h_freeCard':2,
    'h_lowHazard':1,
    'h_mediumHazard':3,
    'h_highHazard':6,
    'k_title':'trick',
    'k_fightingValue':1,
    'k_ability':12,
    'k_destroyCost':1},
  { 'h_title':'explore island',
    'h_freeCard':2,
    'h_lowHazard':1,
    'h_mediumHazard':3,
    'h_highHazard':6,
    'k_title':'repetition',
    'k_fightingValue':1,
    'k_ability':6,
    'k_destroyCost':1},
  { 'h_title':'explore island',
    'h_freeCard':2,
    'h_lowHazard':1,
    'h_mediumHazard':3,
    'h_highHazard':6,
    'k_title':'knowledge',
    'k_fightingValue':1,
    'k_ability':5,
    'k_destroyCost':1},
  { 'h_title':'explore island',
    'h_freeCard':2,
    'h_lowHazard':1,
    'h_mediumHazard':3,
    'h_highHazard':6,
    'k_title':'mimicry',
    'k_fightingValue':1,
    'k_ability':7,
    'k_destroyCost':1},
  { 'h_title':'wreck boat',
    'h_freeCard':1,
    'h_lowHazard':0,
    'h_mediumHazard':1,
    'h_highHazard':3,
    'k_title':'strategy',
    'k_fightingValue':0,
    'k_ability':11,
    'k_destroyCost':1},
  { 'h_title':'wreck boat',
    'h_freeCard':1,
    'h_lowHazard':0,
    'h_mediumHazard':1,
    'h_highHazard':3,
    'k_title':'strategy',
    'k_fightingValue':0,
    'k_ability':11,
    'k_destroyCost':1},
  { 'h_title':'wreck boat',
    'h_freeCard':1,
    'h_lowHazard':0,
    'h_mediumHazard':1,
    'h_highHazard':3,
    'k_title':'equipment',
    'k_fightingValue':0,
    'k_ability':4,
    'k_destroyCost':1},
  { 'h_title':'wreck boat',
    'h_freeCard':1,
    'h_lowHazard':0,
    'h_mediumHazard':1,
    'h_highHazard':3,
    'k_title':'equipment',
    'k_fightingValue':0,
    'k_ability':4,
    'k_destroyCost':1},
  { 'h_title':'wreck boat',
    'h_freeCard':1,
    'h_lowHazard':0,
    'h_mediumHazard':1,
    'h_highHazard':3,
    'k_title':'food',
    'k_fightingValue':0,
    'k_ability':1,
    'k_destroyCost':1},
  { 'h_title':'wreck boat',
    'h_freeCard':1,
    'h_lowHazard':0,
    'h_mediumHazard':1,
    'h_highHazard':3,
    'k_title':'food',
    'k_fightingValue':0,
    'k_ability':1,
    'k_destroyCost':1},
  { 'h_title':'wreck boat',
    'h_freeCard':1,
    'h_lowHazard':0,
    'h_mediumHazard':1,
    'h_highHazard':3,
    'k_title':'mimicry',
    'k_fightingValue':0,
    'k_ability':7,
    'k_destroyCost':1},
  { 'h_title':'wreck boat',
    'h_freeCard':1,
    'h_lowHazard':0,
    'h_mediumHazard':1,
    'h_highHazard':3,
    'k_title':'knowledge',
    'k_fightingValue':0,
    'k_ability':5,
    'k_destroyCost':1},
  { 'h_title':'wreck boat',
    'h_freeCard':1,
    'h_lowHazard':0,
    'h_mediumHazard':1,
    'h_highHazard':3,
    'k_title':'trick',
    'k_fightingValue':0,
    'k_ability':12,
    'k_destroyCost':1},
  { 'h_title':'wreck boat',
    'h_freeCard':1,
    'h_lowHazard':0,
    'h_mediumHazard':1,
    'h_highHazard':3,
    'k_title':'reader',
    'k_fightingValue':0,
    'k_ability':8,
    'k_destroyCost':1},
];

var abilityList = [
  '...',
  '+1 life',
  '+2 life',
  '+1 card',
  '+2 card',
  '1x destroy',
  '1x double',
  '1x copy',
  'step -1',
  'sort 3 cards',
  '1x exchange',
  '2x exchange',
  '1x below the stack',
  '-1 life',
  '-2 life',
  'highest card = 0',
  'stop'
];
enum Ability{
  none,
  plus1Life,
  plus2Life,
  plus1Card,
  plus2Card,
  destroy,
  double,
  copy,
  stepMinus1,
  sort3cards,
  exchange1x,
  exchange2x,
  belowTheStack,
  minus1Life,
  minus2Life,
  highestCard0,
  stop
}