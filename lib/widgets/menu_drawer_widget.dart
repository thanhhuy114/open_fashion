import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/drawer_response_model.dart';
import '../presentation/category_screen/view/category_screen.dart';
import '../presentation/home_page/bloc/drawer_bloc.dart';
import '../presentation/home_page/widgets/home_page_newArrival.dart';

class MenuDrawer extends StatefulWidget {
  MenuDrawer({super.key, this.color});
  Color? color;
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
          backgroundColor: widget.color??Colors.white,
          child: BlocBuilder<DrawerBloc, DrawerState>(
            builder: (final context, final state) {
              if (state is DrawerLoading) {
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
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'x',
                          style: TextStyle(color: widget.color!=null?Colors.white:Colors.black, fontSize: 24),
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
                                height: MediaQuery.of(context).size.height/2-350,
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
                                        color: widget.color,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 500,
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
                                    color: widget.color,
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
                              Text('(786) 713-8616', style: TextStyle(color: widget.color!=null?Colors.white:Colors.black),),
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
                             Text('Store locator', style: TextStyle(color: widget.color!=null?Colors.white:Colors.black)),
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
  ItemName({super.key, required this.data, required this.items, this.color});
  final String data;
  final List<ItemsDrawerModel> items;
  Color? color;

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
              Text(widget.data, style: TextStyle(color: widget.color!=null?Colors.white:Colors.black)),
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
                    title: Text(widget.items[index].item, style: TextStyle(color: widget.color!=null?Colors.white:Colors.black)),
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (final context) => const CategoryScreen(),));
                      });
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
