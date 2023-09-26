import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_model.dart';
import '../services/api_service.dart';

final articleStateProvider =
    StateNotifierProvider.autoDispose<ArticleProvider, ArticleState>(
  (ref) => ArticleProvider(),
);

abstract class ArticleState {}

class InitialArticleState extends ArticleState {}

class LoadingArticleState extends ArticleState {}

class LoadedArticleState extends ArticleState {
  LoadedArticleState({required this.articles});

  List<Article> articles = [];
}

class ErrorArticleState extends ArticleState {
  ErrorArticleState({required this.errorMessage});

  String errorMessage = "";
}

class ArticleProvider extends StateNotifier<ArticleState> {
  ArticleProvider() : super(InitialArticleState()) {
   fetchArticles();
  }

  ApiService service = ApiService();

  fetchArticles() async {
    try {
      state = LoadingArticleState();
      var loadedArticles = await service.getArticles();
      state = LoadedArticleState(articles: loadedArticles);
    } catch (ex) {
      state = ErrorArticleState(errorMessage: ex.toString());
    }
  }
}
