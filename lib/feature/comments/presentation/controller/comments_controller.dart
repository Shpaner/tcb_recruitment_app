import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcb_recruitment_app/feature/comments/data/comments_repository.dart';
import 'package:tcb_recruitment_app/feature/comments/domain/comment.dart';
import 'package:tcb_recruitment_app/utils/constants.dart';

part 'comments_controller.g.dart';

@riverpod
Future<void> comments(CommentsRef ref, int pageNumber) async {
  final pagingController = ref.read(commentsPagingControllerProvider);

  try {
    final comments =
        await ref.watch(commentsRepositoryProvider).getComments(pageNumber, AppConstants.paginatedPageSize);

    final isLastPage = comments.length < AppConstants.paginatedPageSize;
    if (isLastPage) {
      pagingController.appendLastPage(comments);
    } else {
      pagingController.appendPage(comments, pageNumber + 1);
    }
  } catch (error) {
    pagingController.error = error;
  }
}

@riverpod
PagingController<int, Comment> commentsPagingController(CommentsPagingControllerRef ref) {
  return PagingController(firstPageKey: 1);
}
