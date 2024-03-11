import '/components/others/menu_coponent/menu_coponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    String? email,
    String? name,
    String? id,
    String? studentId,
  })  : this.email = email ?? 'vezentini@hotmail.com',
        this.name = name ?? 'Gustavo Vezentini',
        this.id = id ?? 'ee72fd2c-2354-4188-9b2a-fd0091b41ca4',
        this.studentId = studentId ?? '6d810426-d340-4471-9810-7a4383d06767';

  final String email;
  final String name;
  final String id;
  final String studentId;

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
        drawer: Container(
          width: 250.0,
          child: Drawer(
            elevation: 1.0,
            child: wrapWithModel(
              model: _model.menuCoponentModel,
              updateCallback: () => setState(() {}),
              child: MenuCoponentWidget(
                id: widget.id,
                name: widget.name,
                email: widget.email,
                studentId: widget.studentId,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).success,
          iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).info),
          automaticallyImplyLeading: true,
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 50.0, 0.0),
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
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
      ),
    );
  }
}
