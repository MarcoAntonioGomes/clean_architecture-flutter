import 'package:flutter/material.dart';
import 'package:hyrule/screens/results.dart';
import 'package:hyrule/themes/theme_colors.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});
   final String category;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Results(category: category)));
        },
        child: Ink(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border:  Border.all(color: ThemeColors.categories),
            boxShadow: kElevationToShadow[3],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image.asset("$imagePath$category.png"),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(categories[category]!, style: TextStyle(color: ThemeColors.categories, fontFamily: 'Roboto', fontSize: 15 ),),
      )
    ],);
  }
}
