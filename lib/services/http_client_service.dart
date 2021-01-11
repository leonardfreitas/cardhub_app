import 'dart:convert';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../helpers/base_url_helper.dart';
import './http_error_service.dart';

class HttpClientService {
  final Client client = Client();
  final headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };

  Future<Map> request(
      {@required String url, @required String method, Map body}) async {
    final formatUrl = '${BaseUrlHelper.BASE_URL}${url}';
    print(formatUrl);
    final formatBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);
    try {
      switch (method) {
        case 'post':
          {
            response = await client.post(
              formatUrl,
              headers: headers,
              body: formatBody,
            );
          }
          break;
        case 'get':
          {
            response = await client.get(
              formatUrl,
              headers: headers,
            );
          }
          break;
        case 'put':
          {
            response = await client.put(
              formatUrl,
              headers: headers,
              body: formatBody,
            );
          }
          break;
        case 'patch':
          {
            response = await client.patch(
              formatUrl,
              headers: headers,
              body: formatBody,
            );
          }
          break;
        case 'delete':
          {
            response = await client.patch(
              formatUrl,
              headers: headers,
              body: formatBody,
            );
          }
          break;
      }
    } catch (error) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  Map _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    } else if (response.statusCode == 204) {
      return null;
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}
