import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search_featuers/searchViwe/serch_cubit/cubit.dart';
import 'package:news_app/features/search_featuers/searchViwe/serch_cubit/statues.dart';
import 'package:news_app/features/search_featuers/searchViwe/widget/newscard.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static String routename = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController controller;
  late ScrollController _ScrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ScrollController = ScrollController();
    _ScrollController.addListener(onscroll);
    controller = TextEditingController();
  }

  void onscroll() {
    if (_ScrollController.position.pixels >=
        _ScrollController.position.maxScrollExtent - 200) {
      context.read<SearchCubit>().search(controller.text);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    _ScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.clear();
                      context.read<SearchCubit>().resetSearch();
                    },
                    icon: Icon(Icons.delete_outline_sharp),
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {
                      final query = controller.text.trim();

                      if (query.isNotEmpty) {
                        context.read<SearchCubit>().search(query);
                      }
                    },
                    icon: const Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
              ),
            ),

            // Search Result
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
                      child: Text(
                        'There is no matching for "${state.message}"',
                      ),
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
      ),
    );
  }
}
