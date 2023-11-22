import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tcb_recruitment_app/common/app_bar.dart';
import 'package:tcb_recruitment_app/feature/pictures/domain/picture.dart';
import 'package:tcb_recruitment_app/utils/context.dart';
import 'package:tcb_recruitment_app/utils/sizes.dart';

class PictureDetailsScreen extends StatefulWidget {
  const PictureDetailsScreen({
    required this.picture,
    super.key,
  });

  final Picture picture;

  @override
  State<PictureDetailsScreen> createState() => _PictureDetailsScreenState();
}

class _PictureDetailsScreenState extends State<PictureDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(widget.picture.title),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: widget.picture.url,
          key: imageKey,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => _ErrorWidget(
            onTap: () => setState(() {}),
          ),
          errorListener: (error) => context.showErrorSnackBar('Something went wrong. Check your internet connection'),
        ),
      ),
    );
  }

  ValueKey get imageKey {
    /// Make sure that key is always different when rebuilding widget
    return ValueKey(Random().nextInt(100));
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.outlined(
          onPressed: onTap,
          icon: const Icon(Icons.refresh),
        ),
        spaceH16,
        const Text('Refresh'),
      ],
    );
  }
}
