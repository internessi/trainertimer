class TrainingProcessWolf {
//  0 bell2
//  1 3kocks
//  2 5sekunden
//  3 again
//  4 bell
//  5 bell2
//  6 bell3
//  7 four
//  8 fourrightstraight
//  9 fourtworightstraight
// 10 indro
// 11 jab
// 12 jabjab
// 13 lefthookrightstraight
// 14 lefthookuppercut
// 15 leftstraight
// 16 livershoot
// 17 livershootrighthooklefthook
// 18 livershootrightstraight
// 19 rightbodyshoot
// 20 rightbodyshootlefthook
// 21 rightstraight
// 22 rightstraightlefthook
// 23 rightstraightlefthookrightstraight
// 24 round1
// 25 three
// 26 threehooks
// 27 threehooksuppercut
// 28 threerightstraight
// 29 two
// 30 tworightstraight
// 31 uppercutlefthook
// 32 uppercutrightstraight
// 33 3knocks



  List<int> _preTime = [
    // 0 = 0 weil 1 ist Start
    0,  0,  0,  0,  0,  0,  2,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0, 10, // jaja zählen und so
  ];
  get preTime => _preTime ;

  List<int> _act120 = [
    // 0 = 0 weil 1 ist Start
     0,  0, 24,  0, 11,  0, 21,  0, 29,  0,
     0, 30,  0,  0, 25,  0,  0, 28,  0,  0,
    26,  0,  0, 27,  0,  0,  0,  7,  0,  0,

     8,  0,  0,  9,  0,  0, 11,  0, 12,  0,
    13,  0, 14,  0, 16,  0, 17,  0,  0, 18,
     0, 19,  0, 20,  0,  0, 21,  0, 22,  0,

    23,  0,  0, 31,  0,  0, 32,  0,  3,  0,
     0,  7,  0,  0,  8,  0,  0,  9,  0,  0,
    12,  0,  7,  0,  0, 23,  0,  0, 12,  0,

    0, 11,  0, 29,  0, 25,  0,  0,  7,  0,
    0,  3,  0, 26,  0, 23,  0,  7,  0,  1,
    9,  0,  0,  0,  17,  0,  0,  7,  0,  0,

    0,  0, // jaja zählen und so
  ];
  get act120 => _act120;
}