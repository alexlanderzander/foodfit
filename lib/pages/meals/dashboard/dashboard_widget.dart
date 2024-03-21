import 'package:camera/camera.dart';

import '../../../backend/schema/food_nutrition.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/meal_card/meal_card_widget.dart';
import '/components/meal_card_loading/meal_card_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late final List<CameraDescription> _cameras;
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    availableCameras().then((value){
      _cameras = value;
      controller = CameraController(_cameras[0], ResolutionPreset.medium);
      controller!.initialize().then((_) => setState((){}));
    });
    _model = createModel(context, () => DashboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DASHBOARD_PAGE_Dashboard_ON_INIT_STATE');
      logFirebaseEvent('Dashboard_haptic_feedback');
      HapticFeedback.mediumImpact();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    controller?.dispose();
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Photo your meal',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        'Get estimated nutritions content from image',
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ],
                ),
              ),
              controller == null ? const SizedBox.shrink() : Expanded(child: CameraPreview(
                controller!
              )),
              Padding(
                padding:
                const EdgeInsetsDirectional.fromSTEB(0.0, 0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final photo = await controller!.takePicture();
                    final bytes = await photo.readAsBytes();
                    setState((){
                      _model.setImage(bytes);
                    });
                    final nutritions = await _showMealConfirmation();
                    if(nutritions == null) return;
                    await addMealToHistory(photo.path,nutritions);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added")));
                  },
                  text: 'Make photo',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                    FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      color: FlutterFlowTheme.of(context)
                          .primaryBackground,
                      fontWeight: FontWeight.w600,
                    ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.zero
                  ),
                ),
              ),
              /*Expanded(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => StreamBuilder<List<MealsRecord>>(
                      stream: queryMealsRecord(
                        queryBuilder: (mealsRecord) => mealsRecord.where(
                          'meal_diet',
                          arrayContains:
                              valueOrDefault(currentUserDocument?.diet, ''),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return MealCardLoadingWidget();
                        }
                        List<MealsRecord> gridViewMealsRecordList =
                            snapshot.data!;
                        if (gridViewMealsRecordList.isEmpty) {
                          return Container(
                            width: double.infinity,
                            child: EmptyStateWidget(
                              icon: Icon(
                                Icons.no_food_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 64.0,
                              ),
                              title: 'No Meals',
                              description:
                                  'No meals have been created or match your dietary preferences.',
                            ),
                          );
                        }
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.78,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewMealsRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewMealsRecord =
                                gridViewMealsRecordList[gridViewIndex];
                            return MealCardWidget(
                              key: Key(
                                  'Keykia_${gridViewIndex}_of_${gridViewMealsRecordList.length}'),
                              mealRef: gridViewMealsRecord,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  final _nutritions = [
    const FoodNutrition(name: 'Calories', amount: 254, quantityPrefix: 'mg'),
    const FoodNutrition(name: 'Fat', amount: 24, quantityPrefix: 'g'),
    const FoodNutrition(name: 'Protein', amount: 3, quantityPrefix: 'mg'),
    const FoodNutrition(name: 'Vitamin D', amount: 2, quantityPrefix: 'mg'),
  ];

  Future<List<FoodNutrition>?> _showMealConfirmation() async{
    if(_model.pickedImage == null) return null;
    return showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: 450,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.memory(_model.pickedImage!)),
            ),
            Container(height: 150, width: double.infinity, color: Colors.white, child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: _nutritions.map((e) => Row(
                    children: [
                      Text(e.name, style: const TextStyle(
                          fontFamily: 'Urbanist', fontWeight: FontWeight.w600, fontSize: 16
                      ),),
                      const Spacer(),
                      Text(e.amount.toStringAsFixed(2) + "" + e.quantityPrefix, style: const TextStyle(fontSize: 16, fontFamily: 'Manrope'),)
                    ],
                  )).toList().paddingTopEach(5),
                ),
              ),
            ),),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.of(context).pop(null);
                      },
                      text: 'Deny',
                      options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context)
                                .primaryBackground,
                            fontWeight: FontWeight.w600,
                          ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.zero
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.of(context).pop(_nutritions);
                      },
                      text: 'Eat',
                      options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context)
                                .primaryBackground,
                            fontWeight: FontWeight.w600,
                          ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.zero
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}