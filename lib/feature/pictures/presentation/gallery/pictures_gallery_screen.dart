import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tcb_recruitment_app/common/app_bar.dart';
import 'package:tcb_recruitment_app/feature/navigation/domain/app_routes.dart';
import 'package:tcb_recruitment_app/feature/pictures/domain/picture.dart';
import 'package:tcb_recruitment_app/feature/pictures/presentation/gallery/controller/pictures_gallery_controller.dart';
import 'package:tcb_recruitment_app/utils/constants.dart';
import 'package:tcb_recruitment_app/utils/context.dart';
import 'package:tcb_recruitment_app/utils/padding.dart';
import 'package:tcb_recruitment_app/utils/sizes.dart';

class PicturesGalleryScreen extends ConsumerStatefulWidget {
  const PicturesGalleryScreen({super.key});

  @override
  ConsumerState createState() => _PicturesScreenState();
}

class _PicturesScreenState extends ConsumerState<PicturesGalleryScreen> {
  @override
  void initState() {
    ref.read(galleryPagingControllerProvider).addPageRequestListener((pageKey) {
      ref.read(picturesProvider(pageKey));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar('GALLERY'),
      body: PagedMasonryGridView.count(
        crossAxisCount: AppConstants.gridSize,
        pagingController: ref.watch(galleryPagingControllerProvider),
        builderDelegate: PagedChildBuilderDelegate<Picture>(
          itemBuilder: (_, picture, __) => _Item(picture),
        ),
      ).paddingSymmetric(h: AppSizes.s32),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.picture);

  final Picture picture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPictureSelected(context),
      child: CachedNetworkImage(
        imageUrl: picture.thumbnailUrl,
        errorWidget: (_, __, ___) => const Icon(Icons.error),
        errorListener: (error) => context.showErrorSnackBar(error.toString()),
      ).paddingAll(AppSizes.s4),
    );
  }

  void onPictureSelected(BuildContext context) {
    context.pushNamed(
      AppRoutes.pictureScreenName,
      extra: picture,
    );
  }
}
