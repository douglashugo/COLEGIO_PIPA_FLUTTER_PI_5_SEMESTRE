// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ocorrencia.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$inserirOcorrenciaHash() => r'bf3c585db5a2a805c4b5b6aa3d2194377464144c';

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

/// See also [inserirOcorrencia].
@ProviderFor(inserirOcorrencia)
const inserirOcorrenciaProvider = InserirOcorrenciaFamily();

/// See also [inserirOcorrencia].
class InserirOcorrenciaFamily extends Family<AsyncValue<void>> {
  /// See also [inserirOcorrencia].
  const InserirOcorrenciaFamily();

  /// See also [inserirOcorrencia].
  InserirOcorrenciaProvider call(
    ocorrencia,
  ) {
    return InserirOcorrenciaProvider(
      ocorrencia,
    );
  }

  @override
  InserirOcorrenciaProvider getProviderOverride(
    covariant InserirOcorrenciaProvider provider,
  ) {
    return call(
      provider.ocorrencia,
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
  String? get name => r'inserirOcorrenciaProvider';
}

/// See also [inserirOcorrencia].
class InserirOcorrenciaProvider extends AutoDisposeFutureProvider<void> {
  /// See also [inserirOcorrencia].
  InserirOcorrenciaProvider(
    ocorrencia,
  ) : this._internal(
          (ref) => inserirOcorrencia(
            ref as InserirOcorrenciaRef,
            ocorrencia,
          ),
          from: inserirOcorrenciaProvider,
          name: r'inserirOcorrenciaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$inserirOcorrenciaHash,
          dependencies: InserirOcorrenciaFamily._dependencies,
          allTransitiveDependencies:
              InserirOcorrenciaFamily._allTransitiveDependencies,
          ocorrencia: ocorrencia,
        );

  InserirOcorrenciaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ocorrencia,
  }) : super.internal();

  final CreateOcorrenciaDomain ocorrencia;

  @override
  Override overrideWith(
    FutureOr<void> Function(InserirOcorrenciaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InserirOcorrenciaProvider._internal(
        (ref) => create(ref as InserirOcorrenciaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ocorrencia: ocorrencia,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _InserirOcorrenciaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InserirOcorrenciaProvider && other.ocorrencia == ocorrencia;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ocorrencia.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InserirOcorrenciaRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `ocorrencia` of this provider.
  get ocorrencia;
}

class _InserirOcorrenciaProviderElement
    extends AutoDisposeFutureProviderElement<void> with InserirOcorrenciaRef {
  _InserirOcorrenciaProviderElement(super.provider);

  @override
  get ocorrencia =>
      (origin as InserirOcorrenciaProvider).ocorrencia;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
