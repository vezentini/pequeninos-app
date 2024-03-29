import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'class_upsert_widget.dart' show ClassUpsertWidget;
import 'package:flutter/material.dart';

class ClassUpsertModel extends FlutterFlowModel<ClassUpsertWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório.';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Class Upsert)] action in Button widget.
  ApiCallResponse? upsertClassApiResult;
  // Stores action output result for [Backend Call - API (Delete Class)] action in Button widget.
  ApiCallResponse? deleteClassApiResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
