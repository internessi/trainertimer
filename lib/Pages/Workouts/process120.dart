class TrainingProcess {
  //  i  t  mp3   (t = index, t = time)
  //  0  7  getreadyin5
  //  1  2  round1
  //  2  1  four
  //  3  1  jab
  //  4  2  rightstraightlefthook
  //  5  2  rightstraightlefthookrightstraight
  //  6  2  lefthookrightuppercut
  //  7  2  lefthookrightuppercutlefthook
  //  8  2  threeandalefthook
  //  9  2  threeandalefthookrightstraight
  // 10  2  twoandarightstraight
  // 11  2  fourandarightstraight
  // 12  1  threehooks
  // 13  2  twoandathree
  // 14  1  onetwo


  List<int> _pre20 = [
    // 0 = 0 weil 1 ist Start
    0,  0,  0,  0,  0,  0,  0,  1,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0, // jaja zählen und so
  ];
  get pre20 => _pre20 ;

  List<int> _act120 = [
    // 0 = 0 weil 1 ist Start
    0,  2,  0,  3,  0,  0,  5,  0,  6,  0,
    0,  5,  0,  0, 15,  0,  0,  4,  4,  0,
    4,  4,  0, 15,  0,  0,  7,  0,  0,  8,

    0,  0, 13,  0,  3,  0,  0,  3,  0,  0,
    11,  0,  0,  5,  0,  0, 13,  0,  8,  0,
    0, 10,  0,  0,  4,  4,  0, 15,  0,  0,

    11, 0,  0,  3,  0,  0, 12,  0,  0, 14,
     0, 0,  3,  0,  0,  8,  0,  4,  5,  0,
     5, 0, 13,  0,  0,  3,  0,  0, 10,  0,

     0, 10,  0,  0,  7,  0,  5,  0,  3,  0,
     0, 13,  0,  8,  0,  5,  0,  4,  4,  0,
    15,  0, 13,  0,  6,  0,  0,  3,  0,  0,

    0,  0, // jaja zählen und so
  ];
  get act120 => _act120;
}