// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'collection_detail.dart';

class Collection extends Equatable {
  final String? id;
  final String? collectionName;
  final String? collectionImage;
  final List<CollectionDetail> items;
  const Collection({
    this.id,
    this.collectionName,
    this.collectionImage,
    this.items = const [],
  });

  Collection copyWith({
    String? id,
    String? collectionName,
    String? collectionImage,
    List<CollectionDetail>? items,
  }) {
    return Collection(
      id: id ?? this.id,
      collectionName: collectionName ?? this.collectionName,
      collectionImage: collectionImage ?? this.collectionImage,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collection_Name': collectionName,
      'collection_image': collectionImage,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Collection.fromMap(Map<String, dynamic> map) {
    return Collection(
      id: map['id'] != null ? map['id'] as String : null,
      collectionName: map['collection_name'] != null
          ? map['collection_name'] as String
          : null,
      collectionImage: map['collection_image'] != null
          ? map['collection_image'] as String
          : null,
      items: List<CollectionDetail>.from(
        (map['items'] as List<dynamic>).map<CollectionDetail?>(
          (x) => CollectionDetail.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Collection.fromJson(String source) =>
      Collection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, collectionName, collectionImage, items];
}
