import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 20);
    token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiMTdlOTBiMTczODJmOWQwODZmMmJkNDE1NTQzM2VkYTA5NjkyYjNmYzIzNTAxYWJmOGU0NWI4ODE2NmViZDc1MDI1YzEwZjJjNTk1MGRiOTIiLCJpYXQiOjE2NDQ4NzIxNTQuNDYxNzczLCJuYmYiOjE2NDQ4NzIxNTQuNDYxNzc5LCJleHAiOjE2NzY0MDgxNTQuMTA3ODQ5LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.0UAP6KoQ59tjEEyZHF1ey7_ga94NUN2VS-Xy-Nc4MlAtZJgzWInlEnndRSxEHOA_g18U4zkMyoAeDWAG7nkBwI3NFGffwcyQdHyXXtFcpSDJ7e8YcvoYI7d5OHFQ3rZX2oj5amUqUdDXUjtTMSb8LG1sus0j019gx0zMp8J9QR5Ne9XXJBvT5qMIYEc4qsMa50O218sS684B1S-noUtxUvAayiFITm7Sf_8uTVRjffMYfx89YKotrR-xvT0zVnyEYfWuxLe4ocRJykKXvqem3VaYBRFUTpSwozkLVKX9R7YD3PrKrDKNENiQzdN0jzEXq8m4auxJkHMF_iP8Y_ExfXQAd0c-cJslwadCgZorEJJaguBnkToll_bDdRsKNeuXsN56_1osEcudF4QmjFHOyN2Ou-hEBNIDxM9mKfpD8hR-AUI4g-tGqw82C8xa_47tQSYDmv0gHJOXZnsFtI8odPW25wNtfWQ6Qf_t-K2S-C7FScPcozRXxY0NvfV7eQfdUirbrCy5__7Tc6yp7LqCprH1QkAn4oWls9RBtk8KGk1PWgb6-KVWb3eZHk79n5fUdNEyKfg_aUaPQeMnxya4FlkYo2FM90d-O3bLqLWF63b5rW4oytQt4URev4wWbfZn5O5d8KoM1e_2sENo5j2UQGqqAWf7PL8XRhHOe41OqzU';
    _mainHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=utf-8',
    };
  }

  Future<Response> getData(String uri) async {
    print('in api get');
    try {
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, Map<dynamic, dynamic> body) async {
    print('in api post');
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(
      String uri, Map<dynamic, dynamic> body, int id) async {
    print('in api put');
    try {
      Response response = await put(uri + '/$id', body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(String uri, int id) async {
    print('in api delete');
    try {
      Response response = await delete(uri + '/$id', headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
