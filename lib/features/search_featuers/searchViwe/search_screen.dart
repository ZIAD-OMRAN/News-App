import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search_featuers/searchViwe/serch_cubit/cubit.dart';
import 'package:news_app/features/search_featuers/searchViwe/serch_cubit/statues.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static String routename = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
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
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        final article = state.articles[index];

                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: heightscreen * .35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Theme.of(context).hintColor,
                                width: 2,
                              ),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,

                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      article.urlToImage ?? '',
                                      height: heightscreen * .20,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    article.title ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'BY : ${article.author ?? ''}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        article.publishedAt ?? '',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
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
