class Option {
  Option(
      {required this.optionlabel,
      this.optionvalue,
      required this.paramsendank,
      this.value});

  dynamic optionlabel;
  dynamic optionvalue;
  dynamic paramsendank;
  dynamic value;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        optionlabel: json["optionlabel"],
        optionvalue: json["optionvalue"],
        paramsendank: json["paramsendank"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "optionlabel": optionlabel,
        "optionvalue": optionvalue,
        "paramsendank": paramsendank,
        "value": value
      };
}
