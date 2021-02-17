import 'package:flutter/material.dart';
import 'package:substation_app/constants/constant.dart';
import 'package:substation_app/widgets/result_card.dart';

class Worker extends StatefulWidget {
  Worker({this.result660, this.result1980, this.result, this.date});
  final String result660;
  final String result1980;
  final String result;
  final String date;

  @override
  _WorkerState createState() => _WorkerState();
}

class _WorkerState extends State<Worker> {
  // List<String> panels = [
  //   String(names: 'N1'),
  //   String(names: 'N2 Active'),
  //   String(names: 'N2 Reactive'),
  //   String(names: 'N3 Active'),
  //   String(names: 'N3 Reactive'),
  //   String(names: 'N6'),
  //   String(names: 'N7'),
  //   String(names: 'N9'),
  //   String(names: 'N10'),
  //   String(names: 'N1'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232228),
      appBar: AppBar(
        backgroundColor: Color(0xFF070707),
        title: Text('Readings'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Hero(
                    tag: 'wanyama',
                    child: CircleAvatar(
                      radius: 120.0,
                      backgroundImage: AssetImage("assets/images/wycliffe.jpg"),
                    ),
                  ),
                ),
              ),
              Text(
                //RESULT FOR 1980 CALCULATION CODE
                widget.result,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Color(0xFF20BFA9),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              ResultCard(
                date: 'Time Of The Day',
                result: 'Data Results',
                panel: 'Panel No',
                reading: kReadingStyle,
              ),
              ResultCard(
                date: widget.date,
                result: widget.result660 == null
                    ? 'Data pending'
                    : widget.result660,
                panel: 'N1',
                reading: kDataStyle,
              ),
              ResultCard(
                date: widget.date,
                result: widget.result660,
                panel: 'N2',
                reading: kDataStyle,
              ),
              ResultCard(
                date: widget.date,
                result: widget.result660,
                panel: 'N3',
                reading: kDataStyle,
              ),
              ResultCard(
                date: widget.date,
                result: widget.result,
                panel: 'N6',
                reading: kDataStyle,
              ),
              ResultCard(
                date: widget.date,
                result: widget.result1980,
                panel: 'N7',
                reading: kDataStyle,
              ),
              ResultCard(
                date: widget.date,
                result: widget.result,
                panel: 'N9',
                reading: kDataStyle,
              ),
              ResultCard(
                date: widget.date,
                result: widget.result,
                panel: 'N10',
                reading: kDataStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
