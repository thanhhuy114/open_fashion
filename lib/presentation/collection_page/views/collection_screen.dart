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

import '../../../locator.dart';
import '../../../models/collections_response_model.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/menu_drawer_widget.dart';
import '../../collection_detail_page/view/collection_detail_screen.dart';
import '../../home_page/widgets/home_page_footer.dart';
import '../bloc/bloc/remote_collection_bloc.dart';
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
        create: (final context) =>
            sl<RemoteCollectionBloc>()..add(LoadCollection()),
        child: BlocConsumer<RemoteCollectionBloc, RemoteCollectionState>(
          listener: (final context, final state) {
            if (state is RemoteCollectionFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Something wrong!')),
              );
            }
          },
          builder: (final context, final state) {
            if (state is RemoteCollectionSuccess) {
              //add singlechidScollview
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      (state.collecttion[0].collectionName ?? '').substring(
                        0,
                        (state.collecttion[0].collectionName ?? '')
                            .indexOf(' '),
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
                        state.collecttion.length,
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
                                    collection:
                                        CollectionDetailModel.fromCollection(
                                      state.collecttion[index],
                                    ),
                                    moreCollection: state.collecttion
                                        .map(
                                          (e) => CollectionDetailModel
                                              .fromCollection(e),
                                        )
                                        .toList(),
                                  );
                                },
                              ),
                            );
                          },
                          child: CollectionItem(
                            collectionName:
                                state.collecttion[index].collectionName!,
                            idx: index + 1,
                            image: state.collecttion[index].collectionImage!,
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
