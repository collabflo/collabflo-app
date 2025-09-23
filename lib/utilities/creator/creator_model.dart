import '/flutter_flow/flutter_flow_util.dart';
import '/utilities/response_fast/response_fast_widget.dart';
import '/utilities/top_creator/top_creator_widget.dart';
import 'creator_widget.dart' show CreatorWidget;
import 'package:flutter/material.dart';

class CreatorModel extends FlutterFlowModel<CreatorWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for topCreator component.
  late TopCreatorModel topCreatorModel;
  // Model for responseFast component.
  late ResponseFastModel responseFastModel;

  @override
  void initState(BuildContext context) {
    topCreatorModel = createModel(context, () => TopCreatorModel());
    responseFastModel = createModel(context, () => ResponseFastModel());
  }

  @override
  void dispose() {
    topCreatorModel.dispose();
    responseFastModel.dispose();
  }
}
