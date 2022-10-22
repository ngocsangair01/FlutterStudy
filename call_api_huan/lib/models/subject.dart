
import 'dart:convert';

class ApiSubject {
  ApiSubject({
    required this.status,
    required this.data,
  });

  final String status;
  final Data data;

  factory ApiSubject.fromRawJson(String str) => ApiSubject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiSubject.fromJson(Map<String, dynamic> json) => ApiSubject(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.items,
  });

  final List<Item> items;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.id,
    required this.name,
    required this.avatar,
    required this.description,
  });

  final int id;
  final String name;
  final String avatar;
  final String description;

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
    "description": description,
  };
}
