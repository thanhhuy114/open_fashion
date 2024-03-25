/* 
  Create by: Thach
  Date: 9:55 6/5,
  Content: Colection list screen

  Modify
  Date 7/5 9:00
  Content: 
    - Change Listvire -> Column List.genarate
    - Add Title at top list
    - Add SingleChildScrollView
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/menu_drawer_widget.dart';
import '../../collection_detail_page/view/collection_detail_screen.dart';
import '../../../features/homepage/home_page/widgets/home_page_footer.dart';
import '../bloc/collection_bloc/collection_bloc.dart';
import 'collection_item_screen.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarCustom(
        color: Colors.black,
      ),
      drawer: MenuDrawer(
        color: Colors.black,
      ),
      body: BlocProvider(
        create: (final context) => CollectionBloc()..add(LoadCollectionEvent()),
        child: BlocConsumer<CollectionBloc, CollectionState>(
          listener: (final context, final state) {
            if (state.status == CollectionStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Something wrong!')),
              );
            }
          },
          builder: (final context, final state) {
            if (state.status == CollectionStatus.success) {
              //add singlechidScollview
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      state.collections[0].collectionName!.substring(
                        0,
                        state.collections[0].collectionName!.indexOf(' '),
                      ),
                      style: const TextStyle(
                        fontFamily: 'BodoniModa',
                        fontSize: 46,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(252, 252, 252, 1),
                      ),
                    ),
                    Text(
                      'Collection'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(252, 252, 252, 1),
                      ),
                    ),

                    //Collection List changing lisview -> column
                    Column(
                      children: List.generate(
                        state.collections.length,
                        (final index) => GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (
                                  final context,
                                  final animation,
                                  final secondaryAnimation,
                                ) {
                                  return CollectionDetailScreen(
                                    collection: state.collections[index],
                                    moreCollection: state.collections,
                                  );
                                },
                              ),
                            );
                          },
                          child: CollectionItem(
                            collectionName:
                                state.collections[index].collectionName!,
                            idx: index + 1,
                            image: state.collections[index].collectionImage!,
                          ),
                        ),
                      )..add(const HomePageFooter()),
                    ),
                  ],
                ),
              );
            }
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
