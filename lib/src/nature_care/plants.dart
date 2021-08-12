import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nature_care/src/models/plant.dart';
import 'package:nature_care/src/nature_care/controllers/plants_controller.dart';
import 'package:nature_care/src/nature_care/expandable_fab.dart';
import 'package:nature_care/src/models/screen_type.dart';
import 'package:nature_care/src/nature_care/items/plant-item.dart';

class Plants extends StatefulWidget {
  const Plants({Key? key}) : super(key: key);

  @override
  _PlantsState createState() => _PlantsState();
}

List<Plant> list = PlantsController.plantsList;

class _PlantsState extends State<Plants> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () => print('criar planta'),
            icon: const Icon(Icons.local_florist),
          ),
          ActionButton(
            onPressed: () => list = PlantsController.plantsList,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? 20.0 : 0),
        color: Theme.of(context).accentColor,
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    height: 80,
                    child: Center(
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Search",
                              fillColor: Colors.white.withOpacity(0.5),
                              filled: true,
                              counterStyle: TextStyle(color: Colors.white),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(20 * 0.7),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 8, left: 8, bottom: 50),
                    width: double.infinity,
                    height: screenHeight,
                    child: GridView.count(
                      crossAxisCount: 2,
                      scrollDirection: Axis.horizontal,
                      childAspectRatio: 16 / 9,
                      children: getPlantsWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getPlantsWidget() {
    return list.map((plant) {
      return PlantItem(plant: plant);
    }).toList();
  }

  int getGridItemsCount(ScreenType screenType) {
    if (screenType == ScreenType.tablet) {
      return 3;
    } else if (screenType == ScreenType.mobile) {
      return 2;
    } else {
      return 4;
    }
  }

  ScreenType getScreenType(screenSize) {
    if (screenSize >= 600 && screenSize <= 1000) {
      return ScreenType.tablet;
    } else if (screenSize < 600) {
      return ScreenType.mobile;
    } else {
      return ScreenType.desktop;
    }
  }
}
