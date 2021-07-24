class Mp3Rutten {
  //  i  t  mp3   (t = index, t = time)
  //  0  1  bell3x
  //  1  7  getreadyin5
  //  2  2  round1
  //  3  1  four
  //  4  1  jab
  //  5  2  rightstraightlefthook
  //  6  2  rightstraightlefthookrightstraight
  //  7  2  lefthookrightuppercut
  //  8  2  lefthookrightuppercutlefthook
  //  9  2  threeandalefthook
  // 10  2  threeandalefthookrightstraight
  // 11  2  twoandarightstraight
  // 12  2  fourandarightstraight
  // 13  1  threehooks
  // 14  2  twoandathree
  // 15  1  onetwo


  List _mp3Rutten = [
    // 0 = 0 weil 1 ist Start
    ['1', '0', '0', '0', 'mp3/bell3x.mp3'],
    ['7', '0', '0', '0', 'mp3/basrutten/getreadyin5.mp3'],
    ['2', '0', '0', '0', 'mp3/basrutten/round1.mp3'],
    ['1', '0', '0', '0', 'mp3/basrutten/four.mp3'],
    ['1', '0', '0', '0', 'mp3/basrutten/jab.mp3'],
    ['2', '0', '0', '0', 'mp3/basrutten/rightstraightlefthook.mp3'],
    ['2', '0', '0', '0', 'mp3/basrutten/rightstraightlefthookrightstraight.mp3'],
    ['2', '0', '0', '0', 'mp3/basrutten/lefthookrightuppercut.mp3'],
    ['2', '0', '0', '0', 'mp3/basrutten/lefthookrightuppercutlefthook.mp3'],
    ['2', '0', '0', '0', 'mp3/basrutten/threeandalefthook.mp3'],
    ['2', '0', '0', '0', 'mp3/basrutten/threeandalefthookrightstraight.mp3'],
    ['2', '0', '0', '0', 'mp3/basrutten/twoandarightstraight.mp3'],
    ['2', '0', '0', '0', 'mp3/basrutten/fourandarightstraight.mp3'],
    ['1', '0', '0', '0', 'mp3/basrutten/threehooks.mp3'],
    ['2', '0', '0', '0', 'mp3/basrutten/twoandathree.mp3'],
    ['1', '0', '0', '0', 'mp3/basrutten/onetwo.mp3'],
  ];
  get mp3Rutten => _mp3Rutten;
}