import 'package:flutter/material.dart';
import 'package:news_app/enums/category.dart';
import 'package:news_app/widgets/cardBotton.dart';

class Cards extends StatelessWidget {
  const Cards({super.key, required this.cat, required this.right});
  final Category cat;
  final bool right;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),

        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(cat.ImagePath),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: right
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              cat.name.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Cardbotton(right: right),
          ),
        ],
      ),
    );
  }
}
