// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$academicoPostProviderHash() =>
    r'1ce630b30bc97defc9949837abcce87b85e3898c';

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

/// See also [academicoPostProvider].
@ProviderFor(academicoPostProvider)
const academicoPostProviderProvider = AcademicoPostProviderFamily();

/// See also [academicoPostProvider].
class AcademicoPostProviderFamily
    extends Family<AsyncValue<List<AcaPostDomain>>> {
  /// See also [academicoPostProvider].
  const AcademicoPostProviderFamily();

  /// See also [academicoPostProvider].
  AcademicoPostProviderProvider call(
    int catId,
  ) {
    return AcademicoPostProviderProvider(
      catId,
    );
  }

  @override
  AcademicoPostProviderProvider getProviderOverride(
    covariant AcademicoPostProviderProvider provider,
  ) {
    return call(
      provider.catId,
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
  String? get name => r'academicoPostProviderProvider';
}

/// See also [academicoPostProvider].
class AcademicoPostProviderProvider
    extends FutureProvider<List<AcaPostDomain>> {
  /// See also [academicoPostProvider].
  AcademicoPostProviderProvider(
    int catId,
  ) : this._internal(
          (ref) => academicoPostProvider(
            ref as AcademicoPostProviderRef,
            catId,
          ),
          from: academicoPostProviderProvider,
          name: r'academicoPostProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$academicoPostProviderHash,
          dependencies: AcademicoPostProviderFamily._dependencies,
          allTransitiveDependencies:
              AcademicoPostProviderFamily._allTransitiveDependencies,
          catId: catId,
        );

  AcademicoPostProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.catId,
  }) : super.internal();

  final int catId;

  @override
  Override overrideWith(
    FutureOr<List<AcaPostDomain>> Function(AcademicoPostProviderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AcademicoPostProviderProvider._internal(
        (ref) => create(ref as AcademicoPostProviderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        catId: catId,
      ),
    );
  }

  @override
  FutureProviderElement<List<AcaPostDomain>> createElement() {
    return _AcademicoPostProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AcademicoPostProviderProvider && other.catId == catId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, catId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AcademicoPostProviderRef on FutureProviderRef<List<AcaPostDomain>> {
  /// The parameter `catId` of this provider.
  int get catId;
}

class _AcademicoPostProviderProviderElement
    extends FutureProviderElement<List<AcaPostDomain>>
    with AcademicoPostProviderRef {
  _AcademicoPostProviderProviderElement(super.provider);

  @override
  int get catId => (origin as AcademicoPostProviderProvider).catId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
