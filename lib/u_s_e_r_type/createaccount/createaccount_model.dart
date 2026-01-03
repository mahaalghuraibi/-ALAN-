import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'createaccount_widget.dart' show CreateaccountWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateaccountModel extends FlutterFlowModel<CreateaccountWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hvvk7o7a' /* حقل مطلوب */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'je2nm1y4' /* يرجى إدخال بريد إلكتروني صحيح ... */,
      );
    }
    return null;
  }

  // State field(s) for PasswTextField widget.
  FocusNode? passwTextFieldFocusNode;
  TextEditingController? passwTextFieldTextController;
  late bool passwTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwTextFieldTextControllerValidator;
  String? _passwTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3utbfu3s' /* حقل مطلوب  */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'n3x4bbhe' /* كلمة المرور قصيرة، يرجى إدخال ... */,
      );
    }

    return null;
  }

  // State field(s) for Passw2TextField widget.
  FocusNode? passw2TextFieldFocusNode;
  TextEditingController? passw2TextFieldTextController;
  late bool passw2TextFieldVisibility;
  String? Function(BuildContext, String?)?
      passw2TextFieldTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    passwTextFieldVisibility = false;
    passwTextFieldTextControllerValidator =
        _passwTextFieldTextControllerValidator;
    passw2TextFieldVisibility = false;
  }

  @override
  void dispose() {
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwTextFieldFocusNode?.dispose();
    passwTextFieldTextController?.dispose();

    passw2TextFieldFocusNode?.dispose();
    passw2TextFieldTextController?.dispose();
  }
}
