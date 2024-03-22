import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AccountLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Account Login',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/accounts/login',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'email': email,
        'password': password,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.account.name''',
      ));
  static String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.account.phone''',
      ));
  static String? profile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.account.profile''',
      ));
  static List<String>? studentsId(dynamic response) => (getJsonField(
        response,
        r'''$.account.studentIds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.account.id''',
      ));
  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.account.email''',
      ));
}

class FindClassesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Find Classes',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/classes/find',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? classes(dynamic response) => getJsonField(
        response,
        r'''$.classes''',
        true,
      ) as List?;
}

class FindAccountsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Find Accounts',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/accounts/find',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? accounts(dynamic response) => getJsonField(
        response,
        r'''$.accounts''',
        true,
      ) as List?;
}

class FindOneAccountCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Find One Account',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/accounts/findOne',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  static String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phone''',
      ));
  static String? document(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.document''',
      ));
  static List<String>? studentIds(dynamic response) => (getJsonField(
        response,
        r'''$.studentIds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? profile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile''',
      ));
}

class FindStudentsCall {
  static Future<ApiCallResponse> call({
    int? accountId,
    String? profile = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Find Students',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/students/find',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'accountId': accountId,
        'profile': profile,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? students(dynamic response) => getJsonField(
        response,
        r'''$.students''',
        true,
      ) as List?;
}

class FindSummariesCall {
  static Future<ApiCallResponse> call({
    int? accountId,
    String? profile = '',
    String? date = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Find Summaries',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/summaries/find',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'accountId': accountId,
        'profile': profile,
        'date': date,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? summaries(dynamic response) => getJsonField(
        response,
        r'''$.summaries''',
        true,
      ) as List?;
}

class FindStudentsSelectionCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Find Students Selection',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/students/findSelection',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? students(dynamic response) => getJsonField(
        response,
        r'''$.students''',
        true,
      ) as List?;
}

class FindClassesSelectionCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Find Classes  Selection',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/classes/findSelection',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? classes(dynamic response) => (getJsonField(
        response,
        r'''$.classes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FindNotificationsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Find Notifications',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/notifications/find',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? notifications(dynamic response) => getJsonField(
        response,
        r'''$.notifications''',
        true,
      ) as List?;
}

class UploadImageCall {
  static Future<ApiCallResponse> call({
    String? key = '',
    String? action = '',
    FFUploadedFile? source,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Upload Image',
      apiUrl: 'https://freeimage.host/api/1/upload',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'key': key,
        'action': action,
        'source': source,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? urlImage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.image.url''',
      ));
}

class NotificationsUpsertCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? title = '',
    String? description = '',
    String? photo = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "title": "${title}",
  "description": "${description}",
  "photo": "${photo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Notifications Upsert',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/notifications/upsert',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ClassUpsertCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "name": "${name}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Class Upsert',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/classes/upsert',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class StudentUpsertCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? name = '',
    String? classId = '',
    String? gender = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "name": "${name}",
  "classId": "${classId}",
  "gender": "${gender}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Student Upsert',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/students/upsert',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AccountUpsertCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? name = '',
    List<String>? studentsIdsList,
    String? profile = '',
    String? document = '',
    String? email = '',
    String? password = '',
    String? phone = '',
  }) async {
    final studentsIds = _serializeList(studentsIdsList);

    final ffApiRequestBody = '''
{
  "id": ${id},
  "name": "${name}",
  "document": "${document}",
  "email": "${email}",
  "password": "${password}",
  "phone": "${phone}",
  "studentIds": ${studentsIds},
  "profile": "${profile}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Account Upsert',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/accounts/upsert',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SummaryUpsertCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? luncheonConsumn = '',
    String? luncheon = '',
    String? mornningSnackConsumn = '',
    String? mornningSnack = '',
    String? studentId = '',
    String? date = '',
    String? afternoonSnack = '',
    String? afternoonSnackConsumn = '',
    String? description = '',
    String? preDinner = '',
    String? preDinnerConsumn = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "${id}",
  "date": "${date}",
  "studentId": "${studentId}",
  "mornningSnack": "${mornningSnack}",
  "mornningSnackConsumn": "${mornningSnackConsumn}",
  "luncheon": "${luncheon}",
  "luncheonConsumn": "${luncheonConsumn}",
  "afternoonSnack": "${afternoonSnack}",
  "afternoonSnackConsumn": "${afternoonSnackConsumn}",
  "preDinner": "${preDinner}",
  "preDinnerConsumn": "${preDinnerConsumn}",
  "description": "${description}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Summary Upsert',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/summaries/upsert',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteStudentCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Student',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/students/delete',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAccountCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Account',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/accounts/delete',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class DeleteClassCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Class',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/classes/delete',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
