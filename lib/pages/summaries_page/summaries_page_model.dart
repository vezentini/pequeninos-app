import '/components/others/menu_coponent/menu_coponent_widget.dart';
import '/components/summary/summaries_component/summaries_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'summaries_page_widget.dart' show SummariesPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SummariesPageModel extends FlutterFlowModel<SummariesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for menuCoponent component.
  late MenuCoponentModel menuCoponentModel;
  // Model for summariesComponent component.
  late SummariesComponentModel summariesComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuCoponentModel = createModel(context, () => MenuCoponentModel());
    summariesComponentModel =
        createModel(context, () => SummariesComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuCoponentModel.dispose();
    summariesComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
