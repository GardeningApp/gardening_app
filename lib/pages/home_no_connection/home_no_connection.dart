import 'package:flutter/material.dart';

class HomeNotConnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(

            ),
          ),
        ),
      ),
    );


  }

}

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 26,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 60,
                  ),
                ],
              )
            ],
          ),
        ),

      ),
    );

  }

}

class Profil2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 26,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 60,
                  ),
                ],
              )
            ],
          ),
        ),

      ),
    );

  }

}