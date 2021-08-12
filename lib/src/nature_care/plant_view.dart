import 'package:flutter/material.dart';
import 'package:nature_care/src/models/plant.dart';

class PlantView extends StatefulWidget {
  final Plant plant;
  const PlantView({required this.plant, Key? key}) : super(key: key);

  @override
  _PlantState createState() => _PlantState();
}

class _PlantState extends State<PlantView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Plant plant = widget.plant;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).accentColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.local_drink,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        color: Theme.of(context).accentColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(plant.getPlantIcon()),
            ),
            Text(
              plant.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 2,
                  color: Colors.white,
                ),
                _getPlantHealthIcon(plant.getHealth()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getPlantHealthIcon(String healthStatus) {
    if (healthStatus == 'healthy') {
      return Container(
        width: 100,
        height: 2,
        color: Colors.greenAccent,
      );
    } else if (healthStatus == 'intermediary') {
      return Container(
        width: 50,
        height: 2,
        color: Colors.yellow,
      );
    } else {
      return Container(
        width: 10,
        height: 2,
        color: Colors.red,
      );
    }
  }
}
