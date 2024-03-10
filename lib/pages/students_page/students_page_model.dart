import '/components/menu_coponent/menu_coponent_widget.dart';
import '/components/students/student_component/student_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'students_page_widget.dart' show StudentsPageWidget;
import 'package:flutter/material.dart';

class StudentsPageModel extends FlutterFlowModel<StudentsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuCoponent component.
  late MenuCoponentModel menuCoponentModel;
  // Model for StudentComponent component.
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
