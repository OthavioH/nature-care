import 'package:flutter/material.dart';
import 'package:nature_care/src/models/plant.dart';

class PlantItem extends StatelessWidget {
  final Plant plant;
  const PlantItem({required this.plant, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {},
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
                      plant.getPlantIcon(),
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
                    plant.name,
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
