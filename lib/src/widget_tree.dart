import 'package:flutter/material.dart';
import 'package:nature_care/src/nature_care/controllers/plants_controller.dart';
import 'package:nature_care/src/nature_care/plant_view.dart';
import 'package:nature_care/src/nature_care/plants.dart';
import 'package:nature_care/src/responsive_layout.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: ResponsiveLayout(
        mobile: Plants(),
        tablet: Row(
          children: [
            Expanded(flex: _size.width < 800 ? 6 : 7, child: Plants())
          ],
        ),
        tabletTurned: Row(
          children: [
            Expanded(
              flex: _size.width < 900 ? 5 : 4,
              child: Plants(),
            ),
            Expanded(
              flex: _size.width < 900 ? 5 : 6,
              child: PlantView(
                plant: PlantsController.chosenPlant.value,
              ),
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 3 : 6,
              child: Plants(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 7 : 10,
              child: PlantView(
                plant: PlantsController.chosenPlant.value,
              ),
            ),
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: Plants(),
            ),
          ],
        ),
      ),
    );
  }
}
