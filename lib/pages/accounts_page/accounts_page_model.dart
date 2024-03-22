import '/components/accounts_component/accounts_component_widget.dart';
import '/components/menu_coponent/menu_coponent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'accounts_page_widget.dart' show AccountsPageWidget;
import 'package:flutter/material.dart';

class AccountsPageModel extends FlutterFlowModel<AccountsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for menuCoponent component.
  late MenuCoponentModel menuCoponentModel;
  // Model for accountsComponent component.
  late AccountsComponentModel accountsComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuCoponentModel = createModel(context, () => MenuCoponentModel());
    accountsComponentModel =
        createModel(context, () => AccountsComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuCoponentModel.dispose();
    accountsComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
