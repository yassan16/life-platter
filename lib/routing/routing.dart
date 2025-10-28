import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_platter/common/ui_widgets/base_page.dart';
import 'package:life_platter/features/tab_cooking_calendar/presentation/cooking_calendar_page.dart';

// Navigator : 画面のスタック（履歴）を管理するクラス
// NavigatorState : Navigator の状態やコントローラー
// 各 Branch の Navigatorの状態をグローバルに管理する
final rootNavigatorKey = GlobalKey<NavigatorState>();
final calendarNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'calendar');
final mapboxNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mapbox');
final spareNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'spare');

/// アプリのルーティングを管理するクラス
class Routing {
  // calendar Branch
  static final String calendarScreenRouter = '/calendar';

  // Mapbox Branch
  static final String bScreenRouter = '/b';

  // 予備 Branch
  static final String cScreenRouter = '/c';

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: calendarScreenRouter,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return BasePage(navigationShell: navigationShell);
        },
        branches: [
          // calendar Branch
          StatefulShellBranch(
            navigatorKey: calendarNavigatorKey,
            routes: [
              GoRoute(
                path: calendarScreenRouter,
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: CookingCalendarPage()),
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
