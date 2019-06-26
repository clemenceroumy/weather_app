import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Week extends StatefulWidget {
  @override
  _WeekState createState() => _WeekState();
}

class _WeekState extends State<Week> {
  List<Expanded> generateColumn() {
    List<Expanded> listColumn = new List<Expanded>();

    for (var i = 1; i < 7; i++) {
      listColumn.add(Expanded(
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(Icons.cloud_queue),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    'Thursday',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    '20°C / 33°C',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return listColumn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        color: Colors.white,
      ),
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: this.generateColumn(),
      ),
    );
  }
}
