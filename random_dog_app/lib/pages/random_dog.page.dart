import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_dog_app/models/dog.model.dart';
import 'package:random_dog_app/repositories/dog_image.repository.dart';

class RandomDogPage extends StatefulWidget {
  const RandomDogPage({Key? key}) : super(key: key);

  @override
  _RandomDogPageState createState() => _RandomDogPageState();
}

class _RandomDogPageState extends State<RandomDogPage> {
  DogModel model = DogModel(
    imageUrl: 'https://images.dog.ceo/breeds/otterhound/n02091635_923.jpg',
    breed: 'otterhound',
  );
  bool loading = false;

  final repository = DogImageRepository(provider: Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21252B),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            loading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          model.imageUrl,
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });

                  repository.fetchRandomImage().then((value) {
                    setState(() {
                      model = value;
                      loading = false;
                    });
                  });
                },
                child: const Text(
                  'Refresh',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF03A87C),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
