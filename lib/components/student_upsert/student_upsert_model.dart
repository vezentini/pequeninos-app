import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'student_upsert_widget.dart' show StudentUpsertWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudentUpsertModel extends FlutterFlowModel<StudentUpsertWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldController;
  String? Function(BuildContext, String?)? nameTextFieldControllerValidator;
  String? _nameTextFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório.';
    }

    if (val.length < 5) {
      return 'Minímo de 5 caractéres.';
    }

    return null;
  }

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
  void initState(BuildContext context) {
    nameTextFieldControllerValidator = _nameTextFieldControllerValidator;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
