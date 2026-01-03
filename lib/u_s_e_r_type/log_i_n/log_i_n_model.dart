import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'log_i_n_widget.dart' show LogINWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LogINModel extends FlutterFlowModel<LogINWidget> {
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
        'gq7pjatb' /* حقل مطلوب */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '1o8rcgdn' /* يرجى إدخال بريد إلكتروني صحيح ... */,
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
        '76q0yte5' /* حقل مطلوب */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'nt0ue7nm' /* كلمة المرور قصيرة، يرجى إدخال ... */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    passwTextFieldVisibility = false;
    passwTextFieldTextControllerValidator =
        _passwTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwTextFieldFocusNode?.dispose();
    passwTextFieldTextController?.dispose();
  }
}
