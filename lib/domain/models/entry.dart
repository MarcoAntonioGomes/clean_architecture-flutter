import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class Entry {

  @primaryKey
  int id;
  String name;
  String image;
  String description;
  String commonLocations;
  String category;

//<editor-fold desc="Data Methods">
  Entry({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.commonLocations,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Entry &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          image == other.image &&
          description == other.description &&
          commonLocations == other.commonLocations &&
          category == other.category);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      description.hashCode ^
      commonLocations.hashCode ^
      category.hashCode;

  @override
  String toString() {
    return 'Entry{' +
        ' id: $id,' +
        ' name: $name,' +
        ' image: $image,' +
        ' description: $description,' +
        ' commonLocations: $commonLocations,' +
        ' category: $category,' +
        '}';
  }

  Entry copyWith({
    int? id,
    String? name,
    String? image,
    String? description,
    String? commonLocations,
    String? category,
  }) {
    return Entry(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      commonLocations: commonLocations ?? this.commonLocations,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'image': this.image,
      'description': this.description,
      'commonLocations': this.commonLocations,
      'category': this.category,
    };
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      commonLocations: jsonEncode(map['common_locations'] ?? ['Sem localização']),
      category: map['category'] as String,
    );
  }

  List<String> commomLocationsConverter(){
    return (jsonDecode(commonLocations) as List<dynamic>).map((e) => e as String).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "image": this.image,
      "description": this.description,
      "commonLocations": this.commonLocations,
      "category": this.category,
    };
  }

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      id: int.parse(json["id"]),
      name: json["name"],
      image: json["image"],
      description: json["description"],
      commonLocations: json["commonLocations"],
      category: json["category"],
    );
  }
//

//</editor-fold>
}