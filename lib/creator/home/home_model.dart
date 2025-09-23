import '/creator/component/creator_nav_bar/creator_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utilities/theme/theme_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for creatorNavBar component.
  late CreatorNavBarModel creatorNavBarModel;
  // State field(s) for searchText widget.
  FocusNode? searchTextFocusNode;
  TextEditingController? searchTextTextController;
  String? Function(BuildContext, String?)? searchTextTextControllerValidator;
  // Model for theme component.
  late ThemeModel themeModel;

  @override
  void initState(BuildContext context) {
    creatorNavBarModel = createModel(context, () => CreatorNavBarModel());
    themeModel = createModel(context, () => ThemeModel());
  }

  @override
  void dispose() {
    creatorNavBarModel.dispose();
    searchTextFocusNode?.dispose();
    searchTextTextController?.dispose();

    themeModel.dispose();
  }
}
