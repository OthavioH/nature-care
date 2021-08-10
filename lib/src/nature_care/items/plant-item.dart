import 'package:flutter/material.dart';
import 'package:nature_care/src/models/plant.dart';
import 'package:nature_care/src/nature_care/controllers/plants_controller.dart';

class PlantItem extends StatefulWidget {
  final Plant plant;
  PlantItem({required this.plant, Key? key}) : super(key: key);

  @override
  _PlantItemState createState() => _PlantItemState();
}

class _PlantItemState extends State<PlantItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          PlantsController.chooseNewPlant(widget.plant);
        });
      },
      child: Container(
        width: 80,
        height: 40,
        child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset(
                      widget.plant.getPlantIcon(),
                      fit: BoxFit.contain,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Text(
                    widget.plant.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
