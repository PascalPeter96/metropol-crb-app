// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_repayment_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loanRepaymentRepositoryHash() =>
    r'ec876a8e6ebd6d0925f269bec652b91169cf71c9';

/// See also [loanRepaymentRepository].
@ProviderFor(loanRepaymentRepository)
final loanRepaymentRepositoryProvider =
    Provider<LoanRepaymentRepository>.internal(
  loanRepaymentRepository,
  name: r'loanRepaymentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loanRepaymentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoanRepaymentRepositoryRef = ProviderRef<LoanRepaymentRepository>;
String _$getLoanRepaymentsHash() => r'0fdfaf1f37cfafcb63c90df52d850216ab1eca7d';

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

/// See also [getLoanRepayments].
@ProviderFor(getLoanRepayments)
const getLoanRepaymentsProvider = GetLoanRepaymentsFamily();

/// See also [getLoanRepayments].
class GetLoanRepaymentsFamily
    extends Family<AsyncValue<List<LoanRepaymentModel>>> {
  /// See also [getLoanRepayments].
  const GetLoanRepaymentsFamily();

  /// See also [getLoanRepayments].
  GetLoanRepaymentsProvider call(
    String userId,
  ) {
    return GetLoanRepaymentsProvider(
      userId,
    );
  }

  @override
  GetLoanRepaymentsProvider getProviderOverride(
    covariant GetLoanRepaymentsProvider provider,
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
  String? get name => r'getLoanRepaymentsProvider';
}

/// See also [getLoanRepayments].
class GetLoanRepaymentsProvider
    extends AutoDisposeStreamProvider<List<LoanRepaymentModel>> {
  /// See also [getLoanRepayments].
  GetLoanRepaymentsProvider(
    String userId,
  ) : this._internal(
          (ref) => getLoanRepayments(
            ref as GetLoanRepaymentsRef,
            userId,
          ),
          from: getLoanRepaymentsProvider,
          name: r'getLoanRepaymentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLoanRepaymentsHash,
          dependencies: GetLoanRepaymentsFamily._dependencies,
          allTransitiveDependencies:
              GetLoanRepaymentsFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetLoanRepaymentsProvider._internal(
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
    Stream<List<LoanRepaymentModel>> Function(GetLoanRepaymentsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetLoanRepaymentsProvider._internal(
        (ref) => create(ref as GetLoanRepaymentsRef),
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
  AutoDisposeStreamProviderElement<List<LoanRepaymentModel>> createElement() {
    return _GetLoanRepaymentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLoanRepaymentsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetLoanRepaymentsRef
    on AutoDisposeStreamProviderRef<List<LoanRepaymentModel>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetLoanRepaymentsProviderElement
    extends AutoDisposeStreamProviderElement<List<LoanRepaymentModel>>
    with GetLoanRepaymentsRef {
  _GetLoanRepaymentsProviderElement(super.provider);

  @override
  String get userId => (origin as GetLoanRepaymentsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
