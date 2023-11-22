import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcb_recruitment_app/feature/comments/presentation/comments_screen.dart';
import 'package:tcb_recruitment_app/feature/navigation/domain/app_routes.dart';
import 'package:tcb_recruitment_app/feature/navigation/presentation/navigation_holder.dart';
import 'package:tcb_recruitment_app/feature/pictures/domain/picture.dart';
import 'package:tcb_recruitment_app/feature/pictures/presentation/details/picture_details_screen.dart';
import 'package:tcb_recruitment_app/feature/pictures/presentation/gallery/pictures_gallery_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final rootNavigatorKey = ref.watch(rootNavigatorKeyProvider);
  final shellNavigatorKey = ref.watch(shellNavigatorKeyProvider);

  return GoRouter(
    initialLocation: AppRoutes.galleryScreenPath,
    navigatorKey: rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => NavigationHolder(
          location: state.matchedLocation,
          childPage: child,
        ),
        routes: [
          GoRoute(
            name: AppRoutes.galleryScreenName,
            path: AppRoutes.galleryScreenPath,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PicturesGalleryScreen(),
            ),
            routes: [
              GoRoute(
                name: AppRoutes.pictureScreenName,
                path: AppRoutes.pictureScreenPath,
                parentNavigatorKey: shellNavigatorKey,
                builder: (context, state) => PictureDetailsScreen(
                  picture: state.extra as Picture,
                ),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.commentsScreenName,
            path: AppRoutes.commentsScreenPath,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CommentsScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}

@riverpod
GlobalKey<NavigatorState> rootNavigatorKey(RootNavigatorKeyRef ref) => GlobalKey<NavigatorState>();

@riverpod
GlobalKey<NavigatorState> shellNavigatorKey(ShellNavigatorKeyRef ref) => GlobalKey<NavigatorState>();
