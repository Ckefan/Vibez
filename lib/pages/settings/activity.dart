import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// 柱状图
class Barsales {
  String day;
  int sale;
  Barsales(this.day, this.sale);
}

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chart'),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: null,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              height: 300,
              child: getBar(),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Daily Average',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(246, 246, 246, 1),
                ),
              ),
            ),
            Container(
              child: Text(
                '1 hr 10 min',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromRGBO(41, 169, 224, 1),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bold',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getBar() {
    List<Barsales> dataBar = [
      new Barsales("Mon", 20),
      new Barsales("Tue", 50),
      new Barsales("Wed", 20),
      new Barsales("Thr", 80),
      new Barsales("Fri", 120),
      new Barsales("Sat", 30),
      new Barsales("Sun", 30),
    ];

    final seriesBar = [
      charts.Series(
        data: dataBar,
        domainFn: (Barsales sales, _) => sales.day,
        measureFn: (Barsales sales, _) => sales.sale,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        labelAccessorFn: (Barsales sales, _) => '\$${sales.day.toString()}',
        id: "Sales",
      )
    ];
    final ticks = new charts.StaticOrdinalTickProviderSpec(
      dataBar
          .map(
            (e) => new charts.TickSpec(
              e.day,
              label: e.day,
              style: new charts.TextStyleSpec(
                //可对x轴设置颜色等
                color: new charts.Color(r: 184, g: 184, b: 184),
              ),
            ),
          )
          .toList(),
    );

    return charts.BarChart(
      seriesBar,
      animate: true,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      primaryMeasureAxis: new charts.NumericAxisSpec(
        renderSpec: new charts.NoneRenderSpec(), //去掉y轴
      ),
      domainAxis: new charts.OrdinalAxisSpec(
        tickProviderSpec: ticks,
      ),
      defaultRenderer: new charts.BarRendererConfig(
        cornerStrategy: const charts.ConstCornerStrategy(10), //圆角
      ),
    );
  }
}
