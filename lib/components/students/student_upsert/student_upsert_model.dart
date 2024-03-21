import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'student_upsert_widget.dart' show StudentUpsertWidget;
import 'package:flutter/material.dart';

class StudentUpsertModel extends FlutterFlowModel<StudentUpsertWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldController;
  String? Function(BuildContext, String?)? nameTextFieldControllerValidator;
  // State field(s) for genderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // State field(s) for classDropDown widget.
  String? classDropDownValue;
  FormFieldController<String>? classDropDownValueController;
  // Stores action output result for [Backend Call - API (Student Upsert)] action in Button widget.
  ApiCallResponse? upsertStudentApi;
  // Stores action output result for [Backend Call - API (Delete Student)] action in Button widget.
  ApiCallResponse? deleteStudentApiResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
