import 'package:nature_care/src/models/plant.dart';

void main(List<String> args) {
  final plant = Plant(
      name: 'Samambaia',
      healthStatus: Health.healthy,
      lastCareDate: DateTime.now());

  print(plant);
}
