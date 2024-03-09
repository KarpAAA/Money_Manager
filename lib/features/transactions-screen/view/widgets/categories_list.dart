import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  final categories;
  final _selectedCategoryIndex;
  final setSelectedCategoryIndex;

  const CategoriesList(
      this.categories,
      this._selectedCategoryIndex,
      this.setSelectedCategoryIndex,
      {super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 100.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                        color: widget._selectedCategoryIndex == index
                            ? Colors.black
                            : Colors.white,
                      ),
                      child: Center(
                        child: IconButton(
                            icon: Icon(
                                IconData(widget.categories[index].icon,
                                    fontFamily: "MaterialIcons"),
                                size: 25),
                            // Icon(),
                            onPressed: () {
                              widget.setSelectedCategoryIndex(index);
                            },
                            color: widget._selectedCategoryIndex == index
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
