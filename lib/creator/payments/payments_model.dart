import '/creator/component/creator_nav_bar/creator_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'payments_widget.dart' show PaymentsWidget;
import 'package:flutter/material.dart';

class PaymentsModel extends FlutterFlowModel<PaymentsWidget> {
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
