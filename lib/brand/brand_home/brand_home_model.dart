import '/creator/component/creator_nav_bar/creator_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'brand_home_widget.dart' show BrandHomeWidget;
import 'package:flutter/material.dart';

class BrandHomeModel extends FlutterFlowModel<BrandHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for creatorNavBar component.
  late CreatorNavBarModel creatorNavBarModel;

  @override
  void initState(BuildContext context) {
    creatorNavBarModel = createModel(context, () => CreatorNavBarModel());
  }

  @override
  void dispose() {
    creatorNavBarModel.dispose();
  }
}
