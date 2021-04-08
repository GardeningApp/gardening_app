import 'dart:math';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:gardening/pages/plant/page_plant.dart';

import 'plante.dart';

import 'package:flutter/material.dart';

class PhotoPlant {
  String img;
  String id;
  String name;

  PhotoPlant({this.id, this.img, this.name});
}

class InternGroup extends StatelessWidget {
  List<Plant> plants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: plants.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            var p = plants[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PagePlant(
                    plant: p,
                  );
                }));
              },
              child: Card(
                elevation: 6,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                    SizedBox(
                      height: 130,
                      child: Image.asset(
                        p.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  Expanded(
                    child: Center(
                      child: Text(
                          p.plantName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            );
          }),
      //Rajouter des Widgets Flutter pour avoir les images et le nom, que la zone soit cliquable
    );
  }

  InternGroup(this.plants);
}

class Affichage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PagePlant(
        plant: Plant(
            plantName: "My Aloe",
            plantCategory: "Aloe Verra",
            chronology: [
              Chronologie_element(
                  actionName: "Mise en pot", date: "12/11/2020"),
              Chronologie_element(actionName: "Arrosage", date: "15/11/2020"),
              Chronologie_element(actionName: "Arrosage", date: "18/11/2020"),
              Chronologie_element(actionName: "Élaguage", date: "19/11/2020"),
              Chronologie_element(
                  actionName: "Ajout d'Engrais", date: "19/11/2020"),
              Chronologie_element(actionName: "Arrosage", date: "20/11/2020")
            ],
            image: "assets/images/aloe.jpg",
            wiki:
                """ L'Aloe vera est une espèce d'aloès d'origine incertaine mais cultivée de longue date en région méditerranéenne, Afrique du Nord, aux îles Canaries et au Cap-Vert.
                Cultiver l'aloe vera est relativement facile. La plante d'aloe vera supporte mal l'humidité, le substrat doit être parfaitement drainant. Privilégiez un mélange de sable et terreau, disposez des billes d'argile au fond du pot. On la conserve en intérieur entre 18 à 20°, ou dehors en période estivale.
                """
                    .trim(),
            comments: [Comment(description: "fffff")]),
      ),
    );
  }
}
