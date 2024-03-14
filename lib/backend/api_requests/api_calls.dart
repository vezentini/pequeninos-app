import 'dart:convert';

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
  static String? id(dynamic response) => castToType<String>(getJsonField(
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

class FindStudentsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Find Students',
      apiUrl:
          'http://pequeninos-rest-api.sa-east-1.elasticbeanstalk.com/students/find',
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
