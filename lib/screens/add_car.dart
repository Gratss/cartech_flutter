import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCarInfoScreen extends StatefulWidget {
  const AddCarInfoScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddCarInfoScreenState createState() => _AddCarInfoScreenState();
}

class _AddCarInfoScreenState extends State<AddCarInfoScreen> {
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _vinController = TextEditingController();

  // Объект для работы с базой данных Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить информацию об автомобиле'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _brandController,
              decoration: const InputDecoration(labelText: 'Марка'),
            ),
            TextFormField(
              controller: _modelController,
              decoration: const InputDecoration(labelText: 'Модель'),
            ),
            TextFormField(
              controller: _yearController,
              decoration: const InputDecoration(labelText: 'Год выпуска'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _vinController,
              decoration: const InputDecoration(labelText: 'Номер VIN'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                // Получаем введенные данные
                String brand = _brandController.text;
                String model = _modelController.text;
                int? year = int.tryParse(_yearController.text);
                String vin = _vinController.text;

                // Проверяем, чтобы все поля были заполнены
                if (brand.isNotEmpty &&
                    model.isNotEmpty &&
                    year != null &&
                    vin.isNotEmpty) {
                  // Создаем новый документ в коллекции "cars" с данными об автомобиле
                  await _firestore.collection('cars').add({
                    'brand': brand,
                    'model': model,
                    'year': year,
                    'vin': vin,
                  });

                  // После сохранения данных в базе данных можно вернуться на предыдущий экран

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                } else {
                  // Если не все поля заполнены, выводим сообщение об ошибке
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Ошибка'),
                      content: const Text('Пожалуйста, заполните все поля'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
