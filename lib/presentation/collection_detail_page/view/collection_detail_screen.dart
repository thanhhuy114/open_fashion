/*
  Create by: Thach
  Date: 13:00 6/3
  Content: Collectiondetail Screen

  Modify: Thach 
  Date: 10:21 11/3
  Content: line 107 Thêm kiểm trả null
  line 150 Kiểm tra item null thì []
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/collections_response_model.dart';
import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/menu_drawer_widget.dart';
import '../bloc/collection_detail_bloc/collection_detail_bloc.dart';
import 'item_list_of_colletion_detail.dart';
import 'suggestion_collection.dart';

class CollectionDetailScreen extends StatefulWidget {
  const CollectionDetailScreen({
    super.key,
    required this.collection,
    required this.moreCollection,
  });
  final CollectionDetailModel collection;
  final List<CollectionDetailModel> moreCollection;
  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarCustom(color: Colors.black,),
      drawer:  MenuDrawer(color: Colors.black,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocProvider(
            create: (final context) => CollectionDetailBloc()
              ..add(LoadCollectionDetailEvent(collection: widget.collection)),
            child: Column(
              children: [
                //Collection Name
                BlocBuilder<CollectionDetailBloc, CollectionDetailState>(
                  builder: (final context, final state) {
                    if (state is CollectionDetailLoaded) {
                      return SizedBox(
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (state.colletion.collectionName ?? '')
                                  .replaceAll('collection', ''),
                              style: const TextStyle(
                                fontSize: 42,
                                fontFamily: 'BodoniModa',
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                color: Color.fromRGBO(252, 252, 252, 1),
                              ),
                            ),
                            const Text(
                              'Collection',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(252, 252, 252, 1),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return SizedBox(
                      width: size.width,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Collection',
                            style: TextStyle(
                              fontSize: 42,
                              fontFamily: 'BodoniModa',
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Color.fromRGBO(252, 252, 252, 1),
                            ),
                          ),
                          Text(
                            'Collection',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(252, 252, 252, 1),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                //Picture of image
                BlocBuilder<CollectionDetailBloc, CollectionDetailState>(
                  builder: (final context, final state) {
                    if (state is CollectionDetailLoaded) {
                      return state.colletion.collectionImage == null
                          ? Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: size.width,
                              height: size.width / (3 / 4),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: size.width,
                              height: size.width / (3 / 4),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    state.colletion.collectionImage!,
                                  ),
                                ),
                              ),
                            );
                    }
                    return Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: size.width,
                      height: size.width / (3 / 4),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),

                //Item list
                BlocBuilder<CollectionDetailBloc, CollectionDetailState>(
                  builder: (final context, final state) {
                    if (state is CollectionDetailLoaded) {
                      return CollectionItemRowList(
                        items: state.colletion.items ?? [],
                      );
                    }
                    return Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: size.width,
                      height: size.width / (3 / 4),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),

                //More Collection
                SuggestionCollection(
                  collections: widget.moreCollection,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
