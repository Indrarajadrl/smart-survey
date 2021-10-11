class TokenSurvey {
  late String ct;
  late String iv;
  late String s;

  TokenSurvey({required this.ct, required this.iv, required this.s});

  TokenSurvey.fromJson(Map<String, dynamic> json) {
    ct = json['ct'];
    iv = json['iv'];
    s = json['s'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ct'] = ct;  
    data['iv'] = iv;
    data['s'] = s;
    return data;
  }
}
