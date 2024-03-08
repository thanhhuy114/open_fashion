import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/drawer_response_model.dart';
import '../presentation/home_page/bloc/drawer_bloc.dart';
import '../presentation/home_page/widgets/home_page_newArrival.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final List<String> itemTab = [];
  List<DrawerModel> items = [];
  List<ItemsDataModel> filteredItems = [];
  int selectedIndex = 0;
  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => DrawerBloc()..add(LoadDrawer()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
          child: BlocBuilder<DrawerBloc, DrawerState>(
            builder: (final context, final state) {
              if (state is DrawerInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is DrawerError) {
                return Center(
                  child: Text('Something went wrong! ${state.error}'),
                );
              }
              if (state is DrawerLoaded) {
                final List<DrawerModel> drawer = state.drawerData;
                itemTab.clear();
                for (final i in drawer) {
                  itemTab.add(i.type);
                }
                filteredItems.clear();
                // ignore: prefer_foreach
                for (final element in drawer[selectedIndex].items) {
                  filteredItems.add(element);
                }
                return ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'X',
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 28,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: itemTab.length,
                                  itemBuilder: (final context, final index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                        filteredItems.clear();
                                        // ignore: prefer_foreach
                                        for (final element
                                            in drawer[selectedIndex].items) {
                                          filteredItems.add(element);
                                        }
                                      },
                                      child: ItemTab(
                                        name: itemTab[index],
                                        isSelected: selectedIndex == index,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            child: Scrollbar(
                              trackVisibility: false,
                              child: ListView.builder(
                                physics: const RangeMaintainingScrollPhysics(),
                                itemCount: filteredItems.length,
                                itemBuilder: (final context, final index) {
                                  return ItemName(
                                    data: filteredItems[index].name,
                                    items: filteredItems[index].items,
                                  );
                                },
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_enabled_outlined,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text('(786) 713-8616'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.fmd_good_sharp,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text('Store locator'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Image.asset('assets/img/3.png'),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 70,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/icons/Twitter.jpg',
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/icons/Instagram.jpg',
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/icons/YouTube.jpg',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class ItemName extends StatefulWidget {
  const ItemName({super.key, required this.data, required this.items});
  final String data;
  final List<ItemsDrawerModel> items;

  @override
  State<ItemName> createState() => _ItemNameState();
}

class _ItemNameState extends State<ItemName> {
  bool isExpanded = false;
  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.data),
              IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          if (isExpanded)
            SizedBox(
              height: calculateListViewHeight(),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (final context, final index) {
                  return ListTile(
                    title: Text(widget.items[index].item),
                    onTap: () {
                      //Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
  double calculateListViewHeight() {
    const itemHeight = 55.0; // Chiều cao trung bình của mỗi phần tử ListTile
    final itemCount = widget.items.length;
    final totalHeight = itemHeight * itemCount;
    const paddingHeight = 16.0; // Thêm padding cho các phần tử
    return totalHeight + paddingHeight;
  }
}
