// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dbsongHash() => r'3bc988a926c31cce8134142cb44a87977d887347';

/// See also [dbsong].
@ProviderFor(dbsong)
final dbsongProvider = AutoDisposeFutureProvider<List<SongsEntity>>.internal(
  dbsong,
  name: r'dbsongProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dbsongHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DbsongRef = AutoDisposeFutureProviderRef<List<SongsEntity>>;
String _$addsongHash() => r'83589349dcdb6ea44def6478d5f74901e473ad65';

/// See also [Addsong].
@ProviderFor(Addsong)
final addsongProvider =
    AutoDisposeNotifierProvider<Addsong, List<SongsEntity>>.internal(
  Addsong.new,
  name: r'addsongProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addsongHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Addsong = AutoDisposeNotifier<List<SongsEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
