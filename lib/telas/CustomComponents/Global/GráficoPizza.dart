import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class GraficoPizza extends StatelessWidget {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  final List<Map<String, dynamic>> data;

  GraficoPizza({
    this.data = const [
      {
        "rankKey": null,
        "fatias": [
          {"n": 0.0, "cor": Colors.white, "chave": null}
        ],
      },
    ],
  });

  Widget build(BuildContext context) {
    /* [
      {rankkey: rankKey, 
      fatias: [
        {n:double, "cor": cor, "chave": chave}, 
        {n:double, "cor": cor, "chave": chave}
        ],
      },
    ] */

    return AnimatedCircularChart(
      key: _chartKey,
      size: const Size(300.0, 300.0),
      initialChartData: <CircularStackEntry>[
        ...data.map(
          (cse) => CircularStackEntry(
            [
              ...cse["fatias"].map(
                (cseg) => CircularSegmentEntry(cseg["n"], cseg["cor"],
                    rankKey: cseg["chave"]),
              ),
            ],
            rankKey: cse["rankkey"],
          ),
        ),
      ],
      chartType: CircularChartType.Pie,
    );
  }
}
