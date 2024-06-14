import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_playground/domain/aca_post_domain.dart';
import 'package:riverpod_playground/providers/app_providers.dart';

part 'future_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<AcaPostDomain>> academicoPostProvider(
    AcademicoPostProviderRef ref, int catId) async {
  final response = await ref
      .watch(supabaseClientProvider)
      .from('aca_post')
      .select(
          '*, aca_images!inner(*), aca_tag!inner(*), aca_category!inner(*)')
  .eq("cat_id", catId);

  return response.map((e) => AcaPostDomain.fromJson(e)).toList();
}
