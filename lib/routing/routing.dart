import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_platter/common/ui_widgets/base_page.dart';
import 'package:life_platter/common/ui_widgets/empty_page.dart';
import 'package:life_platter/features/tab_cooking_calendar/presentation/cooking_calendar_page.dart';

// Navigator : 画面のスタック（履歴）を管理するクラス
// NavigatorState : Navigator の状態やコントローラー
// 各 Branch の Navigatorの状態をグローバルに管理する
final rootNavigatorKey = GlobalKey<NavigatorState>();
final calendarNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'calendar');
final menuBookNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'menuBook');
final addNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'add');
final graphNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'graph');
final ohtersNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'ohters');

/// アプリのルーティングを管理するクラス
class Routing {
  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: CookingCalendarPage.path,
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
                path: CookingCalendarPage.path,
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
          // menuBook Branch
          StatefulShellBranch(
            navigatorKey: menuBookNavigatorKey,
            routes: [
              GoRoute(
                path: '/menuBook',
                pageBuilder:
                    (context, state) => const NoTransitionPage(
                      child: EmptyPage(title: '料理リスト'),
                    ),
              ),
            ],
          ),
          // add Branch
          StatefulShellBranch(
            navigatorKey: addNavigatorKey,
            routes: [
              GoRoute(
                path: '/add',
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: EmptyPage(title: '料理追加')),
              ),
            ],
          ),
          // graph Branch
          StatefulShellBranch(
            navigatorKey: graphNavigatorKey,
            routes: [
              GoRoute(
                path: '/graph',
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: EmptyPage(title: 'グラフ')),
              ),
            ],
          ),
          // ohters Branch
          StatefulShellBranch(
            navigatorKey: ohtersNavigatorKey,
            routes: [
              GoRoute(
                path: '/others',
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: EmptyPage(title: 'その他')),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
