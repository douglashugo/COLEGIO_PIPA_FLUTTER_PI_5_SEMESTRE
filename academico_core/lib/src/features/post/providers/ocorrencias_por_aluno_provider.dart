import 'package:academico_core/src/features/post/domain/model/ocorrencia_domain.dart';
import 'package:academico_core/src/features/post/providers/app_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ocorrencias_por_aluno_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<OcorrenciaDomain>> ocorrenciasPorAluno(OcorrenciasPorAlunoRef ref, int id) async {
  final response = await ref
      .watch(supabaseClientProvider)
      .from('posts_controle_diario')
      .select(
          '*')
  .eq("aluno_id", id);

  return response.map((e) => OcorrenciaDomain.fromMap(e)).toList();
}
