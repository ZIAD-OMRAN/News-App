import 'package:flutter/material.dart';
import 'package:news_app/features/search_featuers/artiiclsModel.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/widgets/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
 const Webview({required this.article, super.key});
  final ArticleModel article;
  static String routename = 'Webview';

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  late final WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.article.url ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text(widget.article.source?.name ?? '')),

      drawer: DrawedWidget(
        screenwidth: screenwidth,
        screenheight: screenheight,
        routename: HomeScreen.routename,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
