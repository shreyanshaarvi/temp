// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatefulWidget {
  LineChartWidget({
    Key? key,
    this.width,
    this.height,
    this.title,
    required this.salesX,
    required this.month,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? title;
  final List<double> salesX;
  final List<String> month;

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          title: AxisTitle(text: 'Month'),
          majorGridLines: MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.betweenTicks, // changed labelPlacement
          // list of month labels
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Sales'),
          majorGridLines: MajorGridLines(width: 0),
        ),
        series: <ChartSeries<_ChartData, String>>[
          LineSeries(
            dataSource: _generateLineSeriesData(),
            xValueMapper: (dataPoint, index) => dataPoint.x,
            yValueMapper: (dataPoint, index) => dataPoint.y,
            enableTooltip: true,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          )
        ],
        title: ChartTitle(
          text: widget.title ?? 'Sales by Month',
          alignment: ChartAlignment.center,
        ),
      ),
    );
  }

  List<_ChartData> _generateLineSeriesData() {
    List<_ChartData> data = [];
    for (int i = 0; i < widget.salesX.length; i++) {
      data.add(_ChartData(x: widget.month[i], y: widget.salesX[i]));
    }
    return data;
  }
}

class _ChartData {
  final String x;
  final double y;

  _ChartData({required this.x, required this.y});
}
