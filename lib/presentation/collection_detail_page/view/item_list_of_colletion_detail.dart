import 'package:flutter/material.dart';
import '../../../feature/product_detail/page/product_detail_page/views/product_detail.dart';
import '../../../models/collections_response_model.dart';

/*
  Create by: Thach
  Date: 6/3 16:15
  Conntent: Danh sách các sản phẩm của bộ sưu tập
  
  Modify: Thach
  Date: 11/3 10:24
  Content: 
    line 33
    line 71
    line 83
 */

// Item of collection
class ItemOfCollectionWidget extends StatelessWidget {
  const ItemOfCollectionWidget({
    super.key,
    required this.sizeItem,
    required this.item,
  });
  final ItemSizeReponsive sizeItem;
  final ItemOfCollectionModel item;
  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () async => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder:
              (final context, final animation, final secondaryAnimation) {
            return const ProductDetailPage();
          },
        ),
      ),
      child: SizedBox(
        width: sizeItem.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.image == null)
              SizedBox(
                width: sizeItem.width,
                height: sizeItem.height - 20,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else
              Container(
                width: sizeItem.width,
                height: sizeItem.height - 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(item.image!),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Image.asset(
                        'assets/icons/Heart.png',
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (item.name ?? '').length > 20
                        ? '${item.name!.substring(0, 20)}...'
                        : item.name ?? '',
                    style: const TextStyle(
                      height: 1.5,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(252, 252, 252, 1),
                    ),
                  ),
                  Text(
                    (item.description ?? '').length > 20
                        ? '${item.description!.substring(0, 20)}...'
                        : item.description ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(129, 129, 129, 1),
                    ),
                  ),
                  Text(
                    '${item.price ?? 0}\$',
                    style: const TextStyle(
                      fontSize: 16,
                      height: 2,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(221, 133, 96, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Hiển thị item theo hàng ngang
class ItemRowOfCollectionDetail extends StatelessWidget {
  const ItemRowOfCollectionDetail({
    super.key,
    required this.items,
    required this.idx,
    required this.isLastRow,
  });
  final List<ItemOfCollectionModel> items;
  final int idx;
  final bool isLastRow;
  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ItemSizeReponsive sizeItem =
        ItemSizeReponsive.findSizeItem(size.width);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        items.length % sizeItem.totalItemRow == 0
            ? sizeItem.totalItemRow
            : isLastRow
                ? items.length % sizeItem.totalItemRow
                : sizeItem.totalItemRow,
        (final index) => ItemOfCollectionWidget(
          item: items[idx * sizeItem.totalItemRow + index],
          sizeItem: sizeItem,
        ),
      ),
    );
  }
}

//Danh sách item để hiển thị từng dòng
class CollectionItemRowList extends StatelessWidget {
  const CollectionItemRowList({super.key, required this.items});
  final List<ItemOfCollectionModel> items;
  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ItemSizeReponsive sizeItem =
        ItemSizeReponsive.findSizeItem(size.width);
    final int itemCount = (items.length / sizeItem.totalItemRow).ceil();
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: List.generate(
          itemCount,
          (final index) => ItemRowOfCollectionDetail(
            isLastRow: itemCount - 1 == index, //Kiểm trả đến dòng cuối cùng
            idx: index,
            items: items,
          ),
        ),
      ),
    );
  }
}

//Dùng để điều chỉnh kích thước các item theo độ rộng màng hình
class ItemSizeReponsive {
  const ItemSizeReponsive({
    required this.width,
    required this.height,
    required this.totalItemRow,
  });
  final double width;
  final double height;
  final int totalItemRow;

  //Reponsitive Item of Collection Detail
  static ItemSizeReponsive findSizeItem(final double width) {
    //width is width of screen
    const double minSpace = 10; // Spase between item
    double minWidthOfItem = 165; // Min width of item
    if (width > 800) {
      // large screen
      minWidthOfItem = 265; // Increase width of Item
    }
    final double minHeightOfItem = minWidthOfItem /
        (3 / 4); // Height is determined according to the ratio 3:4
    final int totalItemRow = width ~/
        minWidthOfItem; // Calculating number of items displayed horizontally
    final double allWidthSpace = minSpace *
        (totalItemRow - 1); // Calculating total of space between items
    if (totalItemRow > 1) {
      // Number of items is more than one
      double residualSpace = width -
          (totalItemRow * minWidthOfItem) -
          allWidthSpace; // Spatial computation is remaining
      if (residualSpace > allWidthSpace) {
        residualSpace = (residualSpace - allWidthSpace - 40) / totalItemRow;
        final double widthItem = minWidthOfItem + residualSpace;
        final double heightItem =
            residualSpace / totalItemRow + minHeightOfItem;
        return ItemSizeReponsive(
          width: widthItem,
          height: heightItem,
          totalItemRow: totalItemRow,
        );
      }
    }
    return ItemSizeReponsive(
      width: minWidthOfItem,
      height: minHeightOfItem,
      totalItemRow: 1,
    );
  }
}
