import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/enums/category.dart';
import 'package:news_app/screens/cards_screen.dart';

class Cardbotton extends StatelessWidget {
  const Cardbotton({super.key, required this.right,required this.cat});
  final bool right;
  final Category cat ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CardsScreen.routename , arguments:cat );
      },
      child: Container(
        width: 167,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(84),
          color: Theme.of(context).hintColor,
        ),
        child: Row(
          textDirection: right ? TextDirection.ltr : TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'View All',
                style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                right ? CupertinoIcons.arrow_right : CupertinoIcons.arrow_left,
                color: Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
