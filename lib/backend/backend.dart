import 'dart:convert';
import 'dart:io';

import 'package:chatgpt_completions/chatgpt_completions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:foodfit/backend/schema/food.dart';
import 'package:foodfit/backend/schema/food_nutrition.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../auth/firebase_auth/auth_util.dart';
import 'package:pdf/widgets.dart' as pw;

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/users_record.dart';
import 'schema/meals_record.dart';
import 'schema/onboarding_options_record.dart';
import 'schema/company_information_record.dart';
import 'schema/feedback_record.dart';
import 'schema/support_center_record.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/users_record.dart';
export 'schema/meals_record.dart';
export 'schema/onboarding_options_record.dart';
export 'schema/company_information_record.dart';
export 'schema/feedback_record.dart';
export 'schema/support_center_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Future<int> queryUsersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query MealsRecords (as a Stream and as a Future).
Future<int> queryMealsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      MealsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<MealsRecord>> queryMealsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      MealsRecord.collection,
      MealsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Stream<List<Food>> queryFoodRecord({
  required String userId,
}){
  final snaps = FirebaseFirestore.instance.collection('users').doc(userId).collection('meals').orderBy('createdAt', descending: true).snapshots();
  return snaps.map((event) => event.docs.map((doc) => Food.fromMap(doc.data())).toList());
}

Future<List<MealsRecord>> queryMealsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      MealsRecord.collection,
      MealsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query OnboardingOptionsRecords (as a Stream and as a Future).
Future<int> queryOnboardingOptionsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      OnboardingOptionsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<OnboardingOptionsRecord>> queryOnboardingOptionsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      OnboardingOptionsRecord.collection,
      OnboardingOptionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<OnboardingOptionsRecord>> queryOnboardingOptionsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      OnboardingOptionsRecord.collection,
      OnboardingOptionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CompanyInformationRecords (as a Stream and as a Future).
Future<int> queryCompanyInformationRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyInformationRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyInformationRecord>> queryCompanyInformationRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyInformationRecord.collection,
      CompanyInformationRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyInformationRecord>> queryCompanyInformationRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyInformationRecord.collection,
      CompanyInformationRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query FeedbackRecords (as a Stream and as a Future).
Future<int> queryFeedbackRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FeedbackRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FeedbackRecord>> queryFeedbackRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FeedbackRecord.collection,
      FeedbackRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FeedbackRecord>> queryFeedbackRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FeedbackRecord.collection,
      FeedbackRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SupportCenterRecords (as a Stream and as a Future).
Future<int> querySupportCenterRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SupportCenterRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SupportCenterRecord>> querySupportCenterRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SupportCenterRecord.collection,
      SupportCenterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SupportCenterRecord>> querySupportCenterRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SupportCenterRecord.collection,
      SupportCenterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UsersRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUsersRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument = UsersRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUsersRecordData(email: email));
}

Future addMealToHistory(String path,List<FoodNutrition> nutritions) async{
  final doc = currentUserDocument!.reference.collection('meals').doc();
  String extension = path.split(".").last;
  print("started");
  final task = await FirebaseStorage.instance.ref("users/${currentUserUid}/meals/${doc.id}.${extension}").putFile(File(path));
  print("end");
  final url = await task.ref.getDownloadURL();
  return doc.set({'id': doc.id, 'nutritions': nutritions.map((e) => e.toMap()).toList(), 'photoUrl': url, 'createdAt': FieldValue.serverTimestamp()});
}

Future generateDailyReport() async{
  print("send");
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String userId = currentUserUid; // Your user id here
  final DateTime now = DateTime.now();
  Map<String, dynamic> totalNutritions = {};

  final QuerySnapshot result = await _firebaseFirestore
      .collection('users')
      .doc(userId)
      .collection('meals')
      .get();



  result.docs.forEach((res){
    ((res.data() as Map<String,dynamic>)['nutritions'] as List<dynamic>).forEach((nutrition) {
      if(totalNutritions.containsKey(nutrition['name'])){
        totalNutritions[nutrition['name']] += nutrition['amount'];
      } else {
        totalNutritions[nutrition['name']] = nutrition['amount'];
      }
    });
  });

  final message =
      'You are analyzing a person nutrition daily content based on person age, weight, aims and etc... Analyze the person daily nutritions based on what i provide and make it as conclusion written by doctor. Weight: ${currentUserDocument!.weight}, Age: ${currentUserDocument!.age}, Gender: ${currentUserDocument!.gender}, Activity level: ${currentUserDocument!.activityLevel}, Body goals: ${currentUserDocument!.bodyGoals}\n Nutritions for today: ${totalNutritions.toString()}\n Note one important thing: make it like a description on paper, no introduction, nothing chatgpt-like';


  const String apiKey = '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';
  const String endpoint = 'https://api.openai.com/v1/chat/completions';


  final dio = Dio();
  final response = await dio.post(
    endpoint,
    data: {
      "model": "gpt-3.5-turbo",
      "messages": [{"role": "user", "content": message}],
      "temperature": 0.7
    },
    options: Options(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
    ),
  );
  final conclusion = (response.data as Map<String,dynamic>)["choices"][0]["message"]["content"];
  print(conclusion);

  final pdf = pw.Document();
  var data = <pw.TableRow>[
    pw.TableRow(
      children: [
        pw.Text('Nutrition Name', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.Text('Total Amount', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
      ],
    ),
  ];
  for (final meal in totalNutritions.entries) {
    data.add(
      pw.TableRow(children: [
        pw.Text(meal.key),
        pw.Text(meal.value.toStringAsFixed(2)),
      ]),
    );
  }

  pdf.addPage(
    pw.MultiPage(
        build: (context) {
          return [
            pw.Text('Daily nutrition report (${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day})', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.Container(height: 10),
          pw.Table(children: data),
            pw.Container(height: 10),
            pw.Text('Conclusion:', style: pw.TextStyle(fontSize: 18)),
            pw.Text(conclusion.toString()),
        ];
        }
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/report.pdf");
  await file.writeAsBytes(await pdf.save());

  await Dio(BaseOptions(headers: {
    "accept": "application/json",
    "api-key": "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",
    "content-type": "application/json"
  })).post("https://api.brevo.com/v3/smtp/email", data: {
    "sender": {
      "name": "Nutrition app",
      "email": "pandatechnologydev@gmail.com"
    },
    "to": [
      {
        "email": currentUserEmail,
        "name": currentUserDisplayName
      }
    ],
    "subject": "Daily nutritions report",
    "textContent": "Your daily nutritions report",
    "attachment": [{"content": base64Encode(file.readAsBytesSync()), "name": "daily_report.pdf"}]
  });
}