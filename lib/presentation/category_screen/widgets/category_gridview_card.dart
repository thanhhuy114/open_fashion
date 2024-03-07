import 'package:flutter/material.dart';
import 'package:open_fashion/presentation/category_screen/model/category.dart';

class CategoryGridviewCard extends StatelessWidget {
  const CategoryGridviewCard(
      {required this.myCat, super.key, required this.status});
  final Cat myCat;
  final bool status;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (status == false) {
                showDialog(
                  context: context,
                  builder: (context) => ImageDialog(src: myCat.image!),
                );
              }
            },
            child: Image.network(
              myCat.image!.isEmpty
                  ? 'https://s3-alpha-sig.figma.com/img/ed8f/4d87/18c00e6e0e487ca9314bc0f7b72dd4b6?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=R96SHq1~2g7Xsy4bOF0TpnjDBLzobJrFVCN5ltnFwp~oN8KxQxiuVaI96HXSQnbLWLMmSJjv6dac6fZtg8PfbAnnzDQ0iIwz4R7mC~Jd9CsVN1c~sEOEFRwBPRwpZpvXK0cDwfZKuhOCOb~s0QDxMyl0v~KfhPPDhYACL8MCUVBHewZQ94cQFj9EIwpSUQmVdIY5iKi5GCH2mssHYL4dztBYbfznnmcZvy0JzWv00TKjVJoe4a0FZ85CE833HSTS34Qish1EOg4EAmAUwCvv-669IXKXP8UppKcTuMgiUYVBTLBDQD3xsu5hYnHjtStmJVTMuYqGoZ4LjOBuGEN7Og__'
                  : myCat.image!,
            ),
          ),
          Text(myCat.name!),
          Text(myCat.description!),
          Text('\$ ${myCat.price}')
        ],
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({required this.src, super.key});
  final String src;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.black.withOpacity(0.5),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Image.network(
              src,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.95,
              width: MediaQuery.of(context).size.width * 0.95,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 40,
                )),
          )
        ]));
  }
}
