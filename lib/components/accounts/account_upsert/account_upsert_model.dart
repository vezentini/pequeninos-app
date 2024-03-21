import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'account_upsert_widget.dart' show AccountUpsertWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AccountUpsertModel extends FlutterFlowModel<AccountUpsertWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldController;
  String? Function(BuildContext, String?)? nameTextFieldControllerValidator;
  // State field(s) for emailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  // State field(s) for documentTextField widget.
  FocusNode? documentTextFieldFocusNode;
  TextEditingController? documentTextFieldController;
  final documentTextFieldMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? documentTextFieldControllerValidator;
  // State field(s) for phoneTextField widget.
  FocusNode? phoneTextFieldFocusNode;
  TextEditingController? phoneTextFieldController;
  final phoneTextFieldMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? phoneTextFieldControllerValidator;
  // State field(s) for passwordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)? passwordTextFieldControllerValidator;
  // State field(s) for profileRadionButton widget.
  FormFieldController<String>? profileRadionButtonValueController;
  // Stores action output result for [Backend Call - API (Account Upsert)] action in Button widget.
  ApiCallResponse? accountUpertResultApi;
  // Stores action output result for [Backend Call - API (Delete Account)] action in Button widget.
  ApiCallResponse? deleteAccountApiResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordTextFieldVisibility = false;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldController?.dispose();

    documentTextFieldFocusNode?.dispose();
    documentTextFieldController?.dispose();

    phoneTextFieldFocusNode?.dispose();
    phoneTextFieldController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get profileRadionButtonValue =>
      profileRadionButtonValueController?.value;
}
