// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocorrencias_por_aluno_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ocorrenciasPorAlunoHash() =>
    r'0027b222f7f0425352d8e789eeec4f7db39a4aed';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [ocorrenciasPorAluno].
@ProviderFor(ocorrenciasPorAluno)
const ocorrenciasPorAlunoProvider = OcorrenciasPorAlunoFamily();

/// See also [ocorrenciasPorAluno].
class OcorrenciasPorAlunoFamily
    extends Family<AsyncValue<List<OcorrenciaDomain>>> {
  /// See also [ocorrenciasPorAluno].
  const OcorrenciasPorAlunoFamily();

  /// See also [ocorrenciasPorAluno].
  OcorrenciasPorAlunoProvider call(
    int id,
  ) {
    return OcorrenciasPorAlunoProvider(
      id,
    );
  }

  @override
  OcorrenciasPorAlunoProvider getProviderOverride(
    covariant OcorrenciasPorAlunoProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ocorrenciasPorAlunoProvider';
}

/// See also [ocorrenciasPorAluno].
class OcorrenciasPorAlunoProvider
    extends FutureProvider<List<OcorrenciaDomain>> {
  /// See also [ocorrenciasPorAluno].
  OcorrenciasPorAlunoProvider(
    int id,
  ) : this._internal(
          (ref) => ocorrenciasPorAluno(
            ref as OcorrenciasPorAlunoRef,
            id,
          ),
          from: ocorrenciasPorAlunoProvider,
          name: r'ocorrenciasPorAlunoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ocorrenciasPorAlunoHash,
          dependencies: OcorrenciasPorAlunoFamily._dependencies,
          allTransitiveDependencies:
              OcorrenciasPorAlunoFamily._allTransitiveDependencies,
          id: id,
        );

  OcorrenciasPorAlunoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<List<OcorrenciaDomain>> Function(OcorrenciasPorAlunoRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OcorrenciasPorAlunoProvider._internal(
        (ref) => create(ref as OcorrenciasPorAlunoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<List<OcorrenciaDomain>> createElement() {
    return _OcorrenciasPorAlunoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OcorrenciasPorAlunoProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OcorrenciasPorAlunoRef on FutureProviderRef<List<OcorrenciaDomain>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _OcorrenciasPorAlunoProviderElement
    extends FutureProviderElement<List<OcorrenciaDomain>>
    with OcorrenciasPorAlunoRef {
  _OcorrenciasPorAlunoProviderElement(super.provider);

  @override
  int get id => (origin as OcorrenciasPorAlunoProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
