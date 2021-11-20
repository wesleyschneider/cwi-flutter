import 'package:dio/dio.dart';
import 'package:random_dog_app/models/dog.model.dart';
import 'dart:developer' as dev;

class DogImageRepository {
  final Dio provider;

  DogImageRepository({
    required this.provider,
  });

  Future<DogModel> fetchRandomImage() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      final response =
          await provider.get('https://dog.ceo/api/breeds/image/random');

      dev.log(response.statusCode.toString());

      final DogModel dog = DogModel.fromJson(response.data);

      dev.log(dog.breed);
      dev.log(dog.imageUrl);

      return dog;
    } catch (e) {
      throw Exception('Ops, não obtivemos sucesso na requisição');
    }
  }
}
