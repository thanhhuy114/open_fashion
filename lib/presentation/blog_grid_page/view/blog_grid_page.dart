import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/button_lead_more.dart';
import '../../../widgets/footer.dart';
import '../../../widgets/header_blog.dart';
import '../../../widgets/menu_drawer_widget.dart';
import '../../../features/blog_post/pages/blog_post_page/views/blog_post_screen.dart';
import '../bloc/post_menu/post_menu_bloc.dart';
import '../bloc/post_menu/post_menu_state.dart';
import '../widget/button_list_gird.dart';
import '../widget/button_tag_widget.dart';
import '../widget/post_cart_type_gird_widget.dart';
import '../widget/post_cart_widget.dart';

class BlogGirdPage extends StatefulWidget {
  const BlogGirdPage({super.key});

  @override
  State<BlogGirdPage> createState() => _BlogGirdPageState();
}

class _BlogGirdPageState extends State<BlogGirdPage> {
  bool _isSeletedModList = true;
  final List<String> _seletedTags = [];

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBarCustom(),
      body: BlocBuilder<PostMenuBloc, PostMenuState>(
        builder: (final context, final state) {
          if (state is PostMenuStateSussess) {
            return NestedScrollView(
              headerSliverBuilder: (final context, final _) => [
                const SliverPersistentHeader(
                  delegate: HeaderFromBlogGridPage(title: 'BLOG'),
                ),
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 0,
                  pinned: true,
                  floating: true,
                  backgroundColor: Colors.white,
                  flexibleSpace: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.tags.length,
                    itemBuilder: (final context, final index) => TagButton(
                      text: state.tags[index],
                      isSeleted: _seletedTags.contains(state.tags[index]),
                      onTap: (final text) {
                        setState(() {
                          _tagOnTap(text);
                        });
                      },
                    ),
                  ),
                ),
              ],
              body: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 5, left: 15),
                    alignment: Alignment.bottomLeft,
                    height: 40,
                    child: ButtonListAndGird(
                      onTap: () => setState(
                        () => _isSeletedModList = !_isSeletedModList,
                      ),
                      seletedMod: _isSeletedModList,
                    ),
                  ),
                  ...List.generate(4, (final index) {
                    if (_isSeletedModList) {
                      return _getPostCardByTagSelected(
                        body: PostCart(
                          onTap: () async => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (final _) => const BLogPostScreen(),
                            ),
                          ),
                          postSumary:
                              state.postMenuResponse.data!.postSummaru[index],
                        ),
                        tags: state
                            .postMenuResponse.data!.postSummaru[index].tags,
                      );
                    } else {
                      return _getPostCardByTagSelected(
                        body: PostTypeGirdCart(
                          onTap: () async => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (final _) => const BLogPostScreen(),
                            ),
                          ),
                          postSumary:
                              state.postMenuResponse.data!.postSummaru[index],
                        ),
                        tags: state
                            .postMenuResponse.data!.postSummaru[index].tags,
                      );
                    }
                  }),
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    child: const ButtonLeadMore(),
                  ),
                  const FooterWidget(),
                ],
              ),
            );
          } else {
            return Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Image.asset('assets/images/loading animation.gif'),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _getPostCardByTagSelected({
    required final List<String> tags,
    required final Widget body,
  }) {
    if (_seletedTags.every(
      (final element) => tags.contains(element),
    )) {
      return body;
    } else {
      return Container();
    }
  }

  void _tagOnTap(final String text) {
    if (_seletedTags.contains(text)) {
      _seletedTags.remove(text);
    } else {
      _seletedTags.add(text);
    }
  }
}
