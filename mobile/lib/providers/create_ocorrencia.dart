import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_playground/domain/create_ocorrencia_domain.dart';
import 'package:riverpod_playground/providers/app_providers.dart';

part 'create_ocorrencia.g.dart';

@riverpod
Future<void> inserirOcorrencia(InserirOcorrenciaRef ref, CreateOcorrenciaDomain ocorrencia) async {
  final client = ref.watch(supabaseClientProvider);
  final response = await client
      .from('posts_controle_diario')
      .insert(ocorrencia.toMap());

  if (response != null && response.error != null) {
    throw Exception('Failed to insert data: ${response.error!.message}');
  }
}
