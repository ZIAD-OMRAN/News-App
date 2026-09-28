import 'package:flutter/material.dart';
import 'package:news_app/commen/appcolor.dart';
import 'package:news_app/network/providers/them_provider.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class DrawedWidget extends StatelessWidget {
  const DrawedWidget({
    super.key,
    required this.screenwidth,
    required this.screenheight,
    required this.routename,
  });

  final double screenwidth;
  final double screenheight;
  final String routename;

  static final List<DropdownMenuEntry<String>> categoryEntries = [
    const DropdownMenuEntry(value: 'Dark', label: 'Dark'),
    const DropdownMenuEntry(value: 'light', label: 'light'),
  ];
  static final List<DropdownMenuEntry<String>> languages = [
    const DropdownMenuEntry(value: 'English', label: 'English'),
    const DropdownMenuEntry(value: 'Arabic', label: 'Arabic'),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: screenwidth * .7,
      backgroundColor: Appcolors.darkcolor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: screenheight * .25,
            width: double.infinity,
            color: Colors.white,
            child: Text(
              'News App',
              style: Theme.of(context).textTheme.titleLarge
                  ?.copyWith(color: Appcolors.darkcolor),
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomeScreen.routename),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.home_rounded, color: Colors.white),
                  Text(
                    'Go To Home',

                    style: Theme.of(context).textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.draw_rounded, color: Colors.white),
                    Text(
                      'Them',
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                DropdownMenu<String>(
                  onSelected: (value) {
                    if (value == 'Dark') {
                      context.read<ThemProvider>().changeThem(true);
                    } else if (value == 'light') {
                      context.read<ThemProvider>().changeThem(false);
                    }
                  },
                  trailingIcon: Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                    color: Appcolors.lightcolor,
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  textStyle: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: Colors.white),
                  width: 250,
                  hintText: 'Select Them',
                  dropdownMenuEntries: categoryEntries,
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.language_rounded, color: Colors.white),
                    Text(
                      'Language',
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                DropdownMenu<String>(
                  trailingIcon: Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                    color: Appcolors.lightcolor,
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  width: 250,
                  textStyle: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: Colors.white),
                  hintText: 'Select Language',

                  dropdownMenuEntries: languages,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
