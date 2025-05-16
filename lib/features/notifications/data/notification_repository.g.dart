// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationRepositoryHash() =>
    r'ef7f36e7094dfb0507f157c91660d7c773a80b0e';

/// See also [notificationRepository].
@ProviderFor(notificationRepository)
final notificationRepositoryProvider =
    Provider<NotificationRepository>.internal(
  notificationRepository,
  name: r'notificationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationRepositoryRef = ProviderRef<NotificationRepository>;
String _$getNotificationsHash() => r'aac18444321b1fff2159991b6fcfeb95630fd62a';

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

/// See also [getNotifications].
@ProviderFor(getNotifications)
const getNotificationsProvider = GetNotificationsFamily();

/// See also [getNotifications].
class GetNotificationsFamily
    extends Family<AsyncValue<List<NotificationsModel>>> {
  /// See also [getNotifications].
  const GetNotificationsFamily();

  /// See also [getNotifications].
  GetNotificationsProvider call(
    String userId,
  ) {
    return GetNotificationsProvider(
      userId,
    );
  }

  @override
  GetNotificationsProvider getProviderOverride(
    covariant GetNotificationsProvider provider,
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
  String? get name => r'getNotificationsProvider';
}

/// See also [getNotifications].
class GetNotificationsProvider
    extends AutoDisposeStreamProvider<List<NotificationsModel>> {
  /// See also [getNotifications].
  GetNotificationsProvider(
    String userId,
  ) : this._internal(
          (ref) => getNotifications(
            ref as GetNotificationsRef,
            userId,
          ),
          from: getNotificationsProvider,
          name: r'getNotificationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNotificationsHash,
          dependencies: GetNotificationsFamily._dependencies,
          allTransitiveDependencies:
              GetNotificationsFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetNotificationsProvider._internal(
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
    Stream<List<NotificationsModel>> Function(GetNotificationsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNotificationsProvider._internal(
        (ref) => create(ref as GetNotificationsRef),
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
  AutoDisposeStreamProviderElement<List<NotificationsModel>> createElement() {
    return _GetNotificationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNotificationsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetNotificationsRef
    on AutoDisposeStreamProviderRef<List<NotificationsModel>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetNotificationsProviderElement
    extends AutoDisposeStreamProviderElement<List<NotificationsModel>>
    with GetNotificationsRef {
  _GetNotificationsProviderElement(super.provider);

  @override
  String get userId => (origin as GetNotificationsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
