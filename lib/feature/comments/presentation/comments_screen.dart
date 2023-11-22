import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tcb_recruitment_app/common/app_bar.dart';
import 'package:tcb_recruitment_app/feature/comments/domain/comment.dart';
import 'package:tcb_recruitment_app/feature/comments/presentation/controller/comments_controller.dart';
import 'package:tcb_recruitment_app/utils/padding.dart';
import 'package:tcb_recruitment_app/utils/sizes.dart';

class CommentsScreen extends ConsumerStatefulWidget {
  const CommentsScreen({super.key});

  @override
  ConsumerState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends ConsumerState<CommentsScreen> {
  @override
  void initState() {
    ref.read(commentsPagingControllerProvider).addPageRequestListener((pageKey) {
      ref.read(commentsProvider(pageKey));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar('COMMENTS'),
      body: PagedListView.separated(
        pagingController: ref.watch(commentsPagingControllerProvider),
        separatorBuilder: (_, __) => spaceH16,
        builderDelegate: PagedChildBuilderDelegate<Comment>(
          itemBuilder: (_, comment, __) => _Item(comment),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.comment);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.s8),
      ),
      color: Colors.black26,
      child: _ItemContent(comment),
    ).paddingSymmetric(h: AppSizes.s32);
  }
}

class _ItemContent extends StatelessWidget {
  const _ItemContent(this.comment);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ItemTitle(
          name: comment.name,
          email: comment.email,
        ),
        spaceH12,
        Text(
          comment.body,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ).paddingSymmetric(
      v: AppSizes.s12,
      h: AppSizes.s8,
    );
  }
}

class _ItemTitle extends StatelessWidget {
  const _ItemTitle({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name: $name',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        spaceH8,
        Text(
          'Email: $email',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
