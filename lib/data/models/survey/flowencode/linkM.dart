class Link {
  Link({
    required this.toconnector,
    required this.fromconnector
  });

  dynamic toconnector;
  dynamic fromconnector;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        toconnector: json["toConnector"], fromconnector: json["fromConnector"],
      );

  Map<String, dynamic> toJson() => {};
}
