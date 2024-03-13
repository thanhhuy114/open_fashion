// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/menu_arrival_response_model.dart';
import '../../blog_grid_page/bloc/bloc_grid_page_provider.dart';
import '../../product_detail_page/views/product_detail.dart';
import 'RhombusContainer.dart';
import 'home_page_product.dart';

class HomePageNewArrival extends StatefulWidget {
  const HomePageNewArrival({super.key, required this.menu});
  final List<ArrivalModel> menu;
  @override
  State<HomePageNewArrival> createState() => _HomePageNewArrivalState();
}

class _HomePageNewArrivalState extends State<HomePageNewArrival> {
  int selectedIndex = 0;
  final List<String> itemTab = [];
  List<ArrivalModel> filterItems = [];
  final List<ItemsModel> items = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      items.clear();
      itemTab.clear();
      for (final i in widget.menu) {
        itemTab.add(i.name);
      }
      filterItems = widget.menu
          .where((final element) => element.name == itemTab[0])
          .toList();
      for (final e in filterItems) {
        items.addAll(e.items);
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Text(
          'NEW ARRIVAL',
          style: GoogleFonts.tenorSans(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            letterSpacing: 4,
          ),
        ),
        Image.asset('assets/img/3.png'),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 50),
          height: 50,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: itemTab.length,
            itemBuilder: (final context, final index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    filterItems = widget.menu
                        .where(
                          (final element) =>
                              element.name == itemTab[selectedIndex],
                        )
                        .toList();
                    items.clear();
                    for (final i in filterItems) {
                      items.addAll(i.items);
                    }
                  });
                },
                child: ItemTab(
                  name: itemTab[index],
                  isSelected: selectedIndex == index,
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width + 200,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 30,
              childAspectRatio: 0.75,
            ),
            itemCount: items.length,
            itemBuilder: (final context, final index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final context) => const ProductDetailPage(),
                    ),
                  );
                },
                child: HomePageProduct(
                  pro: items[index],
                ),
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (final context) => const BlocGridPageProvider(),
                ),
              );
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Explore More',
                style: GoogleFonts.tenorSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Icon(
                Icons.arrow_forward_outlined,
                size: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemTab extends StatelessWidget {
  ItemTab({
    super.key,
    required this.name,
    required this.isSelected,
    this.color,
  });
  final String name;
  final bool isSelected;
  Color? color;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          Text(
            name,
            style: GoogleFonts.tenorSans(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 1,
              color: isSelected
                  ? color == null
                      ? Colors.black
                      : Colors.white
                  : Colors.grey[400],
            ),
          ),
          if (isSelected)
            Rhombus(
              color: Colors.orange[700],
            ),
        ],
      ),
    );
  }
}
