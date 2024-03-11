import '/components/notifications/home_notification_component/home_notification_component_widget.dart';
import '/components/others/menu_coponent/menu_coponent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_page_widget.dart' show NotificationsPageWidget;
import 'package:flutter/material.dart';

class NotificationsPageModel extends FlutterFlowModel<NotificationsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for menuCoponent component.
  late MenuCoponentModel menuCoponentModel;
  // Model for homeNotificationComponent component.
  late HomeNotificationComponentModel homeNotificationComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuCoponentModel = createModel(context, () => MenuCoponentModel());
    homeNotificationComponentModel =
        createModel(context, () => HomeNotificationComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuCoponentModel.dispose();
    homeNotificationComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
