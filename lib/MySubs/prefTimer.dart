class StoreTimer {
  final String lab1, pre1, act1, reg1, rnd1, ico1;
  final String lab2, pre2, act2, reg2, rnd2, ico2;

  const StoreTimer({
    required this.lab1, required this.pre1, required this.act1, required this.reg1, required this.rnd1, required this.ico1,
    required this.lab2, required this.pre2, required this.act2, required this.reg2, required this.rnd2, required this.ico2,

  });

  StoreTimer copy({
    String? lab1, String? pre1, String? act1, String? reg1, String? rnd1, String? ico1,
    String? lab2, String? pre2, String? act2, String? reg2, String? rnd2, String? ico2,
  }) =>
      StoreTimer(
        lab1: pre1 ?? this.pre1, pre1: pre1 ?? this.pre1, act1: act1 ?? this.act1, 
        reg1: reg1 ?? this.reg1, rnd1: rnd1 ?? this.rnd1, ico1: ico1 ?? this.ico1,
        lab2: pre2 ?? this.pre2, pre2: pre2 ?? this.pre2, act2: act2 ?? this.act2,
        reg2: reg2 ?? this.reg2, rnd2: rnd2 ?? this.rnd2, ico2: ico2 ?? this.ico2,
      );

  static StoreTimer fromJson(Map<String, dynamic> json) => StoreTimer(
    lab1: json['lab1'], pre1: json['pre1'], act1: json['act1'], 
    reg1: json['reg1'], rnd1: json['rnd1'], ico1: json['ico1'],
    lab2: json['lab2'], pre2: json['pre2'], act2: json['act2'],
    reg2: json['reg2'], rnd2: json['rnd2'], ico2: json['ico2'],
  );

  Map<String, dynamic> toJson() => {
    'lab1': lab1, 'pre1': pre1, 'act1': act1, 'reg1': reg1, 'rnd1': rnd1, 'ico1': ico1,
    'lab2': lab2, 'pre2': pre2, 'act2': act2, 'reg2': reg2, 'rnd2': rnd2, 'ico2': ico2,
  };
}
