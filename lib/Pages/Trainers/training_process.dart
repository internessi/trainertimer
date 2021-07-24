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

  List<int> _process120 = [
    // 0 = 0 weil 1 ist Start
     0,  1,  0,  2,  0,  0,  4,  0,  5,  0,
     0,  4,  0,  0, 14,  0,  0,  3,  3,  0,
     3,  3,  0, 14,  0,  0,  6,  0,  0,  7,

     0,  0, 12,  0,  2,  0,  0,  2,  0,  0,
    11,  0,  0,  4,  0,  0, 12,  0,  8,  0,
     0,  9,  0,  0,  3,  3,  0, 14,  0,  0,

    10,  0,  0,  2,  0,  0, 11,  0,  0, 13,
     0,  0,  2,  0,  0,  7,  0,  3,  4,  0,
     4,  0, 12,  0,  0,  2,  0,  0,  9,  0,

     0,  9,  0,  0,  6,  0,  4,  0,  2,  0,
     0, 12,  0,  7,  0,  4,  0,  3,  3,  0,
    14,  0, 12,  0,  5,  0,  0,  2,  0,  0,

     0,  0, // jaja zählen und so
  ];
  get process120 => _process120;
}
