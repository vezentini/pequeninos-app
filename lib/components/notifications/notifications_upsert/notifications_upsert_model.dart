import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_upsert_widget.dart' show NotificationsUpsertWidget;
import 'package:flutter/material.dart';

class NotificationsUpsertModel
    extends FlutterFlowModel<NotificationsUpsertWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for titleTextField widget.
  FocusNode? titleTextFieldFocusNode;
  TextEditingController? titleTextFieldController;
  String? Function(BuildContext, String?)? titleTextFieldControllerValidator;
  // State field(s) for descriptionTextField widget.
  FocusNode? descriptionTextFieldFocusNode;
  TextEditingController? descriptionTextFieldController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Upload Image)] action in save widget.
  ApiCallResponse? uploadedApi;
  // Stores action output result for [Backend Call - API (Notifications Upsert)] action in save widget.
  ApiCallResponse? upsertNotificationApi;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleTextFieldFocusNode?.dispose();
    titleTextFieldController?.dispose();

    descriptionTextFieldFocusNode?.dispose();
    descriptionTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
