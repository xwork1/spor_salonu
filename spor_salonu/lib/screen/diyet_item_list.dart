import 'package:flutter/material.dart';
import 'package:spor_salonu/data/diyet.dart';
import 'package:spor_salonu/screen/diyet_detail_list.dart';

class DiyetList extends StatefulWidget {
  const DiyetList({Key? key}) : super(key: key);

  @override
  State<DiyetList> createState() => _DiyetListState();
}

class _DiyetListState extends State<DiyetList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 8, left: 32, right: 16),
            child: Text(
              'Gün içi öğünler',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 24,
                ),
                for (var i = 0; i < meals.length; i++)
                  _MealCard(meal: meals[i]),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class _MealCard extends StatelessWidget {
  const _MealCard({Key? key, required this.meal}) : super(key: key);
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MealDetailScreen(meal: meal),
            ),
          );
        },
        child: Material(
          shadowColor: Colors.blueGrey,
          borderRadius: const BorderRadius.all(Radius.elliptical(50, 50)),
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  child: Image.asset(
                    meal.imagePath,
                    width: 150,
                    fit: BoxFit.fill,
                  )),
              Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          meal.mealTime,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.blueGrey),
                        ),
                        Text(meal.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.black)),
                        Text(
                          "${meal.kiloCaloriesBurnt} kcal",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.black12,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text("${meal.timeTaken} min"),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
