import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcb_recruitment_app/feature/comments/domain/comment.dart';
import 'package:tcb_recruitment_app/network/api.dart';
import 'package:tcb_recruitment_app/network/dio/dio.dart';

part 'comments_repository.g.dart';

@RestApi(baseUrl: AppApis.apiUrl)
abstract class CommentsRepository {
  factory CommentsRepository(Dio dio) = _CommentsRepository;

  @GET(AppApis.comments)
  Future<List<Comment>> getComments(
    @Query(AppApis.page) int page,
    @Query(AppApis.limit) int limit,
  );
}

@riverpod
CommentsRepository commentsRepository(CommentsRepositoryRef ref) {
  return CommentsRepository(
    ref.watch(dioProvider),
  );
}
