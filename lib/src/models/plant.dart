class Plant {
  final String name;
  final Health healthStatus;
  DateTime lastCareDate;
  PlantHeight height = PlantHeight.big;

  Plant(
      {required this.name,
      required this.healthStatus,
      required this.lastCareDate});

  getPlantIcon() {
    if (height == PlantHeight.small)
      return 'assets/small_plant.png';
    else if (height == PlantHeight.medium)
      return 'assets/medium_plant.png';
    else
      return 'assets/big_plant.png';
  }
}

enum Health { healthy, intermediary, unhealthy }

enum PlantHeight { big, medium, small }
