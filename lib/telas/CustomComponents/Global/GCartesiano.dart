/// Line chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GCartesiano extends StatelessWidget {
  final List<Map<String, dynamic>> lines;
  final bool animate, filled, showPoints;

  GCartesiano(this.lines,
      {this.animate, this.filled = true, this.showPoints = false});

  /// Creates a [LineChart] with sample data and no transition.
  factory GCartesiano.withSampleData() {
    return GCartesiano(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    /*
      lines = [
        {"id": a,
        "mfn": a,
        "dfn": a,
        color: a,
        acolor: a,
        "data: [{}]"}
      ]
    */
    return charts.LineChart(
      <charts.Series<dynamic, num>>[
        ...lines.map(
          (lins) => charts.Series(
            id: lins["id"],
            colorFn: (_, __) => lins["color"],
            areaColorFn: (_, __) => lins["aColor"],
            measureFn: (s, __) => lins["mfn"],
            domainFn: (s, __) => lins["dfn"],
            data: [
              ...lins["data"].map(
                (Map<String, int> points) => LinearSale(
                  points["x"],
                  points["y"],
                ),
              ),
            ],
          ),
        ),
      ],
      animate: animate,
      defaultRenderer: new charts.LineRendererConfig(
        includePoints: showPoints,
        includeArea: filled,
        stacked: filled,
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<Map<String, dynamic>> _createSampleData() {
    final data = [
      {"x": 0.0, "y": 0.0},
      {"x": 2.0, "y": 5.0},
      {"x": 3.0, "y": 10.0},
      {"x": 4.0, "y": 0.0},
    ];

    return <Map<String, dynamic>>[
      {
        "id": 'Sales',
        "color": charts.MaterialPalette.blue.shadeDefault,
        "aColor": Colors.red,
        "dfn": LinearSale(0, 1).year,
        "mfn": LinearSale(0, 1).sales,
        "data": data,
      }
    ];
  }
}

/// Sample linear data type.
class LinearSale {
  final int year;
  final int sales;

  LinearSale(this.year, this.sales);
}
