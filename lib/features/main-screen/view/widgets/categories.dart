import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final categories;
  const Categories(this.categories, {super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final items = widget.categories;
    return Expanded(
      child: SizedBox(
        height: 100.0,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(items[index].category.name,
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                subtitle: Stack(children: [
                  LinearProgressIndicator(
                    color: Color(items[index].category.color),
                    minHeight: 50.0,
                    value: items[index].percent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    backgroundColor: Color.fromARGB(155, 245, 245, 245),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7, left: 10),
                    child: Icon(
                        IconData(items[index].category.icon,
                            fontFamily: "MaterialIcons"),
                        color: Colors.black,
                        size: 36),
                  )
                ]));
          },
        ),
      ),
    );
  }
}
