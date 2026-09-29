import 'package:flutter/material.dart';

import 'package:news_app/features/search_featuers/artiiclsModel.dart';
import 'package:news_app/screens/preview_news.dart';

class Newscard extends StatelessWidget {
  const Newscard({super.key, required this.article});
  static String routename = 'Newscard';

  final ArticleModel article;
  void showArticlePreview(BuildContext context, ArticleModel article) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.65),

        transitionDuration: const Duration(milliseconds: 400),

        reverseTransitionDuration: const Duration(milliseconds: 300),

        pageBuilder: (context, animation, secondaryAnimation) {
          return PreviewNews(article: article);
        },

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          showArticlePreview(context, article);
        },
        child: Container(
          height: heightscreen * .35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).hintColor, width: 2),
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
                  child: Hero(
                    placeholderBuilder: (context, heroSize, child) {
                      return Image.network(
                        article.urlToImage ?? '',
                        height: heightscreen * .20,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                    tag: article.url ?? article.title ?? '',
                    child: Image.network(
                      article.urlToImage ?? '',
                      height: heightscreen * .20,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  article.title ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        'BY : ${article.author ?? ''}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
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
      ),
    );
  }
}
