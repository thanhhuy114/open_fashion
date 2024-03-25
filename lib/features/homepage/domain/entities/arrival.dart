import 'package:equatable/equatable.dart';

class ArrivalEntity extends Equatable{
  const ArrivalEntity({
    this.name,
    this.items,
  });
  final String ? name;
  final List<ItemsEntity> ? items;

  @override
  List<Object?> get props {
    return [name,items];
  }
}

class ItemsEntity extends Equatable{
  const ItemsEntity({
    this.content,
    this.image,
    this.price,
  });
  final String ? image;
  final String ? content;
  final int ? price;

  @override
  List<Object?> get props {
    return [image,content,price];
  }
}

class JustForYouEntity extends Equatable{
  const JustForYouEntity({
    this.image,
    this.content,
    this.price,
  });

  final String ? image;
  final String ? content;
  final int ? price;

  @override
  List<Object?> get props {
    return [image,content,price];
  }
}

class FollowUsEntity extends Equatable{
  const FollowUsEntity({
    this.image,
    this.tag
  });

  final String ? image;
  final String ? tag;

  @override
  List<Object?> get props {
    return [image,tag];
  }
}