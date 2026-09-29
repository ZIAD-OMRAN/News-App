import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/enums/category.dart';
import 'package:news_app/features/search_featuers/searchViwe/search_screen.dart';
import 'package:news_app/features/search_featuers/searchViwe/serch_cubit/cubit.dart';
import 'package:news_app/features/search_featuers/searchViwe/serch_cubit/statues.dart';
import 'package:news_app/features/search_featuers/searchViwe/widget/newscard.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/widgets/drawer.dart';

class CardsScreen extends StatefulWidget {
  static String routename = 'CardsScreen';
  const CardsScreen({super.key, required this.cat});
  final Category cat;

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  late ScrollController _ScrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ScrollController = ScrollController();
    _ScrollController.addListener(onscroll);
    context.read<SearchCubit>().search(widget.cat.name);
  }

  void onscroll() {
    if (_ScrollController.position.pixels >=
        _ScrollController.position.maxScrollExtent - 200) {
      context.read<SearchCubit>().search(widget.cat.name);
    }
  }

  @override
  void dispose() {
    _ScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cat.name.toUpperCase()),
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
        routename: HomeScreen.routename,
      ),

      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<SearchCubit, SearchStatues>(
              builder: (context, state) {
                if (state is InitialState) {
                  return const Center(child: Text('Search for an article'));
                }

                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is EmptyStat) {
                  return Center(
                    child: Text('There is no matching for "${state.message}"'),
                  );
                }

                if (state is SucsessState) {
                  return ListView.builder(
                    controller: _ScrollController,
                    itemCount: state.articles.length,
                    itemBuilder: (context, index) {
                      final article = state.articles[index];

                      return Newscard(article: article);
                    },
                  );
                }

                if (state is ErrorState) {
                  return Center(child: Text(state.error));
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
