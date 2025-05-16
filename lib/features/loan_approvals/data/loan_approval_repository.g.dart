// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_approval_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loanApprovalRepositoryHash() =>
    r'7f8f3d7247bb68474ecd7ec3400da9e8999e4b92';

/// See also [loanApprovalRepository].
@ProviderFor(loanApprovalRepository)
final loanApprovalRepositoryProvider =
    Provider<LoanApprovalRepository>.internal(
  loanApprovalRepository,
  name: r'loanApprovalRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loanApprovalRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoanApprovalRepositoryRef = ProviderRef<LoanApprovalRepository>;
String _$getLoanApprovalsHash() => r'c6deae4f3c6838e73d0909c976e269873958b4d1';

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

/// See also [getLoanApprovals].
@ProviderFor(getLoanApprovals)
const getLoanApprovalsProvider = GetLoanApprovalsFamily();

/// See also [getLoanApprovals].
class GetLoanApprovalsFamily
    extends Family<AsyncValue<List<LoanApprovalModel>>> {
  /// See also [getLoanApprovals].
  const GetLoanApprovalsFamily();

  /// See also [getLoanApprovals].
  GetLoanApprovalsProvider call(
    String userId,
  ) {
    return GetLoanApprovalsProvider(
      userId,
    );
  }

  @override
  GetLoanApprovalsProvider getProviderOverride(
    covariant GetLoanApprovalsProvider provider,
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
  String? get name => r'getLoanApprovalsProvider';
}

/// See also [getLoanApprovals].
class GetLoanApprovalsProvider
    extends AutoDisposeStreamProvider<List<LoanApprovalModel>> {
  /// See also [getLoanApprovals].
  GetLoanApprovalsProvider(
    String userId,
  ) : this._internal(
          (ref) => getLoanApprovals(
            ref as GetLoanApprovalsRef,
            userId,
          ),
          from: getLoanApprovalsProvider,
          name: r'getLoanApprovalsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLoanApprovalsHash,
          dependencies: GetLoanApprovalsFamily._dependencies,
          allTransitiveDependencies:
              GetLoanApprovalsFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetLoanApprovalsProvider._internal(
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
    Stream<List<LoanApprovalModel>> Function(GetLoanApprovalsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetLoanApprovalsProvider._internal(
        (ref) => create(ref as GetLoanApprovalsRef),
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
  AutoDisposeStreamProviderElement<List<LoanApprovalModel>> createElement() {
    return _GetLoanApprovalsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLoanApprovalsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetLoanApprovalsRef
    on AutoDisposeStreamProviderRef<List<LoanApprovalModel>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetLoanApprovalsProviderElement
    extends AutoDisposeStreamProviderElement<List<LoanApprovalModel>>
    with GetLoanApprovalsRef {
  _GetLoanApprovalsProviderElement(super.provider);

  @override
  String get userId => (origin as GetLoanApprovalsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
