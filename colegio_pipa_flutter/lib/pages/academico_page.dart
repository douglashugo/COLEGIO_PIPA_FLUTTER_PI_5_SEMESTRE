import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/domain/aca_category.dart';
import 'package:riverpod_playground/pages/widgets/loading_widget.dart';
import '../providers/future_provider.dart';
import 'widgets/academico_posts_page.dart';

class AcademicoPage extends ConsumerWidget {
  const AcademicoPage({required this.category, super.key});

  final AcaCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var posts = ref.watch(academicoPostProviderProvider(category.id!));
    return Scaffold(
      appBar: AppBar(
        title: Text(category.description!),
      ),
      body: posts.when(
        data: (data) {
          return PostsPage(posts: data);
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        },
        loading: () {
          return const LoadingWidget();
        },
      ),
    );
  }
}
