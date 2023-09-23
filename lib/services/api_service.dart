import 'package:dio/dio.dart';
import 'package:riverpod_playground/models/post_model.dart';

class ApiService {
  final dio = Dio();
  final baseUrl = 'https://jsonplaceholder.typicode.com';
  final endPoint = '/posts';

  Future<List<Article>> getArticles() async {
    List<Article> articles = [];
    try {
      final response = await dio.get(baseUrl + endPoint);

      if (response.statusCode == 200) {
        for (var item in response.data) {
          articles.add(Article.fromJson(item));
        }
      }
    } catch (ex) {
      rethrow;
    }
    return articles;
  }
}
