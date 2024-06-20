import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_playground/domain/ocorrencia_domain.dart';
import 'package:riverpod_playground/providers/app_providers.dart';

import '../pages/controle_diario_create_page.dart';

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
