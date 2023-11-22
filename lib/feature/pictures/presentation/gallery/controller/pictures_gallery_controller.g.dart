// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pictures_gallery_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$picturesHash() => r'5d7857b102f9437b445b9f9d3c1384b0a3580c74';

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

/// See also [pictures].
@ProviderFor(pictures)
const picturesProvider = PicturesFamily();

/// See also [pictures].
class PicturesFamily extends Family<AsyncValue<void>> {
  /// See also [pictures].
  const PicturesFamily();

  /// See also [pictures].
  PicturesProvider call(
    int pageNumber,
  ) {
    return PicturesProvider(
      pageNumber,
    );
  }

  @override
  PicturesProvider getProviderOverride(
    covariant PicturesProvider provider,
  ) {
    return call(
      provider.pageNumber,
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
  String? get name => r'picturesProvider';
}

/// See also [pictures].
class PicturesProvider extends AutoDisposeFutureProvider<void> {
  /// See also [pictures].
  PicturesProvider(
    int pageNumber,
  ) : this._internal(
          (ref) => pictures(
            ref as PicturesRef,
            pageNumber,
          ),
          from: picturesProvider,
          name: r'picturesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$picturesHash,
          dependencies: PicturesFamily._dependencies,
          allTransitiveDependencies: PicturesFamily._allTransitiveDependencies,
          pageNumber: pageNumber,
        );

  PicturesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageNumber,
  }) : super.internal();

  final int pageNumber;

  @override
  Override overrideWith(
    FutureOr<void> Function(PicturesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PicturesProvider._internal(
        (ref) => create(ref as PicturesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageNumber: pageNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PicturesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PicturesProvider && other.pageNumber == pageNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PicturesRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `pageNumber` of this provider.
  int get pageNumber;
}

class _PicturesProviderElement extends AutoDisposeFutureProviderElement<void>
    with PicturesRef {
  _PicturesProviderElement(super.provider);

  @override
  int get pageNumber => (origin as PicturesProvider).pageNumber;
}

String _$galleryPagingControllerHash() =>
    r'acdff922df567c813a7a953bac79e239288ae7c8';

/// See also [galleryPagingController].
@ProviderFor(galleryPagingController)
final galleryPagingControllerProvider =
    AutoDisposeProvider<PagingController<int, Picture>>.internal(
  galleryPagingController,
  name: r'galleryPagingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$galleryPagingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GalleryPagingControllerRef
    = AutoDisposeProviderRef<PagingController<int, Picture>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
