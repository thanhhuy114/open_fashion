import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/post_menu_response_model.dart';
import '../../../ultis/ultis.dart';

class PostTypeGirdCart extends StatelessWidget {
  const PostTypeGirdCart({
    super.key,
    required this.postSumary,
  });

  final PostSummaryModel postSumary;

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 24,
        right: 16,
        left: 16,
      ),
      height: 155,
      color: Colors.transparent,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: postSumary.imageUrlTypeGird,
            fit: BoxFit.cover,
            width: 120,
            height: double.infinity,
            placeholder: (final context, final url) => Image.asset(
              'assets/images/no_image.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    postSumary.tittle.toUpperCase(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(letterSpacing: 2),
                  ),
                ),
                Text(
                  postSumary.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: const Color(0xFF333333)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    getDatePublished(postSumary.datePublished),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
