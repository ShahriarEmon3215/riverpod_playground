import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post_model.dart';
import '../providers/homeProvider.dart';
class HomeScreenApiCall extends ConsumerWidget {
  const HomeScreenApiCall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          ref.read(articleStateProvider.notifier).fetchArticles();
        },
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Consumer(
            builder: (context, ref, child) {
              ArticleState state = ref.watch(articleStateProvider);
              if (state is InitialArticleState) {
                return const Center(
                  child: Text("Init State"),
                );
              }

              if (state is LoadingArticleState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ErrorArticleState) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              if (state is LoadedArticleState) {
                return dataListView(state);
              }

              return const Center(
                child: Text("Something went wrong"),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget dataListView(LoadedArticleState state) {
    return ListView.builder(
      itemCount: state.articles.length,
      itemBuilder: (context, index) {
        Article article = state.articles[index];
        return Card(
          child: ListTile(
            title: Text(article.title ?? ""),
            subtitle: Text(article.body ?? ""),
          ),
        );
      },
    );
  }
}
