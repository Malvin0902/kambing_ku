// To parse this JSON data, do
//
//     final kambingEntry = kambingEntryFromJson(jsonString);

import 'dart:convert';

List<KambingEntry> kambingEntryFromJson(String str) => List<KambingEntry>.from(json.decode(str).map((x) => KambingEntry.fromJson(x)));

String kambingEntryToJson(List<KambingEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KambingEntry {
    String model;
    String pk;
    Fields fields;

    KambingEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory KambingEntry.fromJson(Map<String, dynamic> json) => KambingEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int userId;
    String name;
    int price;
    String description;


    Fields({
        required this.userId,
        required this.name,
        required this.price,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        userId: json["user_id"], // Disesuaikan jika nama atribut berbeda
        name: json["name"],
        price: json["price"],
        description: json["description"],
 
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "price": price,
        "description": description,

    };
}
