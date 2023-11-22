import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcb_recruitment_app/feature/pictures/domain/picture.dart';
import 'package:tcb_recruitment_app/network/dio.dart';

part 'pictures_repository.g.dart';

class PicturesRepository {
  const PicturesRepository(this._dio);

  final Dio _dio;

  final _url = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Picture>> getPictures(int page, int limit) async {
    final response = await _dio.get('$_url?_page=$page&_limit=$limit');

    final data = response.data as List;
    return List<Picture>.from(data.map((item) => Picture.fromJson(item)).toList());
  }
}

@riverpod
PicturesRepository picturesRepository(PicturesRepositoryRef ref) {
  return PicturesRepository(
    ref.watch(dioProvider),
  );
}
