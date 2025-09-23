import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'creator_profile_widget.dart' show CreatorProfileWidget;
import 'package:flutter/material.dart';

class CreatorProfileModel extends FlutterFlowModel<CreatorProfileWidget> {
  ///  Local state fields for this page.

  bool isImageUploaded = false;

  DateTime? userDatePicked;

  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  bool isDataUploading_uploadDataCreator = false;
  FFUploadedFile uploadedLocalFile_uploadDataCreator =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataCreator = '';

  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone  is required';
    }

    if (val.length < 8) {
      return 'Minimum 8 characters is required';
    }
    if (val.length > 15) {
      return 'Maximum 18 characters is required';
    }

    return null;
  }

  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  String? _cityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'City is required';
    }

    return null;
  }

  // State field(s) for dob widget.
  FocusNode? dobFocusNode;
  TextEditingController? dobTextController;
  String? Function(BuildContext, String?)? dobTextControllerValidator;
  String? _dobTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Date of birth is required';
    }

    if (!RegExp('^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[0-2])/[0-9]{4}\$')
        .hasMatch(val)) {
      return 'Invalid date format';
    }
    return null;
  }

  DateTime? datePicked;
  // State field(s) for genderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // State field(s) for categoryDropDown widget.
  String? categoryDropDownValue;
  FormFieldController<String>? categoryDropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Bio is required';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? users;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProfilesRecord? profiles;

  @override
  void initState(BuildContext context) {
    phoneTextControllerValidator = _phoneTextControllerValidator;
    cityTextControllerValidator = _cityTextControllerValidator;
    dobTextControllerValidator = _dobTextControllerValidator;
    textController4Validator = _textController4Validator;
  }

  @override
  void dispose() {
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    dobFocusNode?.dispose();
    dobTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();
  }
}
