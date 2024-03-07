import 'package:flutter/material.dart';
import 'package:open_fashion/presentation/category_screen/model/category_status_filer_manager.dart';
import 'package:open_fashion/presentation/category_screen/widgets/category_tag_filter.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});
  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  List<String> lstItem = ['New', 'Oldest'];
  String selectedItem = 'New';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("4500 APPAREL"),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.1,
                            color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(33),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(right: 15),
                    underline: Container(),
                    items: lstItem.map((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedItem = value!;
                      setState(() {});
                    },
                    value: selectedItem,
                  ),
                ),
                const FilterButton(pathIcon: 'assets/img/Gridview.png'),
                const FilterButton(
                  pathIcon: 'assets/img/Filter.png',
                ),
              ],
            )
          ],
        ),
        const TagFilter(tagName: 'Women'),
      ],
    );
  }
}

// ignore: must_be_immutable
class FilterButton extends StatefulWidget {
  const FilterButton({super.key, required this.pathIcon});
  final String pathIcon;
  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  late String curentPathIcon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curentPathIcon = widget.pathIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 0.5,
          ),
        ],
      ),
      child: OutlinedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            minimumSize: MaterialStateProperty.all(const Size(5, 5)),
            shape: MaterialStateProperty.all(const CircleBorder()),
            side: MaterialStateProperty.all(
                const BorderSide(color: Colors.transparent)),
          ),
          onPressed: () {
            if (curentPathIcon == 'assets/img/Gridview.png') {
              curentPathIcon = 'assets/img/Listview.png';
              CategoryStatusFilterManager.setStatus(1);
            } else if (curentPathIcon == 'assets/img/Listview.png') {
              curentPathIcon = 'assets/img/Gridviewfull.png';
              CategoryStatusFilterManager.setStatus(2);
            } else if (curentPathIcon == 'assets/img/Gridviewfull.png') {
              curentPathIcon = 'assets/img/Gridview.png';
              CategoryStatusFilterManager.setStatus(3);
            }
            setState(() {});
          },
          child: Image.asset(curentPathIcon)),
    );
  }
}
