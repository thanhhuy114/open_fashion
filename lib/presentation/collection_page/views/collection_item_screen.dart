import 'package:flutter/material.dart';

/* 
  Create by: Thach
  Date: 11:00 6/5,
  Content: Item of Collection screen

  Modify 
  Date: 9:00 7/3
  Content: change margin.symmetric -> margin.only
 */
class CollectionItem extends StatelessWidget {
  const CollectionItem(
      {super.key,
      required this.image,
      required this.idx,
      required this.collectionName});
  final String image;
  final int idx;
  final String collectionName;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightItem = size.width / (3 / 4) - 27;
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 60, left: 10, right: 10),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image
          Container(
            width: size.width,
            height: heightItem,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
          //title
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: size.width,
            child: Row(
              children: [
                // Number
                Text(
                  '0$idx',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),

                // Khe
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        1,
                      ),
                    ),
                  ),
                ),

                //Collection Name
                Text(
                  collectionName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
