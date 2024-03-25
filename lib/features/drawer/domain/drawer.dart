import 'package:equatable/equatable.dart';

class DrawerEntity extends Equatable{
  const DrawerEntity({
    this.type,
    this.items,
  });
  final String ? type;
  final List<ItemsDataEntity> ? items;

  @override
  List<Object?> get props => [type,items];
}

class ItemsDataEntity extends Equatable{
  const ItemsDataEntity({
    this.name,
    this.items,
  });
  final String? name;
  final List<ItemsDrawerEntity>? items;

  @override
  List<Object?> get props => [name,items];
}

class ItemsDrawerEntity extends Equatable{
  const ItemsDrawerEntity({
    this.item,
  });
  final String? item;
  @override
  List<Object?> get props => [item];
}