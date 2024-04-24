import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String carModel = ''; // Переменная для хранения модели автомобиля
  String carPhotoUrl = ''; // Переменная для хранения URL фотографии автомобиля

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная страница'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Информация о вашем автомобиле:',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Модель: $carModel',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            carPhotoUrl.isNotEmpty
                ? Image.network(
                    carPhotoUrl,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  )
                : Container(),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Переходим на экран добавления фотографии
                // Замените AddPhotoScreen() на соответствующий виджет
              },
              child: const Text('Добавить фотографию'),
            ),
            ElevatedButton(
              onPressed: () {
                // Переходим на экран редактирования информации об автомобиле
                // Замените EditCarInfoScreen() на соответствующий виджет
              },
              child: const Text('Редактировать информацию'),
            ),
          ],
        ),
      ),
    );
  }
}
