import 'package:foodfit/auth/firebase_auth/auth_util.dart';

import '/backend/backend.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'eating_preferences_widget.dart' show EatingPreferencesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EatingPreferencesModel extends FlutterFlowModel<EatingPreferencesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String age = '20';
  String gender = 'Male';
  String weight = '60 kg';
  String activityLevel = 'High';
  String bodyGoals = 'Lose weight';
  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    age = currentUserDocument?.age ?? '20';
    gender = currentUserDocument?.gender ?? 'Male';
    weight = currentUserDocument?.weight ?? '60 kg';
    activityLevel = currentUserDocument?.activityLevel ?? 'High';
    bodyGoals = currentUserDocument?.bodyGoals ?? 'Lose weight';
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customAppbarModel.dispose();
  }

  void changeAge(String age){
    this.age = age;
  }

  void changeGender(String gender){
    this.gender = gender;
  }

  void changeWeight(String weight){
    this.weight = weight;
  }

  void changeActivityLevel(String activityLevel){
    this.activityLevel = activityLevel;
  }

  void changeBodyGoals(String bodyGoals){
    this.bodyGoals = bodyGoals;
  }
  /// Action blocks are added here.


  /// Additional helper methods are added here.
}
