import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcb_recruitment_app/feature/navigation/domain/app_routes.dart';

part 'navigation_holder_controller.g.dart';

@riverpod
class NavigationHolderController extends _$NavigationHolderController {
  @override
  NavbarPage build() => NavbarPage.pictures;

  void onSelectItem(int index) {
    state = NavbarPage.values.firstWhere((val) => val.index == index);
  }
}
