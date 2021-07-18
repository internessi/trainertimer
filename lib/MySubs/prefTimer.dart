class StoreTimer {
  final String lab1, pre1, act1, reg1, rnd1;


  const StoreTimer({
    required this.lab1,
    required this.pre1,
    required this.act1,
    required this.reg1,
    required this.rnd1,
  });

  StoreTimer copy({
    String? lab1,
    String? pre1,
    String? act1,
    String? reg1,
    String? rnd1,
  }) =>
      StoreTimer(
        lab1: pre1 ?? this.pre1,
        pre1: pre1 ?? this.pre1,
        act1: act1 ?? this.act1,
        reg1: reg1 ?? this.reg1,
        rnd1: rnd1 ?? this.rnd1,
      );

  static StoreTimer fromJson(Map<String, dynamic> json) => StoreTimer(
    lab1: json['lab1'],
    pre1: json['pre1'],
    act1: json['act1'],
    reg1: json['reg1'],
    rnd1: json['rnd1'],
  );

  Map<String, dynamic> toJson() => {
    'lab1': lab1,
    'pre1': pre1,
    'act1': act1,
    'reg1': reg1,
    'rnd1': rnd1,
  };
}
