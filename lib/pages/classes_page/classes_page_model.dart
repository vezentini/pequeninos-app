import '/components/classes_component/classes_component_widget.dart';
import '/components/menu_coponent/menu_coponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'classes_page_widget.dart' show ClassesPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClassesPageModel extends FlutterFlowModel<ClassesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for menuCoponent component.
  late MenuCoponentModel menuCoponentModel;
  // Model for classesComponent component.
  late ClassesComponentModel classesComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuCoponentModel = createModel(context, () => MenuCoponentModel());
    classesComponentModel = createModel(context, () => ClassesComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuCoponentModel.dispose();
    classesComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
