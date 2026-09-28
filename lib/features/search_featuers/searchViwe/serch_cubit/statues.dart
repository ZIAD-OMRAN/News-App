import 'package:news_app/features/search_featuers/artiiclsModel.dart';

abstract class  SearchStatues {}

class InitialState extends SearchStatues {}

class LoadingState extends SearchStatues {}

class ErrorState extends SearchStatues {
  final String error;
  ErrorState(this.error);
}

class EmptyStat extends SearchStatues {
  final String message;
  EmptyStat(this.message);
}

class SucsessState extends SearchStatues {
  final List<ArticleModel> articles;
  SucsessState(this.articles);
}
