// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class CollectionDetailEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? description;
  final double? price;
  const CollectionDetailEntity({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      description,
      price,
    ];
  }
}
