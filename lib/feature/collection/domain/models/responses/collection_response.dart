// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../collection.dart';

class CollectionResponse extends Equatable {
  final int? code;
  final String? message;
  final List<Collection> collections;
  const CollectionResponse({
    this.code,
    this.message,
    required this.collections,
  });

  CollectionResponse copyWith({
    int? code,
    String? message,
    List<Collection>? collections,
  }) {
    return CollectionResponse(
      code: code ?? this.code,
      message: message ?? this.message,
      collections: collections ?? this.collections,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'collections': collections.map((x) => x.toMap()).toList(),
    };
  }

  factory CollectionResponse.fromMap(Map<String, dynamic> map) {
    return CollectionResponse(
      code: map['code'] != null ? map['code'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      collections: List<Collection>.from(
        (map['data'] as List<dynamic>).map<Collection>(
          (x) => Collection.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionResponse.fromJson(String source) =>
      CollectionResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, message, collections];
}
