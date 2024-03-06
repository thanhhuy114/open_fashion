import 'package:flutter/material.dart';

/*
  Create by: Thach
  Date: 17:05 6/3
  Content: Item của phần gợi ý các collection
 */
class SuggestionCollectionItem extends StatelessWidget {
  const SuggestionCollectionItem({
    super.key,
    required this.image,
    required this.collectionName,
  });
  final String image;
  final String collectionName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: 255,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          Container(
            width: 255,
            height: 255 / (3 / 4),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),

          //Collection Name
          Text(
            collectionName.toUpperCase(),
            style: const TextStyle(
              fontSize: 17,
              height: 2,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(252, 252, 252, 1),
            ),
          ),
        ],
      ),
    );
  }
}
