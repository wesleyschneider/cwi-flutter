class DogModel {
  final String imageUrl;
  final String breed;

  DogModel({
    required this.imageUrl,
    required this.breed,
  });

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        imageUrl: json['message'],
        breed: (json['message'] as String).split('/')[4],
      );
}
