import 'package:dio/dio.dart';
import 'package:news_app/features/search_featuers/appconfig.dart';
import 'package:news_app/features/search_featuers/artiiclsModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SearchData {
  final Dio dio;

  SearchData()
    : dio = Dio(
        BaseOptions(
          baseUrl: Appconfig.baseUrl,

          headers: {'apiKey': Appconfig.apikey},
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
        ),
      )..interceptors.add(PrettyDioLogger(requestHeader: true, error: true));

  Future<List<ArticleModel>> searchArt(
    String q,
    int currentpage,
    int pageSize,
  ) async {
    
    try {
      final response = await dio.get(
        Appconfig.eveything,
        queryParameters: {
          'q': q,
          'apiKey': Appconfig.apikey,
          'language': 'en',
          'pageSize': pageSize,
          'page': currentpage,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        NewsResponse data = NewsResponse.fromJson(response.data);
        return data.articles;
      }

      throw Exception('Request failed');
    } on DioException catch (e) {
      if (e.type == DioException.connectionTimeout) {
        throw Exception('fiald to connect server');
      } else if (e.type == DioException.receiveTimeout) {
        throw Exception('connect time out');
      }
      rethrow;
    }
  }
}
