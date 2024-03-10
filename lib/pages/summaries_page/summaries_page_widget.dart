import '/components/menu_coponent/menu_coponent_widget.dart';
import '/components/summary/summaries_component/summaries_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'summaries_page_model.dart';
export 'summaries_page_model.dart';

class SummariesPageWidget extends StatefulWidget {
  const SummariesPageWidget({
    super.key,
    this.email,
    this.name,
    required this.id,
    required this.studentId,
  });

  final String? email;
  final String? name;
  final String? id;
  final String? studentId;

  @override
  State<SummariesPageWidget> createState() => _SummariesPageWidgetState();
}

class _SummariesPageWidgetState extends State<SummariesPageWidget> {
  late SummariesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SummariesPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        drawer: SizedBox(
          width: 250.0,
          child: Drawer(
            elevation: 1.0,
            child: wrapWithModel(
              model: _model.menuCoponentModel,
              updateCallback: () => setState(() {}),
              child: MenuCoponentWidget(
                id: widget.id!,
                name: widget.name!,
                email: widget.email!,
                studentId: widget.studentId!,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).success,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).alternate),
          automaticallyImplyLeading: true,
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 50.0, 0.0),
              child: Text(
                'Pequeninos App',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.summariesComponentModel,
            updateCallback: () => setState(() {}),
            child: const SummariesComponentWidget(),
          ),
        ),
      ),
    );
  }
}