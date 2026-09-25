import 'package:flutter/material.dart';

import 'package:news_app/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});
  static String routename = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Home'), actions: [Icon(Icons.search)]),
      drawer: DrawedWidget(
        screenwidth: screenwidth,
        screenheight: screenheight,
        routename: routename,
      ),
      body: Column(
        children: [
          Text(
            'Good Morning \nHere is Some News For You',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
