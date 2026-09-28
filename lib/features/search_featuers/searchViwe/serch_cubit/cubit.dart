import 'package:bloc/bloc.dart';
import 'package:news_app/features/search_featuers/searchViwe/serch_cubit/statues.dart';
import 'package:news_app/features/search_featuers/search_data.dart';

class SearchCubit extends Cubit<SearchStatues> {
  SearchCubit({required this.searchAPI}) : super(InitialState());

  final SearchData searchAPI;

  Future<void> search(String q) async {
    emit(LoadingState());
    try {
      final respons = await searchAPI.searchArt(q);
      if (respons.isEmpty) {
        emit(EmptyStat(q));
      } else {
        emit(SucsessState(respons));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void resetSearch() {
    emit(InitialState());
  }
}
