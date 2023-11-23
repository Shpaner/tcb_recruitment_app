import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcb_recruitment_app/feature/pictures/domain/picture.dart';
import 'package:tcb_recruitment_app/network/api.dart';
import 'package:tcb_recruitment_app/network/dio/dio.dart';

part 'pictures_repository.g.dart';

@RestApi(baseUrl: AppApis.apiUrl)
abstract class PicturesRepository {
  factory PicturesRepository(Dio dio) = _PicturesRepository;

  @GET(AppApis.photos)
  Future<List<Picture>> getPictures(
    @Query(AppApis.page) int page,
    @Query(AppApis.limit) int limit,
  );
}

@riverpod
PicturesRepository picturesRepository(PicturesRepositoryRef ref) {
  return PicturesRepository(
    ref.watch(dioProvider),
  );
}
