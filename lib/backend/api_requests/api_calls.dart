import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start realtimeDB Group Code

class RealtimeDBGroup {
  static String getBaseUrl() =>
      'https://pikachu-uq2hjp-default-rtdb.firebaseio.com';
  static Map<String, String> headers = {};
  static GetTrashbinsCall getTrashbinsCall = GetTrashbinsCall();
  static FindTrashbinCall findTrashbinCall = FindTrashbinCall();
}

class GetTrashbinsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = RealtimeDBGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getTrashbins',
      apiUrl: '${baseUrl}/trash_bins.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindTrashbinCall {
  Future<ApiCallResponse> call({
    String? serial = '',
  }) async {
    final baseUrl = RealtimeDBGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'findTrashbin',
      apiUrl: '${baseUrl}/trash_bins/${serial}.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'serial': serial,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? serial(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.serial''',
      ));
  int? cur(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.cur''',
      ));
  String? owner(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.owner''',
      ));
  String? usage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.usage''',
      ));
  int? dorac(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.do_rac''',
      ));
}

/// End realtimeDB Group Code

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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
