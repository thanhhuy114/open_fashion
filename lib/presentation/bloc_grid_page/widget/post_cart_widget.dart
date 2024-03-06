import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/post_menu_response_model.dart';
import '../../../ultis/ultis.dart';

class PostCart extends StatelessWidget {
  const PostCart({
    super.key,
    required this.postSumary,
  });

  final PostSummaryModel postSumary;

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      color: Colors.white,
      child: Column(
        children: [
          _buildPostImage(context),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTags(context),
              Text(
                getDatePublished(postSumary.datePublished),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  SizedBox _buildTags(final BuildContext context) {
    return SizedBox(
      width: 260,
      child: Wrap(
        spacing: 12,
        runSpacing: 5,
        children: List.generate(
          postSumary.tags.length,
          (final index) => Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(255, 245, 245, 245),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '# ${postSumary.tags[index]}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildPostImage(final BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: postSumary.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            placeholder: (final context, final url) => Image.asset(
              'assets/images/no_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/bookmark.png',
                height: 17,
                width: 17,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 83, 79, 79).withOpacity(0),
                    const Color.fromARGB(255, 10, 10, 10),
                  ],
                ),
              ),
              width: double.infinity,
              child: Text(
                postSumary.tittle.toUpperCase(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: const Color.fromARGB(
                        255,
                        246,
                        240,
                        240,
                      ),
                      fontSize: 16,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
