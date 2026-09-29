import 'package:flutter/material.dart';
import 'package:news_app/features/search_featuers/artiiclsModel.dart';

class PreviewNews extends StatelessWidget {
  const PreviewNews({super.key, required this.article});
  static String routename = 'PreviewNews';
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    return Align(
      alignment: AlignmentGeometry.bottomEnd,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).hintColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Hero(
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
                  article.description ?? ' ',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(14),
                    ),

                    child: Text(
                      'View Full Articel',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
