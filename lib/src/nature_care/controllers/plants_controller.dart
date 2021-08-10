import 'package:flutter/material.dart';
import 'package:nature_care/src/models/plant.dart';

class PlantsController {
  static List<Plant> plantsList = List.generate(
      20,
      (index) => Plant(
          name: 'Samambaia ${index + 1}',
          healthStatus: Health.healthy,
          lastCareDate: DateTime.now()));
  static late ValueNotifier<Plant> chosenPlant =
      ValueNotifier<Plant>(plantsList.first);

  static chooseNewPlant(Plant plant) {
    PlantsController.chosenPlant.value = plant;
  }
}
