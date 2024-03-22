import '/backend/api_requests/api_calls.dart';
import '/components/summary_upsert/summary_upsert_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'summaries_component_model.dart';
export 'summaries_component_model.dart';

class SummariesComponentWidget extends StatefulWidget {
  const SummariesComponentWidget({super.key});

  @override
  State<SummariesComponentWidget> createState() =>
      _SummariesComponentWidgetState();
}

class _SummariesComponentWidgetState extends State<SummariesComponentWidget>
    with TickerProviderStateMixin {
  late SummariesComponentModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SummariesComponentModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
                iconColor: FlutterFlowTheme.of(context).success,
                weekFormat: true,
                weekStartsMonday: true,
                initialDate: getCurrentTimestamp,
                onChange: (DateTimeRange? newSelectedDate) async {
                  if (_model.calendarSelectedDay == newSelectedDate) {
                    return;
                  }
                  _model.calendarSelectedDay = newSelectedDate;
                  logFirebaseEvent('SUMMARIES_COMPONENT_Calendar_gafa25u3_ON');
                  _model.updatePage(() {
                    FFAppState().date = _model.calendarSelectedDay?.start;
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
                          lineHeight: 0.8,
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
                locale: FFLocalizations.of(context).languageCode,
              ),
              FutureBuilder<ApiCallResponse>(
                future: FindSummariesCall.call(
                  accountId: FFAppState().id,
                  profile: FFAppState().profile,
                  date: dateTimeFormat(
                    'dd/MM/yyyy',
                    _model.calendarSelectedDay?.start,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final listViewFindSummariesResponse = snapshot.data!;
                  return Builder(
                    builder: (context) {
                      final summaries = FindSummariesCall.summaries(
                            listViewFindSummariesResponse.jsonBody,
                          )?.toList() ??
                          [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: summaries.length,
                        itemBuilder: (context, summariesIndex) {
                          final summariesItem = summaries[summariesIndex];
                          return Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SUMMARIES_COMPONENT_COMP_userList_ON_TAP');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: SummaryUpsertWidget(
                                          id: getJsonField(
                                            summariesItem,
                                            r'''$.id''',
                                          ).toString(),
                                          studentId: getJsonField(
                                            summariesItem,
                                            r'''$.studentId''',
                                          ).toString(),
                                          date: getJsonField(
                                            summariesItem,
                                            r'''$.date''',
                                          ).toString(),
                                          mornningSnack: getJsonField(
                                            summariesItem,
                                            r'''$.mornningSnack''',
                                          ).toString(),
                                          mornningSnackConsumn: getJsonField(
                                            summariesItem,
                                            r'''$.mornningSnackConsumn''',
                                          ).toString(),
                                          luncheon: getJsonField(
                                            summariesItem,
                                            r'''$.luncheon''',
                                          ).toString(),
                                          afternoonSnack: getJsonField(
                                            summariesItem,
                                            r'''$.afternoonSnack''',
                                          ).toString(),
                                          preDinner: getJsonField(
                                            summariesItem,
                                            r'''$.preDinner''',
                                          ).toString(),
                                          afternoonSnackConsumn: getJsonField(
                                            summariesItem,
                                            r'''$.afternoonSnackConsumn''',
                                          ).toString(),
                                          preDinnerConsumn: getJsonField(
                                            summariesItem,
                                            r'''$.preDinnerConsumn''',
                                          ).toString(),
                                          luncheonConsumn: getJsonField(
                                            summariesItem,
                                            r'''$.luncheonConsumn''',
                                          ).toString(),
                                          description: getJsonField(
                                            summariesItem,
                                            r'''$.description''',
                                          ).toString(),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: Color(0xFFE0E3E7),
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    summariesItem,
                                                    r'''$.studentId''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            const Color(0xFF14181B),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          elevation: 1.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_right_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        if (FFAppState().profile == 'ADMIN')
          Align(
            alignment: const AlignmentDirectional(1.0, 1.0),
            child: Builder(
              builder: (context) => Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 100.0),
                child: FloatingActionButton(
                  onPressed: () async {
                    logFirebaseEvent(
                        'SUMMARIES_COMPONENT_AddStudentButton_ON_');
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: SummaryUpsertWidget(
                            date: dateTimeFormat(
                              'dd/MM/yyyy',
                              _model.calendarSelectedDay!.start,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
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
