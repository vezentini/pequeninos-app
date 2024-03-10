import '/components/classes/classes_component/classes_component_widget.dart';
import '/components/menu_coponent/menu_coponent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'classes_page_widget.dart' show ClassesPageWidget;
import 'package:flutter/material.dart';

class ClassesPageModel extends FlutterFlowModel<ClassesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuCoponent component.
  late MenuCoponentModel menuCoponentModel;
  // Model for ClassesComponent component.
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
