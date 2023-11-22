import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tcb_recruitment_app/feature/navigation/domain/app_routes.dart';
import 'package:tcb_recruitment_app/feature/navigation/presentation/controller/navigation_holder_controller.dart';

class NavigationHolder extends ConsumerWidget {
  const NavigationHolder({
    required this.childPage,
    required this.location,
    super.key,
  });

  final Widget childPage;
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(navigationHolderControllerProvider, (_, route) {
      context.goNamed(route.routeName);
    });

    final selectedPage = ref.watch(navigationHolderControllerProvider);

    return Scaffold(
      body: childPage,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: ref.read(navigationHolderControllerProvider.notifier).onSelectItem,
        currentIndex: selectedPage.index,
        items: _tabs,
      ),
    );
  }

  static const List<NavBarItem> _tabs = [
    NavBarItem(
      icon: Icon(Icons.pending_actions_outlined),
      activeIcon: Icon(Icons.pending_actions_outlined),
      label: 'Pictures',
      initialLocation: AppRoutes.galleryScreenPath,
    ),
    NavBarItem(
      icon: Icon(Icons.bar_chart),
      activeIcon: Icon(Icons.bar_chart_outlined),
      label: 'Comments',
      initialLocation: AppRoutes.commentsScreenPath,
    ),
  ];
}

class NavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const NavBarItem({
    required this.initialLocation,
    required super.icon,
    super.label,
    Widget? activeIcon,
  }) : super(activeIcon: activeIcon ?? icon);
}
