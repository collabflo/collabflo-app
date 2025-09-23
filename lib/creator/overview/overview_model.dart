import '/creator/component/creator_nav_bar/creator_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'overview_widget.dart' show OverviewWidget;
import 'package:flutter/material.dart';

class OverviewModel extends FlutterFlowModel<OverviewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for creatorNavBar component.
  late CreatorNavBarModel creatorNavBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    creatorNavBarModel = createModel(context, () => CreatorNavBarModel());
  }

  @override
  void dispose() {
    creatorNavBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
