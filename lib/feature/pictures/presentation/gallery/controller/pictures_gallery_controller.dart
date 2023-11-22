import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcb_recruitment_app/feature/pictures/data/pictures_repository.dart';
import 'package:tcb_recruitment_app/feature/pictures/domain/picture.dart';
import 'package:tcb_recruitment_app/utils/constants.dart';

part 'pictures_gallery_controller.g.dart';

@riverpod
Future<void> pictures(PicturesRef ref, int pageNumber) async {
  final pagingController = ref.read(galleryPagingControllerProvider);

  try {
    final pictures =
        await ref.watch(picturesRepositoryProvider).getPictures(pageNumber, AppConstants.paginatedPageSize);

    final isLastPage = pictures.length < AppConstants.paginatedPageSize;
    if (isLastPage) {
      pagingController.appendLastPage(pictures);
    } else {
      pagingController.appendPage(pictures, pageNumber + 1);
    }
  } catch (error) {
    pagingController.error = error;
  }
}

@riverpod
PagingController<int, Picture> galleryPagingController(GalleryPagingControllerRef ref) {
  return PagingController(firstPageKey: 1);
}
