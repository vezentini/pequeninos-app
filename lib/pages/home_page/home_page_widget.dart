import '/components/others/menu_coponent/menu_coponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    required this.id,
    required this.name,
    required this.email,
    required this.studentsId,
    required this.profile,
  });

  final String? id;
  final String? name;
  final String? email;
  final List<String>? studentsId;
  final String? profile;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
        backgroundColor: FlutterFlowTheme.of(context).info,
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
                studentsId: widget.studentsId!,
                profile: widget.profile,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).success,
          iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).info),
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
      ),
    );
  }
}
