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
    return new charts.LineChart(
      [
        ...lines.map(
          (lins) => charts.Series(
            id: lins["id"],
            colorFn: lins["color"],
            areaColorFn: lins["aColor"],
            measureFn: lins["mfn"],
            domainFn: lins["dfn"],
            data: [
              ...lins["data"].map(
                (points) => LinearSales(
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
      {"x": 0, "y": 0},
      {"x": 2, "y": 5},
      {"x": 3, "y": 10},
      {"x": 4, "y": 0}
    ];

    return <Map<String, dynamic>>[
      {
        "id": 'Sales',
        "color": (_, __) => charts.MaterialPalette.blue.shadeDefault,
        "acolor"
            "dfn": (LinearSales sales, _) => sales.year,
        "mfn": (LinearSales sales, _) => sales.sales,
        "data": data,
      }
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
