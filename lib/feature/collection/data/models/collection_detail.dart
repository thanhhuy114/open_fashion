// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import '../../domain/entities/collection_detail_entity.dart';

class CollectionDetail extends CollectionDetailEntity {
  final int? id;
  final String? name;
  final String? image;
  final String? description;
  final double? price;
  const CollectionDetail({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
  }) : super(
          id: id,
          image: image,
          description: description,
          name: name,
          price: price,
        );

  CollectionDetail copyWith({
    int? id,
    String? name,
    String? image,
    String? description,
    double? price,
  }) {
    return CollectionDetail(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
    };
  }

  factory CollectionDetail.fromMap(Map<String, dynamic> map) {
    return CollectionDetail(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionDetail.fromJson(String source) =>
      CollectionDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  factory CollectionDetail.fromEntity(CollectionDetailEntity entity) {
    return CollectionDetail(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      image: entity.image,
      description: entity.description,
    );
  }
}
