import 'package:bloc/bloc.dart';
import 'package:news_app/features/search_featuers/artiiclsModel.dart';
import 'package:news_app/features/search_featuers/searchViwe/serch_cubit/statues.dart';
import 'package:news_app/features/search_featuers/search_data.dart';

class SearchCubit extends Cubit<SearchStatues> {
  SearchCubit({required this.searchAPI}) : super(InitialState());

  final SearchData searchAPI;

  int currentpage = 1;
  final page_siaze = 10;
  bool hasMore = true;
  bool isfeatching = false;
  List<ArticleModel> allArticl = [];

  Future<void> search(String q) async {
    if (!hasMore || isfeatching) {
      return;
    }
    isfeatching = true;
    emit(LoadingState());

    try {
      final respons = await searchAPI.searchArt(q, currentpage, page_siaze);
      if (respons.isEmpty) {
        emit(EmptyStat(q));
        hasMore = false;
      } else {
        allArticl.addAll(respons);
        emit(SucsessState(List.from(allArticl)));
        currentpage++;
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
    isfeatching = false;
  }

  void resetSearch() {
    currentpage = 1;
    hasMore = true;
    isfeatching = false;
    allArticl.clear();

    emit(InitialState());
  }
}
