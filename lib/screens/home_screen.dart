import 'package:flutter/material.dart';
import 'package:news_app/enums/category.dart';
import 'package:news_app/features/search_featuers/searchViwe/search_screen.dart';
import 'package:news_app/widgets/cards.dart';
import 'package:news_app/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routename = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routename);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: DrawedWidget(
        screenwidth: screenwidth,
        screenheight: screenheight,
        routename: routename,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning \nHere is Some News For You',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Category.values.length,
                itemBuilder: (context, index) {
                  return Cards(
                    right: index % 2 == 0,
                    cat: Category.values[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
