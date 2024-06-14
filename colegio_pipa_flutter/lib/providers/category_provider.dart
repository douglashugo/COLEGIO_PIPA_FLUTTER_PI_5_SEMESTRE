import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_playground/domain/aca_category.dart';
import 'package:riverpod_playground/providers/app_providers.dart';

part 'category_provider.g.dart';

@riverpod
FutureOr<List<AcaCategory>> categories(CategoriesRef ref) async {
  final response = await ref.watch(supabaseClientProvider)
      .from('aca_category')
      .select('*');

  return [for (final c in response) AcaCategory.fromJson(c)];

}