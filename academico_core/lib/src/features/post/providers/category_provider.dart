import 'package:academico_core/src/features/post/providers/app_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/aca_category.dart';

part 'category_provider.g.dart';

@riverpod
FutureOr<List<AcaCategory>> categories(CategoriesRef ref) async {
  final response = await ref.watch(supabaseClientProvider)
      .from('categories')
      .select('*');

  return [for (final c in response) AcaCategory.fromJson(c)];

}