// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'collection_detail_entity.dart';

class CollectionEntity extends Equatable {
  final String? id;
  final String? collectionName;
  final String? collectionImage;
  final List<CollectionDetailEntity> items;
  const CollectionEntity({
    this.id,
    this.collectionName,
    this.collectionImage,
    required this.items,
  });

  @override
  List<Object?> get props => [id, collectionName, collectionImage, items];
}
