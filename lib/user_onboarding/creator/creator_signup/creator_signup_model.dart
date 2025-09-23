import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creator_signup_widget.dart' show CreatorSignupWidget;
import 'package:flutter/material.dart';

class CreatorSignupModel extends FlutterFlowModel<CreatorSignupWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Invalid email';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 6) {
      return 'Minimum 6 characters required';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters required';
    }

    return null;
  }

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Full Name is required';
    }

    if (val.length < 3) {
      return 'Full name should have 3 characters minimum';
    }

    return null;
  }

  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Username is required';
    }

    if (val.length < 3) {
      return 'Minimum 3 characters required';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed';
    }
    if (!RegExp('^[a-zA-Z0-9._]{1,20}\$').hasMatch(val)) {
      return 'Invalid username';
    }
    return null;
  }

  // Stores action output result for [Custom Action - checkUsernameUnique] action in userName widget.
  bool? isUsernameUnique;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    userNameTextControllerValidator = _userNameTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    userNameFocusNode?.dispose();
    userNameTextController?.dispose();
  }
}
