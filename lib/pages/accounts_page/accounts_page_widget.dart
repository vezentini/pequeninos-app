import '/components/accounts/accounts_component/accounts_component_widget.dart';
import '/components/others/menu_coponent/menu_coponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'accounts_page_model.dart';
export 'accounts_page_model.dart';

class AccountsPageWidget extends StatefulWidget {
  const AccountsPageWidget({
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
  State<AccountsPageWidget> createState() => _AccountsPageWidgetState();
}

class _AccountsPageWidgetState extends State<AccountsPageWidget> {
  late AccountsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountsPageModel());
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
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.accountsComponentModel,
            updateCallback: () => setState(() {}),
            child: AccountsComponentWidget(),
          ),
        ),
      ),
    );
  }
}