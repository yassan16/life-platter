import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_platter/base_screen.dart';
import 'package:life_platter/sample_screen.dart';

// Navigator : 画面のスタック（履歴）を管理するクラス
// NavigatorState : Navigator の状態やコントローラー
// 各 Branch の Navigatorの状態をグローバルに管理する
final rootNavigatorKey = GlobalKey<NavigatorState>();
final featuresNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'features');
final mapboxNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mapbox');
final spareNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'spare');

/// アプリのルーティングを管理するクラス
class Routing {
  // Features Branch
  static final String featuresScreenRouter = '/features';

  // 01_widget_tree
  static final String route_01 = '/01_widget_tree';
  static final String route_01_001 =
      '$route_01/001_parent_child_widget_rebuild';
  static final String route_01_002 = '$route_01/002_listview_builder';

  // Mapbox Branch
  static final String bScreenRouter = '/b';

  // 予備 Branch
  static final String cScreenRouter = '/c';

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: featuresScreenRouter,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return BaseScreen(navigationShell: navigationShell);
        },
        branches: [
          // Features Branch
          StatefulShellBranch(
            navigatorKey: featuresNavigatorKey,
            routes: [
              GoRoute(
                path: featuresScreenRouter,
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: SampleScreen()),
                routes: [
                  // GoRoute(
                  //   path: route_01_001,
                  //   builder:
                  //       (context, state) => ParentChildWidgetRebuild001Screen(),
                  // ),
                  // GoRoute(
                  //   path: route_01_002,
                  //   builder: (context, state) => ListviewPaginationScreen(),
                  // ),
                ],
              ),
            ],
          ),
          // Mapbox Branch
          // StatefulShellBranch(
          //   navigatorKey: mapboxNavigatorKey,
          //   routes: [
          //     GoRoute(
          //       path: bScreenRouter,
          //       pageBuilder:
          //           (context, state) =>
          //               const NoTransitionPage(child: MapboxScreen()),
          //     ),
          //   ],
          // ),

          // 予備 Branch
          // StatefulShellBranch(
          //   navigatorKey: spareNavigatorKey,
          //   routes: [
          //     GoRoute(
          //       path: cScreenRouter,
          //       pageBuilder:
          //           (context, state) =>
          //               const NoTransitionPage(child: ScreenC()),
          //     ),
          //   ],
          // ),
        ],
      ),
    ],
  );
}
