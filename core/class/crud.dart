import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
   
        var response = await http.post(Uri.parse(linkurl), body: data);
        print('sssssss: ${response.body}');
        print('sssssss: ${response.statusCode.runtimeType}');
        print('ggggggggggggggggggggggggggg');
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print('rrr:$responseBody');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
       
    } catch (err) {
      print('ee: $err');
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    print('---------------------');
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl));
        print('sssssss: ${response.body}');
        print('sssssss: ${response.statusCode}');
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print('kkk: $responseBody');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (err) {
      print('eeeeee: $err');
      return const Left(StatusRequest.serverFailure);
    }
  }
}
