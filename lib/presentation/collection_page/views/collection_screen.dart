/* 
  Create by: Thach
  Date: 9:55 6/5,
  Content: Colection list screen
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../collection_detail_page/view/collection_detail_screen.dart';
import '../bloc/collection_bloc/collection_bloc.dart';
import 'collection_item_screen.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => CollectionBloc()..add(LoadCollectionEvent()),
          child: BlocConsumer<CollectionBloc, CollectionState>(
            listener: (context, state) {
              if (state.status == CollectionStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Something wrong!')));
              }
            },
            builder: (context, state) {
              if (state.status == CollectionStatus.success) {
                return ListView.builder(
                  itemCount: state.collections.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
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
                    );
                  },
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
        ));
  }
}
