import 'package:flutter/material.dart';

import '../../../models/collections_response_model.dart';
import 'collection_detail_screen.dart';
import 'suggestion_collection_item.dart';

/* 
  Create by: Thach
  Date: 6/3 17:00
  Content: Phân gợi ý xem về các collection
  
  Modifi:Thach
  Date: 11/3 10:26
  Content 
    line 47 image: collections[index].collectionImage ?? '', collectionName: collections[index].collectionName ?? ''
 */
class SuggestionCollection extends StatelessWidget {
  const SuggestionCollection({super.key, required this.collections});
  final List<CollectionDetailModel> collections;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: Column(
        children: [
          Text(
            'You may also like'.toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(252, 252, 252, 1),
            ),
          ),

          //Divider
          const DividerCustom(
            color: Colors.black,
          ),
          // Collection list
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: collections.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CollectionDetailScreen(
                      collection: collections[index],
                      moreCollection: collections,
                    );
                  }),
                ),
                child: SuggestionCollectionItem(
                  // image: collections[index].collectionImage!,
                  // collectionName: collections[index].collectionName!
                  image: collections[index].collectionImage ?? '',
                  collectionName: collections[index].collectionName ?? '',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Vẽ đường khẻ
class DividerCustom extends StatelessWidget {
  const DividerCustom({super.key, this.color = Colors.white});
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 3,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(
            thickness: 0.4,
            color: Color.fromRGBO(85, 85, 85, 1),
          ),
          CustomPaint(
            size: const Size(20, 20),
            painter: DiamondPainter(color: color),
          )
        ],
      ),
    );
  }
}

class DiamondPainter extends CustomPainter {
  const DiamondPainter({this.color = Colors.white});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double diamondWidth = size.width * 0.8;
    final double diamondHeight = size.height * 0.8;

    final Path path = Path()
      ..moveTo(centerX, centerY - diamondHeight / 2) // Điểm trên
      ..lineTo(centerX + diamondWidth / 2, centerY) // Điểm bên phải
      ..lineTo(centerX, centerY + diamondHeight / 2) // Điểm dưới
      ..lineTo(centerX - diamondWidth / 2, centerY) // Điểm bên trái
      ..close();

    canvas.drawPath(path, paint);

    final Paint border = Paint()
      ..color = const Color.fromRGBO(85, 85, 85, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawPath(path, border);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
