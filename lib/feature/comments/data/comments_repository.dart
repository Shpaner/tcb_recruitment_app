import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcb_recruitment_app/feature/comments/domain/comment.dart';
import 'package:tcb_recruitment_app/network/dio.dart';

part 'comments_repository.g.dart';

class CommentsRepository {
  const CommentsRepository(this._dio);

  final Dio _dio;

  final _url = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<Comment>> getComments(int page, int limit) async {
    final response = await _dio.get('$_url?_page=$page&_limit=$limit');

    final data = response.data as List;
    return List<Comment>.from(data.map((item) => Comment.fromJson(item)).toList());
  }
}

@riverpod
CommentsRepository commentsRepository(CommentsRepositoryRef ref) {
  return CommentsRepository(
    ref.watch(dioProvider),
  );
}
