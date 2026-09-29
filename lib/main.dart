import 'package:news_app/enums/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/commen/them_mode.dart';
import 'package:news_app/features/search_featuers/artiiclsModel.dart';
import 'package:news_app/features/search_featuers/searchViwe/search_screen.dart';
import 'package:news_app/features/search_featuers/searchViwe/serch_cubit/cubit.dart';
import 'package:news_app/features/search_featuers/searchViwe/widget/newscard.dart';
import 'package:news_app/features/search_featuers/search_data.dart';
import 'package:news_app/screens/cards_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/network/providers/them_provider.dart';
import 'package:news_app/screens/preview_news.dart';
import 'package:news_app/screens/webview.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(create: (_) => ThemProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final providerthem = Provider.of<ThemProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppThem.lightmode,
      darkTheme: AppThem.darktmode,
      themeMode: providerthem.isDark ? ThemeMode.dark : ThemeMode.light,

      initialRoute: HomeScreen.routename,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        SearchScreen.routename: (context) => BlocProvider(
          create: (context) => SearchCubit(searchAPI: SearchData()),
          child: SearchScreen(),
        ),
        Newscard.routename: (context) => Newscard(
          article: ModalRoute.of(context)!.settings.arguments as ArticleModel,
        ),
        PreviewNews.routename: (context) => PreviewNews(
          article: ModalRoute.of(context)!.settings.arguments as ArticleModel,
        ),
        Webview.routename: (context) => Webview(
          article: ModalRoute.of(context)!.settings.arguments as ArticleModel,
        ),
        CardsScreen.routename: (context) => BlocProvider(
          create: (context) => SearchCubit(searchAPI: SearchData()),
          child: CardsScreen(
            cat: ModalRoute.of(context)!.settings.arguments as Category,
          ),
        ),
      },
    );
  }
}
