
import 'package:flutter/material.dart';
import 'package:gardening/pages/plant/page_plant.dart';
import 'package:gardening/pages/home_no_connection/home_no_connection.dart';
import 'package:gardening/pages/plant/plante.dart';
import 'package:gardening/pages/plant/intern_group.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PagePlant (

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


    );
  }
}

