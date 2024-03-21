import 'package:flutter/material.dart';
import 'package:foodfit/auth/firebase_auth/auth_util.dart';
import 'package:foodfit/backend/backend.dart';
import 'package:foodfit/flutter_flow/flutter_flow_model.dart';
import 'package:foodfit/pages/meals/history/history_model.dart';

import '../../../backend/schema/food.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  late HistoryModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        floatingActionButton: CircleAvatar(
          radius: 32,
          backgroundColor: FlutterFlowTheme.of(context).accent1,
          foregroundColor: FlutterFlowTheme.of(context).accent1,
          child: IconButton(
            onPressed: () async{
              await generateDailyReport();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Report has been sent to your email")));
            },
            icon: Icon(Icons.file_upload_outlined, color: Colors.black,),
          ),
        ),
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
                      'Meal history',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 16.0),
                child: StreamBuilder<List<Food>>(
                  initialData: null,
                  stream: queryFoodRecord(userId: currentUserUid),
                  builder: (context, snapshots) => snapshots.data == null ? Center(child: CircularProgressIndicator()) : ListView.builder(
                    itemCount: snapshots.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context,i){
                      final food = snapshots.data![i];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Container(width: 100, height: 100, child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.network(food.photoUrl),
                            ),),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Column(
                                children: [...food.nutritions.map((e) => Row(
                                  children: [
                                    Text(e.name, style: TextStyle(fontWeight: FontWeight.w600),),
                                    Spacer(),
                                    Text(e.amount.toStringAsFixed(2) + e.quantityPrefix)
                                  ],
                                )).toList(), SizedBox(height: 5,), Align(
                                  alignment: Alignment.centerRight,
                                    child: Text("${food.createdAt.year}-${food.createdAt.month}-${food.createdAt.day} ${food.createdAt.hour}:${food.createdAt.minute}"))]
                              ),
                            ),
                            SizedBox(),
                          ],
                        ),
                      );
                    },),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
