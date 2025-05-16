// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_inquiry_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$creditInquiryRepositoryHash() =>
    r'646cf27a818a4c6f35494d42af860e33e09328d6';

/// See also [creditInquiryRepository].
@ProviderFor(creditInquiryRepository)
final creditInquiryRepositoryProvider =
    Provider<CreditInquiryRepository>.internal(
  creditInquiryRepository,
  name: r'creditInquiryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$creditInquiryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CreditInquiryRepositoryRef = ProviderRef<CreditInquiryRepository>;
String _$getCreditInquiriesHash() =>
    r'0bb11b74e6c4aa5f7f53f91b4cf047f8ec23eadb';

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

/// See also [getCreditInquiries].
@ProviderFor(getCreditInquiries)
const getCreditInquiriesProvider = GetCreditInquiriesFamily();

/// See also [getCreditInquiries].
class GetCreditInquiriesFamily
    extends Family<AsyncValue<List<CreditInquiryModel>>> {
  /// See also [getCreditInquiries].
  const GetCreditInquiriesFamily();

  /// See also [getCreditInquiries].
  GetCreditInquiriesProvider call(
    String userId,
  ) {
    return GetCreditInquiriesProvider(
      userId,
    );
  }

  @override
  GetCreditInquiriesProvider getProviderOverride(
    covariant GetCreditInquiriesProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'getCreditInquiriesProvider';
}

/// See also [getCreditInquiries].
class GetCreditInquiriesProvider
    extends AutoDisposeStreamProvider<List<CreditInquiryModel>> {
  /// See also [getCreditInquiries].
  GetCreditInquiriesProvider(
    String userId,
  ) : this._internal(
          (ref) => getCreditInquiries(
            ref as GetCreditInquiriesRef,
            userId,
          ),
          from: getCreditInquiriesProvider,
          name: r'getCreditInquiriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCreditInquiriesHash,
          dependencies: GetCreditInquiriesFamily._dependencies,
          allTransitiveDependencies:
              GetCreditInquiriesFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetCreditInquiriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<List<CreditInquiryModel>> Function(GetCreditInquiriesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCreditInquiriesProvider._internal(
        (ref) => create(ref as GetCreditInquiriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<CreditInquiryModel>> createElement() {
    return _GetCreditInquiriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCreditInquiriesProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCreditInquiriesRef
    on AutoDisposeStreamProviderRef<List<CreditInquiryModel>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetCreditInquiriesProviderElement
    extends AutoDisposeStreamProviderElement<List<CreditInquiryModel>>
    with GetCreditInquiriesRef {
  _GetCreditInquiriesProviderElement(super.provider);

  @override
  String get userId => (origin as GetCreditInquiriesProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
