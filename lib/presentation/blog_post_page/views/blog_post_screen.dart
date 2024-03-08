/*
  Create by: Thach
  Date: 5/3
  Cotent: Blog Post UI


 */

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/menu_drawer_widget.dart';
import '../bloc/bloc/blog_post_bloc.dart';
import '../widgets/tag.dart';
import '../../../widgets/footer.dart';

class BLogPostScreen extends StatefulWidget {
  const BLogPostScreen({super.key});

  @override
  State<BLogPostScreen> createState() => _BLogPostScreenState();
}

class _BLogPostScreenState extends State<BLogPostScreen> {
  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double marginAll = 20;

    return BlocProvider(
      create: (final context) => BlogPostBloc()..add(LoadBlogPostEvent()),
      child: Scaffold(
        appBar: const AppBarCustom(),
        drawer: const MenuDrawer(),
        body: BlocListener<BlogPostBloc, BlogPostState>(
          listener: (final context, final state) {
            if (state is BlogPostLoadFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Something wrong!'),
                ),
              );
            }
          },
          child: CustomScrollView(
            slivers: [
              //main picure
              SliverAppBar.large(
                pinned: false,
                expandedHeight: size.width * 2 / 3 + 10,
                backgroundColor: const Color.fromRGBO(
                  136,
                  136,
                  136,
                  1,
                ),
                automaticallyImplyLeading: false,
                flexibleSpace: BlocBuilder<BlogPostBloc, BlogPostState>(
                  builder: (final context, final state) {
                    if (state is BlogPostLoaded) {
                      return Container(
                        height: size.width * 2 / 3 + 10,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(
                            136,
                            136,
                            136,
                            1,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(state.blogPost.mainPicture!),
                          ),
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),

              //Title
              SliverAppBar(
                pinned: true,
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                flexibleSpace: BlocBuilder<BlogPostBloc, BlogPostState>(
                  builder: (final context, final state) {
                    if (state is BlogPostLoaded) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: marginAll,
                        ),
                        child: Text(
                          state.blogPost.titlePost!.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),

              // Content 1
              SliverList.builder(
                itemCount: 1,
                itemBuilder: (final context, final index) {
                  return Column(
                    children: [
                      BlocBuilder<BlogPostBloc, BlogPostState>(
                        builder: (final context, final state) {
                          if (state is BlogPostLoaded) {
                            return Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(
                                horizontal: marginAll,
                              ),
                              color: Colors.white,
                              child: Text(
                                state.blogPost.content!.substring(
                                  0,
                                  state.blogPost.content!.indexOf('\n'),
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 2.4,
                                ),
                              ),
                            );
                          }
                          return SizedBox(
                            width: size.width,
                            height: 100,
                            child: const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          );
                        },
                      ),

                      //slide image
                      BlocBuilder<BlogPostBloc, BlogPostState>(
                        builder: (final context, final state) {
                          if (state is BlogPostLoaded) {
                            final List<BannerModel> bannerModels = [];
                            for (int index = 0;
                                index < state.blogPost.imageArray!.length;
                                index++) {
                              bannerModels.add(
                                BannerModel(
                                  imagePath: state.blogPost.imageArray![index],
                                  id: index.toString(),
                                ),
                              );
                            }
                            return Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(
                                horizontal: marginAll,
                                vertical: 20,
                              ),
                              color: Colors.white,
                              child: BannerCarousel.fullScreen(
                                height: 500,
                                activeColor: const Color.fromRGBO(
                                  136,
                                  136,
                                  136,
                                  1,
                                ),
                                customizedIndicators: const IndicatorModel(
                                  width: 7,
                                  height: 7,
                                  spaceBetween: 5,
                                ),
                                banners: bannerModels,
                              ),
                            );
                          }
                          return SizedBox(
                            width: size.width,
                            height: 500,
                            child: const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          );
                        },
                      ),

                      //Content 2
                      BlocBuilder<BlogPostBloc, BlogPostState>(
                        builder: (final context, final state) {
                          if (state is BlogPostLoaded) {
                            return Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(
                                horizontal: marginAll,
                              ),
                              color: Colors.white,
                              child: Text(
                                state.blogPost.content!.substring(
                                  state.blogPost.content!.indexOf('\n') + 1,
                                  state.blogPost.content!.length,
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 2.4,
                                ),
                              ),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        },
                      ),

                      // Post by / Date
                      BlocBuilder<BlogPostBloc, BlogPostState>(
                        builder: (final context, final state) {
                          if (state is BlogPostLoaded) {
                            return Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(
                                horizontal: marginAll,
                                vertical: 20,
                              ),
                              color: Colors.white,
                              child: Text(
                                'Posted by ${state.blogPost.postBy} | ${state.blogPost.postDate}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 2.4,
                                ),
                              ),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        },
                      ),

                      //Tag
                      BlocBuilder<BlogPostBloc, BlogPostState>(
                        builder: (final context, final state) {
                          if (state is BlogPostLoaded) {
                            return Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(
                                horizontal: marginAll,
                                vertical: 10,
                              ),
                              color: Colors.white,
                              child: ListTag(
                                tags: state.blogPost.tag!,
                                clickTag: (final p0) => (),
                              ),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        },
                      ),

                      //Footer
                      const FooterWidget(
                        email: 'support@openui.design',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
