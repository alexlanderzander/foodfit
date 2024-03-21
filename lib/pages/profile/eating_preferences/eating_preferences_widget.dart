import 'package:flutter/cupertino.dart';

import '../../../auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eating_preferences_model.dart';
export 'eating_preferences_model.dart';

class EatingPreferencesWidget extends StatefulWidget {
  const EatingPreferencesWidget({super.key});

  @override
  State<EatingPreferencesWidget> createState() =>
      _EatingPreferencesWidgetState();
}

class _EatingPreferencesWidgetState extends State<EatingPreferencesWidget> {
  late EatingPreferencesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EatingPreferencesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EatingPreferences'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  List<String> _ages = List.generate(80, (index) => (index + 4).toString());
  List<String> _genders = ["Male","Female"];
  List<String> _weight = List.generate(240, (index) => (15 + index).toString() + " kg");
  List<String> _activityLevel = ["Low", "Medium", "High"];
  List<String> _bodyGoals = ["Loose weight", "Build muscles", "Maintain fitness"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.customAppbarModel,
                    updateCallback: () => setState(() {}),
                    child: CustomAppbarWidget(
                      backButton: true,
                      actionButtonText: 'Save',
                      actionButton: true,
                      actionButtonAction: () async {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          age: _model.age,
                          gender: _model.gender,
                          weight: _model.weight,
                          activityLevel: _model.activityLevel,
                          bodyGoals: _model.bodyGoals
                        ));
                      },
                      optionsButtonAction: () async {},
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Text(
                      'Personal Health Settings',
                      style: FlutterFlowTheme.of(context).displaySmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                /*setState(() {
                                  _model.changeAge('21');
                                });*/
                                _showDialog(_model.age, _ages, (i){
                                  setState(() {
                                    _model.changeAge(_ages[i]);
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Icon(
                                            Icons.celebration_outlined,
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Age',
                                          style:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                                        child: Text(
                                          _model.age,
                                          style:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _showDialog(_model.gender, _genders, (i){
                                  setState(() {
                                    _model.changeGender(_genders[i]);
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Icon(
                                            Icons.man,
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Gender',
                                          style:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                                        child: Text(
                                          _model.gender,
                                          style:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _showDialog(_model.weight, _weight, (i){
                                  setState(() {
                                    _model.changeWeight(_weight[i]);
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Icon(
                                            Icons.fitness_center_outlined,
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Weight',
                                          style:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                                        child: Text(
                                          _model.weight,
                                          style:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _showDialog(_model.activityLevel, _activityLevel, (i){
                                  setState(() {
                                    _model.changeActivityLevel(_activityLevel[i]);
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Icon(
                                            Icons.directions_bike_outlined,
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Activity level',
                                          style:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                                        child: Text(
                                          _model.activityLevel,
                                          style:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _showDialog(_model.bodyGoals, _bodyGoals, (i){
                                  setState(() {
                                    _model.changeBodyGoals(_bodyGoals[i]);
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Icon(
                                            Icons.domain_verification_outlined,
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Body goals',
                                          style:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                                        child: Text(
                                          _model.bodyGoals,
                                          style:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(String initialItem, List<String> items, Function(int) onSelectedItemChanged) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 30,
            // This sets the initial item.
            scrollController: FixedExtentScrollController(
              initialItem: items.indexWhere((e) => e == initialItem),
            ),
            // This is called when selected item is changed.
            onSelectedItemChanged: onSelectedItemChanged,
            children:
            List<Widget>.generate(items.length, (int index) {
              return Center(child: Text(items[index]));
            }),
        ),
      ),
    ));
  }
}
