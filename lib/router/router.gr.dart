// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:readershaven_app/modules/description/view/description_page.dart'
    as _i1;
import 'package:readershaven_app/modules/home/view/home_page.dart' as _i3;
import 'package:readershaven_app/modules/library/view/library_page.dart' as _i2;
import 'package:readershaven_app/modules/reader/view/reader_page.dart' as _i4;
import 'package:readershaven_app/modules/search/view/search_page.dart' as _i5;
import 'package:readershaven_app/modules/settings/view/settings_page.dart'
    as _i6;

/// generated route for
/// [_i1.DescriptionPage]
class DescriptionRoute extends _i7.PageRouteInfo<DescriptionRouteArgs> {
  DescriptionRoute({
    _i8.Key? key,
    required int id,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          DescriptionRoute.name,
          args: DescriptionRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'DescriptionRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DescriptionRouteArgs>();
      return _i1.DescriptionPage(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class DescriptionRouteArgs {
  const DescriptionRouteArgs({
    this.key,
    required this.id,
  });

  final _i8.Key? key;

  final int id;

  @override
  String toString() {
    return 'DescriptionRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.LibraryPage]
class LibraryRoute extends _i7.PageRouteInfo<void> {
  const LibraryRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LibraryRoute.name,
          initialChildren: children,
        );

  static const String name = 'LibraryRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.LibraryPage();
    },
  );
}

/// generated route for
/// [_i3.MyHomePage]
class MyHomeRoute extends _i7.PageRouteInfo<void> {
  const MyHomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.MyHomePage();
    },
  );
}

/// generated route for
/// [_i4.ReaderPage]
class ReaderRoute extends _i7.PageRouteInfo<ReaderRouteArgs> {
  ReaderRoute({
    _i8.Key? key,
    required String title,
    required String file,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ReaderRoute.name,
          args: ReaderRouteArgs(
            key: key,
            title: title,
            file: file,
          ),
          initialChildren: children,
        );

  static const String name = 'ReaderRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReaderRouteArgs>();
      return _i4.ReaderPage(
        key: args.key,
        title: args.title,
        file: args.file,
      );
    },
  );
}

class ReaderRouteArgs {
  const ReaderRouteArgs({
    this.key,
    required this.title,
    required this.file,
  });

  final _i8.Key? key;

  final String title;

  final String file;

  @override
  String toString() {
    return 'ReaderRouteArgs{key: $key, title: $title, file: $file}';
  }
}

/// generated route for
/// [_i5.SearchPage]
class SearchRoute extends _i7.PageRouteInfo<void> {
  const SearchRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SearchPage();
    },
  );
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsPage();
    },
  );
}
