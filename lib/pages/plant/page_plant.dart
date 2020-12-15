import 'dart:math';
import 'dart:ui';
import 'package:flutter/rendering.dart';

import 'plante.dart';

import 'package:flutter/material.dart';



Color textColor = Colors.white;
Color primaryColor = Colors.green;
Color secondaryColor = Colors.yellow;

class PagePlant extends StatefulWidget {
  const PagePlant({Key key, this.plant}) : super(key: key);

  @override
  _PagePlantState createState() => _PagePlantState();
  final Plant plant;
}

class _PagePlantState extends State<PagePlant> {

  double _minPercent = 0.1;
  double _maxPercent = 1;
  double _scrollEffectPercent = 0.1;

  double _headerSizeToBlur = 400;
  double _headerSize = 500;

  void calculateScrollEffectPercent(double scroll) {
    setState(() {
      var newPercent = 0.0;
      if(scroll == 0){
        newPercent = 0;
      } else {
        newPercent = scroll / _headerSizeToBlur;
      }
      _scrollEffectPercent = max(_minPercent, newPercent);
      _scrollEffectPercent = min(_maxPercent, _scrollEffectPercent);
    });
  }

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener((){
      calculateScrollEffectPercent(_scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.settings),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _background(context),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(_scrollEffectPercent)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.9]
              )
            ),
            //color: Colors.black.withOpacity(0.3),
          ),
          //blur effect
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0 * _scrollEffectPercent + 0.01,
              sigmaY: 3.0 * _scrollEffectPercent + 0.01,
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  SizedBox(height: _headerSize),
                  _title(context),
                  SizedBox(height: 40),
                  _quickActions(context),
                  SizedBox(height: 30),
                  _wiki(context),
                  SizedBox(height: 30),
                  _chrolology(context),
                  SizedBox(height: 300),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _background(BuildContext context) {
    return Image.asset(
      this.widget.plant.image,
      fit: BoxFit.cover,
    );
  }

  Widget _title(BuildContext context) {
    return _PlantTitle(
      plantCategory: this.widget.plant.plantCategory,
      plantName: this.widget.plant.plantName,
    );
  }

  Widget _quickActions(BuildContext context) {
    return _QuickActions();
  }

  Widget _wiki(BuildContext context) {
    return _Wiki(wiki: this.widget.plant.wiki);
  }

  Widget _chrolology(BuildContext context) {
    return _Chronology(
      plantChronology : this.widget.plant.chronology,
    );
  }
}

class _PlantTitle extends StatelessWidget {
  final String plantName;
  final String plantCategory;

  _PlantTitle({this.plantName, this.plantCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            this.plantName,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: textColor,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            this.plantCategory,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  Widget _button(String text) {
    return RaisedButton(
      color: primaryColor,
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.spa,
              color: textColor,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _button("Arroser"),
        SizedBox(
          width: 16,
        ),
        _button("Elaguer"),
      ],
    );
  }
}

class _Wiki extends StatelessWidget {
  final String wiki;

  const _Wiki({
    @required this.wiki,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Wiki",
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            wiki,
            style: TextStyle(
              color: textColor.withOpacity(0.9),
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic
            ),
          )
        ],
      ),
    );
  }
}

class PlantComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Comment comment = Comment();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(comment.description),
      ),
    );
  }
}


enum _ChronologyStepType { first, middle, end }

class _Chronology extends StatelessWidget {
  double linesHeight = 3;
  final List<Chronologie_element> plantChronology;

   _Chronology({Key key, this.plantChronology}) : super(key: key);

  Widget _circle(IconData icon) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: textColor,
        ),
        padding: EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(icon, size: 18, color: Colors.white,),
          ),
        ),
      ),
    );
  }

  Widget _chronologyStep({String name, String date, _ChronologyStepType stepType}) {
    bool displayLeftLine = (stepType == _ChronologyStepType.end || stepType == _ChronologyStepType.middle);
    Widget lineLeft = Flexible(
      flex: 1,
      child: Container(
        color: displayLeftLine ? textColor : Colors.transparent,
        height: linesHeight,
      ),
    );

    bool displayRightLine = (stepType == _ChronologyStepType.first || stepType == _ChronologyStepType.middle);
    Widget lineRight = Flexible(
      flex: 1,
      child: Container(
        color: displayRightLine ? textColor : Colors.transparent,
        height: linesHeight,
      ),
    );

    return Container(
      height: 160,
      width: 150,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Card(
                      color: primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          name,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [lineLeft, lineRight],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    date,
                    style: TextStyle(color: textColor.withOpacity(0.8), fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          _circle(Icons.cloud),
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: this.plantChronology.asMap().entries.map((entry) {
          _ChronologyStepType stepType;
          int key = entry.key;
          var value = entry.value;
          if (key == 0) {
            stepType = _ChronologyStepType.first;

          } else if (key == plantChronology.length -1){
            stepType = _ChronologyStepType.end;
          } else {
            stepType = _ChronologyStepType.middle;
          }
          return _chronologyStep(
            name: value.actionName,
            date: value.date,
            stepType: stepType
          );

        }).toList()
      ),
    );
  }
}
