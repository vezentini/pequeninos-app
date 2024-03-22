import '/components/menu_coponent/menu_coponent_widget.dart';
import '/components/student_component/student_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'students_page_widget.dart' show StudentsPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudentsPageModel extends FlutterFlowModel<StudentsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for menuCoponent component.
  late MenuCoponentModel menuCoponentModel;
  // Model for studentComponent component.
  late StudentComponentModel studentComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuCoponentModel = createModel(context, () => MenuCoponentModel());
    studentComponentModel = createModel(context, () => StudentComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuCoponentModel.dispose();
    studentComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
