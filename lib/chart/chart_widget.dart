import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'chart_model.dart';
export 'chart_model.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  late ChartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChartModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 387.0,
                    height: 400.0,
                    child: custom_widgets.LineChartWidget(
                      width: 387.0,
                      height: 400.0,
                      title: 'Hi',
                      salesX: List.generate(random_data.randomInteger(0, 0),
                          (index) => random_data.randomDouble(0.0, 1.0)),
                      month: List.generate(random_data.randomInteger(0, 0),
                          (index) => random_data.randomName(true, false)),
                    ),
                  ),
                  SizedBox(
                    width: 370.0,
                    height: 230.0,
                    child: FlutterFlowLineChart(
                      data: [
                        FFLineChartData(
                          xData: List.generate(
                              random_data.randomInteger(0, 0),
                              (index) => random_data.randomString(
                                    0,
                                    0,
                                    true,
                                    false,
                                    false,
                                  )),
                          yData: List.generate(random_data.randomInteger(0, 0),
                                  (index) => random_data.randomInteger(0, 10))
                              .map((e) => e.toString())
                              .toList(),
                          settings: LineChartBarData(
                            color: FlutterFlowTheme.of(context).primary,
                            barWidth: 2.0,
                            isCurved: true,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: FlutterFlowTheme.of(context).accent1,
                            ),
                          ),
                        )
                      ],
                      chartStylingInfo: ChartStylingInfo(
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        showBorder: false,
                      ),
                      axisBounds: const AxisBounds(),
                      xAxisLabelInfo: const AxisLabelInfo(
                        showLabels: true,
                        labelInterval: 10.0,
                      ),
                      yAxisLabelInfo: const AxisLabelInfo(
                        showLabels: true,
                        labelInterval: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
