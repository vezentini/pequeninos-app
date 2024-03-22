import '/components/menu_coponent/menu_coponent_widget.dart';
import '/components/notification_component/notification_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'notifications_page_widget.dart' show NotificationsPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsPageModel extends FlutterFlowModel<NotificationsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for menuCoponent component.
  late MenuCoponentModel menuCoponentModel;
  // Model for notificationComponent component.
  late NotificationComponentModel notificationComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuCoponentModel = createModel(context, () => MenuCoponentModel());
    notificationComponentModel =
        createModel(context, () => NotificationComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuCoponentModel.dispose();
    notificationComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
