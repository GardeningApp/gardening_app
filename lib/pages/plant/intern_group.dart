import 'dart:math';
import 'dart:ui';
import 'package:flutter/rendering.dart';

import 'plante.dart';

import 'package:flutter/material.dart';

class PhotoPlant {
  String img;
  String id;
  String name;

  PhotoPlant({this.id, this.img, this.name});
}

class InternGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: Scaffold(
        PagePlant(
          plant: Plant(
              plantName: "My Aloe",
              plantCategory: "Aloe Verra",
              chronology: [Chronologie_element(actionName: "Mise en pot", date: "12/11/2020"),
                Chronologie_element(actionName: "Arrosage", date: "15/11/2020"),
                Chronologie_element(actionName: "Arrosage", date: "18/11/2020"),
                Chronologie_element(actionName: "Élaguage", date: "19/11/2020"),
                Chronologie_element(actionName: "Ajout d'Engrais", date: "19/11/2020"),
                Chronologie_element(actionName: "Arrosage", date: "20/11/2020")],
              image: "assets/images/aloe.jpg",
              wiki:
              """ L'Aloe vera est une espèce d'aloès d'origine incertaine mais cultivée de longue date en région méditerranéenne, Afrique du Nord, aux îles Canaries et au Cap-Vert.
                Cultiver l'aloe vera est relativement facile. La plante d'aloe vera supporte mal l'humidité, le substrat doit être parfaitement drainant. Privilégiez un mélange de sable et terreau, disposez des billes d'argile au fond du pot. On la conserve en intérieur entre 18 à 20°, ou dehors en période estivale.
                """.trim(),
              comments: [Comment(description: "fffff")]

          ),
        ),
        body: GridView.count(
            crossAxisCount: 2
            children: List.generate(100, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }),
        ),

      ),
    );
  }

}




