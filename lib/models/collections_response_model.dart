import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collections_response_model.g.dart';

/* 
  Create by : Thach
  Date: 9:50 6/5
  Content: CollectionResponseModel, CollectionDetailModel, ItemOfCollectionDetail
 */
@JsonSerializable()
class CollectionsResponseModel extends Equatable {
  const CollectionsResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  final int? code;
  static const String codeKey = "code";

  final String? message;
  static const String messageKey = "message";

  final List<CollectionDetailModel>? data;
  static const String dataKey = "data";

  factory CollectionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionsResponseModelToJson(this);

  @override
  String toString() {
    return "$code, $message, $data, ";
  }

  @override
  List<Object?> get props => [
        code,
        message,
        data,
      ];
}

@JsonSerializable()
class CollectionDetailModel extends Equatable {
  CollectionDetailModel({
    required this.id,
    required this.collectionName,
    required this.collectionImage,
    required this.items,
  });

  final String? id;
  static const String idKey = "id";

  @JsonKey(name: 'collection_name')
  final String? collectionName;
  static const String collectionNameKey = "collection_name";

  @JsonKey(name: 'collection_image')
  final String? collectionImage;
  static const String collectionImageKey = "collection_image";

  final List<ItemOfCollectionModel>? items;
  static const String itemsKey = "items";

  factory CollectionDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionDetailModelToJson(this);

  @override
  String toString() {
    return "$id, $collectionName, $collectionImage, $items, ";
  }

  @override
  List<Object?> get props => [
        id,
        collectionName,
        collectionImage,
        items,
      ];
}

@JsonSerializable()
class ItemOfCollectionModel extends Equatable {
  const ItemOfCollectionModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? image;
  static const String imageKey = "image";

  final String? description;
  static const String descriptionKey = "description";

  final double? price;
  static const String priceKey = "price";

  factory ItemOfCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$ItemOfCollectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemOfCollectionModelToJson(this);

  @override
  String toString() {
    return "$id, $name, $image, $description, $price, ";
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        description,
        price,
      ];
}

/*
{
	"code": 1,
	"message": "success",
	"data": [
		{
			"id": "1",
			"collection_name": "October collection",
			"collection_image": "https://s3-alpha-sig.figma.com/img/060d/17f8/0bdff3b6644137e23e5a3d131f6e9025?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dahWDtr-ULx-5o0i-FeTEl9iziOhnIq8VcB3--t13MQCKPJuweFX181jp0coCRz4OKZ3KzbexfaOn7i22~9U6b4iSWG0dHaKHmu4bmnsSgeBpMi6RvvUKGDt9KfJS1I-LozW5yHm63-h-CLbPVJ~JA9R1nEYNeARvCf6YCeefjX8tUEB7FY2qXLtyqfV2-EAPuoFpY1uS9BmiIHpURW5ac1OEDptttVIiP5L18HFdwKBAtGcxTF~cKTljC0nNghAXD8QMhZPPrd-mhi37fmcPjSIwx6AreMEqTJEbHVSzFH7TZ7GKgJ~kunlLvQUSRj7gtmui5~~5KIkvVEsJmZLsQ__",
			"items": [
				{
					"id": 1,
					"name": "Dress",
					"image": "https://s3-alpha-sig.figma.com/img/c42a/f025/2419b604939812db05efdfa759ef59fa?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=L4IYiJpeVY4F3VuzfAmWBBngSQ2opcH8SG3muhsuj2SfNrriAgBzxCFSfigTpRQECTjvN-Jz5bleB6giviJPXv5DSLYiHsxjz3yd4RkNaSQmGP~giAWnIjCkmvhwMt7yRI~8Wb~FX81C1KdR07LpqTo3IDADwYKQF8sJ8IoCN~GWy6qZ6NuFIIFkim6qnDXWzwByI~nTQeGYnObJsZGOyt-lr2pAx~1p9brfP7UVa2lL5q-OZ1rge0vYlHWi9SEV9kV~s5mvA8Ei9cTfTW2wWZNo54oeAOUmovR06P92aT8YJMG7P5kakGrvOC9jm9OTBMzvbLP~SVx4piRwu33q8Q__",
					"description": "reversible angora cardigan",
					"price": 120
				},
				{
					"id": 2,
					"name": "Shoes",
					"image": "https://s3-alpha-sig.figma.com/img/9514/77c8/14d3ca8b1c4213897ff2f4c763cb81bf?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=pTbH~d-MkkwDFjiww0XJusmXHNn6kKPHg2zw8W3r7ws9rRnq02RyHww~4W6eZBdNtFGOM7AZPgF04rUqNzGr3DZ~LZTiAzcIABZnrl8it8zMfSdHF~~5Vt4VazcZplL7RHMygcMUZIzut-jCec-yndoK6fxUXjFImpGm6YCk~uyM2mnzT7MIcBz-HrZdiLrQGu2lWHD3SZtnj8L~AiTnLbHgg-5RS0mUBEuHVZMJgIyO1Xr79alk~EIEZLnmfmfa4Lu8Sj89Ix8~XzBpeY1oJPu7NXYuXg6CMG4apFvI5LVScz0~6330Mx1oC2Zb6U7i~I808TAf1RUZXwOsg6R8hQ__",
					"description": "reversible angora cardigan",
					"price": 490
				},
				{
					"id": 3,
					"name": "Earring",
					"image": "https://s3-alpha-sig.figma.com/img/4653/c716/57370d1cdb174ffb6df8165f0f36203e?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RLGq7WBANp7JU6EX-2qEp3GWzT~SPLSz~UfcA4pYesNrbcH~JF8PQAgGvrOyaooBJ44LWRbalFBuwX8bOTLSpf8Nfd-CiCObdhXjMAFSDt9DTrUBggHNOf6xBM0t1Q8ZnWqqCZq~g0yPDIRWEF1vBhODIdUEdAclkHT8Ewpp5ncaEExs5sOkg3iS7gFlGYKLl5Qo2TGcREmLLBjsgG0s0br9W9Gj~XUBVGNtxpmbZ8s-SczAW4KHuwOM5sQbsV2nhaVCg2O4FV2RbRlHbSYvF2ieNfb-oyGQrWohkM0R4d3kzxy5bfonn54QbyIY-C7HEGF5OKSKFOmdPVhjKyBr8w__",
					"description": "reversible angora cardigan",
					"price": 1099
				},
				{
					"id": 4,
					"name": "Rings",
					"image": "https://s3-alpha-sig.figma.com/img/c986/a388/5cb1487e6469c202d92949f130f2b916?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WnK25RDB0nSaF4m7Sqa2grUvHXJ0CRYk0sT27oQkG38u6A-QVDCWOdR4mS8KGnbdY-AF2b1mR9td-P9rz7tIATz0ICEUZ-qK1soCcOqMBFWU~N7T2Fo0QgjxoXkFnYykp0YYMdrUM74aHfQu3vmzvv09oHFfrd39-lLIMWE0Tn~SuuUjcxuZyKC7WA8JZu3A1dRUZfjnQ~OjuNbF1euSij2xmrarykUm5rOJI2XOk9BmfoGmzH7Ml19f26WFar8A4WYNtaGBazhuLe63p4wGsPgbTYw6fki4IDadrPmV3Iwy~pY7b304Bd81bnvYF8e4nb894PGtWE2iYjah39bC0g__",
					"description": "reversible angora cardigan",
					"price": 120
				},
				{
					"id": 5,
					"name": "Ring 1",
					"image": "https://s3-alpha-sig.figma.com/img/f171/d839/3aefa2851fef195b1d6492447b364b17?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WDvupIcihqSV-KZ~whxPKvIRD7Lal~-INEcg6VDMHYphsXAD9Co-1sSh7MIybeVdf5UD1NOnd2q1goz6U28SMl1HAg~txnxK4rZcFqqBED3MxZD1TDogfPT4~1s8hdcS7KDDhOYzSjKlwmuIqvghIJUAePuNA4J5pKY0Zk1VAQzxiCn5mTVTCiUuW5rl694f1IZ9EcXa~EEyF5IdWBDmkM3Jyt5UstN2cL80h~FcdNhL6d6XCigEna2UTv6-C59IAhEl7CHHQnk32kVYnTDe1ZDszGYWE~RMHlavQMEqnc8wUh0iPo~Io38jn8CeeZJr-WenkSspt-XtLbu8NzkwBQ__",
					"description": "reversible angora cardigan",
					"price": 120
				},
				{
					"id": 6,
					"name": "Ring 2",
					"image": "https://s3-alpha-sig.figma.com/img/bf3e/9664/9470359d7ed55ed1620f0771ca23b8d8?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=myS-ovVXViHHmEt64TPScURCF~H1AgbvmFTpOd0a5g145Lf7jOwe16ZHnuDMZP4XBsaN9S8XQFW5Tskrl2ZsRyJ2L3mOwSmIY4NfOk99nwlkWce1I8HUfPBBS2LG9GdEMskJYasfn~k6Mf4wiLntda~98VSpchAjU8abciGqUzXJpUCmTzKjTlhQv9xU-rQ4RBHR0w9~eCO3yaSvBO~h-GULd8lqgPUtxUQQQ1lYI5s-oXKOBFvUFPep2AX5YmYMAOYp0SOzuXKlLM9BdhbUBzUtNcKACwSAytK3payj8Bod7YjNq408ycfVk0Xi1AH9Etv-Xt-W9CyGtrKZEHJa~Q__",
					"description": "reversible angora cardigan",
					"price": 120
				}
			]
		},
		{
			"id": "1",
			"collection_name": "October collection",
			"collection_image": "https://s3-alpha-sig.figma.com/img/060d/17f8/0bdff3b6644137e23e5a3d131f6e9025?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dahWDtr-ULx-5o0i-FeTEl9iziOhnIq8VcB3--t13MQCKPJuweFX181jp0coCRz4OKZ3KzbexfaOn7i22~9U6b4iSWG0dHaKHmu4bmnsSgeBpMi6RvvUKGDt9KfJS1I-LozW5yHm63-h-CLbPVJ~JA9R1nEYNeARvCf6YCeefjX8tUEB7FY2qXLtyqfV2-EAPuoFpY1uS9BmiIHpURW5ac1OEDptttVIiP5L18HFdwKBAtGcxTF~cKTljC0nNghAXD8QMhZPPrd-mhi37fmcPjSIwx6AreMEqTJEbHVSzFH7TZ7GKgJ~kunlLvQUSRj7gtmui5~~5KIkvVEsJmZLsQ__",
			"items": [
				{
					"id": 1,
					"name": "Dress",
					"image": "https://s3-alpha-sig.figma.com/img/c42a/f025/2419b604939812db05efdfa759ef59fa?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=L4IYiJpeVY4F3VuzfAmWBBngSQ2opcH8SG3muhsuj2SfNrriAgBzxCFSfigTpRQECTjvN-Jz5bleB6giviJPXv5DSLYiHsxjz3yd4RkNaSQmGP~giAWnIjCkmvhwMt7yRI~8Wb~FX81C1KdR07LpqTo3IDADwYKQF8sJ8IoCN~GWy6qZ6NuFIIFkim6qnDXWzwByI~nTQeGYnObJsZGOyt-lr2pAx~1p9brfP7UVa2lL5q-OZ1rge0vYlHWi9SEV9kV~s5mvA8Ei9cTfTW2wWZNo54oeAOUmovR06P92aT8YJMG7P5kakGrvOC9jm9OTBMzvbLP~SVx4piRwu33q8Q__",
					"description": "reversible angora cardigan",
					"price": 120
				},
				{
					"id": 2,
					"name": "Shoes",
					"image": "https://s3-alpha-sig.figma.com/img/9514/77c8/14d3ca8b1c4213897ff2f4c763cb81bf?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=pTbH~d-MkkwDFjiww0XJusmXHNn6kKPHg2zw8W3r7ws9rRnq02RyHww~4W6eZBdNtFGOM7AZPgF04rUqNzGr3DZ~LZTiAzcIABZnrl8it8zMfSdHF~~5Vt4VazcZplL7RHMygcMUZIzut-jCec-yndoK6fxUXjFImpGm6YCk~uyM2mnzT7MIcBz-HrZdiLrQGu2lWHD3SZtnj8L~AiTnLbHgg-5RS0mUBEuHVZMJgIyO1Xr79alk~EIEZLnmfmfa4Lu8Sj89Ix8~XzBpeY1oJPu7NXYuXg6CMG4apFvI5LVScz0~6330Mx1oC2Zb6U7i~I808TAf1RUZXwOsg6R8hQ__",
					"description": "reversible angora cardigan",
					"price": 490
				},
				{
					"id": 3,
					"name": "Earring",
					"image": "https://s3-alpha-sig.figma.com/img/4653/c716/57370d1cdb174ffb6df8165f0f36203e?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RLGq7WBANp7JU6EX-2qEp3GWzT~SPLSz~UfcA4pYesNrbcH~JF8PQAgGvrOyaooBJ44LWRbalFBuwX8bOTLSpf8Nfd-CiCObdhXjMAFSDt9DTrUBggHNOf6xBM0t1Q8ZnWqqCZq~g0yPDIRWEF1vBhODIdUEdAclkHT8Ewpp5ncaEExs5sOkg3iS7gFlGYKLl5Qo2TGcREmLLBjsgG0s0br9W9Gj~XUBVGNtxpmbZ8s-SczAW4KHuwOM5sQbsV2nhaVCg2O4FV2RbRlHbSYvF2ieNfb-oyGQrWohkM0R4d3kzxy5bfonn54QbyIY-C7HEGF5OKSKFOmdPVhjKyBr8w__",
					"description": "reversible angora cardigan",
					"price": 1099
				},
				{
					"id": 4,
					"name": "Rings",
					"image": "https://s3-alpha-sig.figma.com/img/c986/a388/5cb1487e6469c202d92949f130f2b916?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WnK25RDB0nSaF4m7Sqa2grUvHXJ0CRYk0sT27oQkG38u6A-QVDCWOdR4mS8KGnbdY-AF2b1mR9td-P9rz7tIATz0ICEUZ-qK1soCcOqMBFWU~N7T2Fo0QgjxoXkFnYykp0YYMdrUM74aHfQu3vmzvv09oHFfrd39-lLIMWE0Tn~SuuUjcxuZyKC7WA8JZu3A1dRUZfjnQ~OjuNbF1euSij2xmrarykUm5rOJI2XOk9BmfoGmzH7Ml19f26WFar8A4WYNtaGBazhuLe63p4wGsPgbTYw6fki4IDadrPmV3Iwy~pY7b304Bd81bnvYF8e4nb894PGtWE2iYjah39bC0g__",
					"description": "reversible angora cardigan",
					"price": 120
				},
				{
					"id": 5,
					"name": "Ring 1",
					"image": "https://s3-alpha-sig.figma.com/img/f171/d839/3aefa2851fef195b1d6492447b364b17?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WDvupIcihqSV-KZ~whxPKvIRD7Lal~-INEcg6VDMHYphsXAD9Co-1sSh7MIybeVdf5UD1NOnd2q1goz6U28SMl1HAg~txnxK4rZcFqqBED3MxZD1TDogfPT4~1s8hdcS7KDDhOYzSjKlwmuIqvghIJUAePuNA4J5pKY0Zk1VAQzxiCn5mTVTCiUuW5rl694f1IZ9EcXa~EEyF5IdWBDmkM3Jyt5UstN2cL80h~FcdNhL6d6XCigEna2UTv6-C59IAhEl7CHHQnk32kVYnTDe1ZDszGYWE~RMHlavQMEqnc8wUh0iPo~Io38jn8CeeZJr-WenkSspt-XtLbu8NzkwBQ__",
					"description": "reversible angora cardigan",
					"price": 120
				},
				{
					"id": 6,
					"name": "Ring 2",
					"image": "https://s3-alpha-sig.figma.com/img/bf3e/9664/9470359d7ed55ed1620f0771ca23b8d8?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=myS-ovVXViHHmEt64TPScURCF~H1AgbvmFTpOd0a5g145Lf7jOwe16ZHnuDMZP4XBsaN9S8XQFW5Tskrl2ZsRyJ2L3mOwSmIY4NfOk99nwlkWce1I8HUfPBBS2LG9GdEMskJYasfn~k6Mf4wiLntda~98VSpchAjU8abciGqUzXJpUCmTzKjTlhQv9xU-rQ4RBHR0w9~eCO3yaSvBO~h-GULd8lqgPUtxUQQQ1lYI5s-oXKOBFvUFPep2AX5YmYMAOYp0SOzuXKlLM9BdhbUBzUtNcKACwSAytK3payj8Bod7YjNq408ycfVk0Xi1AH9Etv-Xt-W9CyGtrKZEHJa~Q__",
					"description": "reversible angora cardigan",
					"price": 120
				}
			]
		},
		{
			"id": "1",
			"collection_name": "October collection",
			"collection_image": "https://s3-alpha-sig.figma.com/img/060d/17f8/0bdff3b6644137e23e5a3d131f6e9025?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dahWDtr-ULx-5o0i-FeTEl9iziOhnIq8VcB3--t13MQCKPJuweFX181jp0coCRz4OKZ3KzbexfaOn7i22~9U6b4iSWG0dHaKHmu4bmnsSgeBpMi6RvvUKGDt9KfJS1I-LozW5yHm63-h-CLbPVJ~JA9R1nEYNeARvCf6YCeefjX8tUEB7FY2qXLtyqfV2-EAPuoFpY1uS9BmiIHpURW5ac1OEDptttVIiP5L18HFdwKBAtGcxTF~cKTljC0nNghAXD8QMhZPPrd-mhi37fmcPjSIwx6AreMEqTJEbHVSzFH7TZ7GKgJ~kunlLvQUSRj7gtmui5~~5KIkvVEsJmZLsQ__",
			"items": [
				{
					"id": 1,
					"name": "Dress",
					"image": "https://s3-alpha-sig.figma.com/img/c42a/f025/2419b604939812db05efdfa759ef59fa?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=L4IYiJpeVY4F3VuzfAmWBBngSQ2opcH8SG3muhsuj2SfNrriAgBzxCFSfigTpRQECTjvN-Jz5bleB6giviJPXv5DSLYiHsxjz3yd4RkNaSQmGP~giAWnIjCkmvhwMt7yRI~8Wb~FX81C1KdR07LpqTo3IDADwYKQF8sJ8IoCN~GWy6qZ6NuFIIFkim6qnDXWzwByI~nTQeGYnObJsZGOyt-lr2pAx~1p9brfP7UVa2lL5q-OZ1rge0vYlHWi9SEV9kV~s5mvA8Ei9cTfTW2wWZNo54oeAOUmovR06P92aT8YJMG7P5kakGrvOC9jm9OTBMzvbLP~SVx4piRwu33q8Q__",
					"description": "reversible angora cardigan",
					"price": 120
				},
				{
					"id": 2,
					"name": "Shoes",
					"image": "https://s3-alpha-sig.figma.com/img/9514/77c8/14d3ca8b1c4213897ff2f4c763cb81bf?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=pTbH~d-MkkwDFjiww0XJusmXHNn6kKPHg2zw8W3r7ws9rRnq02RyHww~4W6eZBdNtFGOM7AZPgF04rUqNzGr3DZ~LZTiAzcIABZnrl8it8zMfSdHF~~5Vt4VazcZplL7RHMygcMUZIzut-jCec-yndoK6fxUXjFImpGm6YCk~uyM2mnzT7MIcBz-HrZdiLrQGu2lWHD3SZtnj8L~AiTnLbHgg-5RS0mUBEuHVZMJgIyO1Xr79alk~EIEZLnmfmfa4Lu8Sj89Ix8~XzBpeY1oJPu7NXYuXg6CMG4apFvI5LVScz0~6330Mx1oC2Zb6U7i~I808TAf1RUZXwOsg6R8hQ__",
					"description": "reversible angora cardigan",
					"price": 490
				},
				{
					"id": 3,
					"name": "Earring",
					"image": "https://s3-alpha-sig.figma.com/img/4653/c716/57370d1cdb174ffb6df8165f0f36203e?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RLGq7WBANp7JU6EX-2qEp3GWzT~SPLSz~UfcA4pYesNrbcH~JF8PQAgGvrOyaooBJ44LWRbalFBuwX8bOTLSpf8Nfd-CiCObdhXjMAFSDt9DTrUBggHNOf6xBM0t1Q8ZnWqqCZq~g0yPDIRWEF1vBhODIdUEdAclkHT8Ewpp5ncaEExs5sOkg3iS7gFlGYKLl5Qo2TGcREmLLBjsgG0s0br9W9Gj~XUBVGNtxpmbZ8s-SczAW4KHuwOM5sQbsV2nhaVCg2O4FV2RbRlHbSYvF2ieNfb-oyGQrWohkM0R4d3kzxy5bfonn54QbyIY-C7HEGF5OKSKFOmdPVhjKyBr8w__",
					"description": "reversible angora cardigan",
					"price": 1099
				},
				{
					"id": 4,
					"name": "Rings",
					"image": "https://s3-alpha-sig.figma.com/img/c986/a388/5cb1487e6469c202d92949f130f2b916?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WnK25RDB0nSaF4m7Sqa2grUvHXJ0CRYk0sT27oQkG38u6A-QVDCWOdR4mS8KGnbdY-AF2b1mR9td-P9rz7tIATz0ICEUZ-qK1soCcOqMBFWU~N7T2Fo0QgjxoXkFnYykp0YYMdrUM74aHfQu3vmzvv09oHFfrd39-lLIMWE0Tn~SuuUjcxuZyKC7WA8JZu3A1dRUZfjnQ~OjuNbF1euSij2xmrarykUm5rOJI2XOk9BmfoGmzH7Ml19f26WFar8A4WYNtaGBazhuLe63p4wGsPgbTYw6fki4IDadrPmV3Iwy~pY7b304Bd81bnvYF8e4nb894PGtWE2iYjah39bC0g__",
					"description": "reversible angora cardigan",
					"price": 120
				},
				{
					"id": 5,
					"name": "Ring 1",
					"image": "https://s3-alpha-sig.figma.com/img/f171/d839/3aefa2851fef195b1d6492447b364b17?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WDvupIcihqSV-KZ~whxPKvIRD7Lal~-INEcg6VDMHYphsXAD9Co-1sSh7MIybeVdf5UD1NOnd2q1goz6U28SMl1HAg~txnxK4rZcFqqBED3MxZD1TDogfPT4~1s8hdcS7KDDhOYzSjKlwmuIqvghIJUAePuNA4J5pKY0Zk1VAQzxiCn5mTVTCiUuW5rl694f1IZ9EcXa~EEyF5IdWBDmkM3Jyt5UstN2cL80h~FcdNhL6d6XCigEna2UTv6-C59IAhEl7CHHQnk32kVYnTDe1ZDszGYWE~RMHlavQMEqnc8wUh0iPo~Io38jn8CeeZJr-WenkSspt-XtLbu8NzkwBQ__",
					"description": "reversible angora cardigan",
					"price": 120
				},
				{
					"id": 6,
					"name": "Ring 2",
					"image": "https://s3-alpha-sig.figma.com/img/bf3e/9664/9470359d7ed55ed1620f0771ca23b8d8?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=myS-ovVXViHHmEt64TPScURCF~H1AgbvmFTpOd0a5g145Lf7jOwe16ZHnuDMZP4XBsaN9S8XQFW5Tskrl2ZsRyJ2L3mOwSmIY4NfOk99nwlkWce1I8HUfPBBS2LG9GdEMskJYasfn~k6Mf4wiLntda~98VSpchAjU8abciGqUzXJpUCmTzKjTlhQv9xU-rQ4RBHR0w9~eCO3yaSvBO~h-GULd8lqgPUtxUQQQ1lYI5s-oXKOBFvUFPep2AX5YmYMAOYp0SOzuXKlLM9BdhbUBzUtNcKACwSAytK3payj8Bod7YjNq408ycfVk0Xi1AH9Etv-Xt-W9CyGtrKZEHJa~Q__",
					"description": "reversible angora cardigan",
					"price": 120
				}
			]
		}
	]
}*/