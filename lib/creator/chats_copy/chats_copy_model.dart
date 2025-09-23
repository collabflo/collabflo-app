import '/creator/component/about/about_widget.dart';
import '/creator/component/creator_nav_bar/creator_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'chats_copy_widget.dart' show ChatsCopyWidget;
import 'package:flutter/material.dart';

class ChatsCopyModel extends FlutterFlowModel<ChatsCopyWidget> {
  ///  Local state fields for this page.

  String? otherUserId;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for creatorNavBar component.
  late CreatorNavBarModel creatorNavBarModel;
  // State field(s) for messageSearch widget.
  final messageSearchKey = GlobalKey();
  FocusNode? messageSearchFocusNode;
  TextEditingController? messageSearchTextController;
  String? messageSearchSelectedOption;
  String? Function(BuildContext, String?)? messageSearchTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 4096) {
      return 'Maximum 4096 characters required';
    }

    return null;
  }

  // Model for about component.
  late AboutModel aboutModel;

  @override
  void initState(BuildContext context) {
    creatorNavBarModel = createModel(context, () => CreatorNavBarModel());
    textController2Validator = _textController2Validator;
    aboutModel = createModel(context, () => AboutModel());
  }

  @override
  void dispose() {
    creatorNavBarModel.dispose();
    messageSearchFocusNode?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    aboutModel.dispose();
  }
}
