import '/components/summary/summary_upsert/summary_upsert_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'summaries_component_model.dart';
export 'summaries_component_model.dart';

class SummariesComponentWidget extends StatefulWidget {
  const SummariesComponentWidget({super.key});

  @override
  State<SummariesComponentWidget> createState() =>
      _SummariesComponentWidgetState();
}

class _SummariesComponentWidgetState extends State<SummariesComponentWidget> {
  late SummariesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SummariesComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).info,
            border: Border.all(
              color: FlutterFlowTheme.of(context).success,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).success,
                iconColor: FlutterFlowTheme.of(context).info,
                weekFormat: true,
                weekStartsMonday: true,
                initialDate: FFAppState().summaryDate,
                onChange: (DateTimeRange? newSelectedDate) async {
                  if (_model.calendarSelectedDay == newSelectedDate) {
                    return;
                  }
                  _model.calendarSelectedDay = newSelectedDate;
                  setState(() {
                    FFAppState().summaryDate =
                        DateTime.fromMillisecondsSinceEpoch(1710180840000);
                  });
                  setState(() {
                    FFAppState().summaryDate =
                        _model.calendarSelectedDay?.start;
                  });
                  setState(() {});
                },
                titleStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).success,
                    ),
                dayOfWeekStyle:
                    FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).success,
                        ),
                dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).success,
                    ),
                selectedDateStyle: FlutterFlowTheme.of(context).titleSmall,
                inactiveDateStyle:
                    FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).success,
                        ),
              ),
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional(1.0, 1.0),
          child: Builder(
            builder: (context) => Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
              child: FloatingActionButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: SummaryUpsertWidget(
                          studentId: '',
                          date: DateTime.fromMicrosecondsSinceEpoch(
                              random_data.randomDate().microsecondsSinceEpoch),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                backgroundColor: FlutterFlowTheme.of(context).success,
                elevation: 8.0,
                child: Icon(
                  Icons.add,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
