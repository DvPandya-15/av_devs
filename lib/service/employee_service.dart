import 'dart:convert';
import 'dart:io';

import 'package:av_devs/model/employee.dart';
import 'package:http/http.dart';

class EmployeeService {
  Future<List<Employee>> getEmployees() async {
    List<Employee> employeeList = <Employee>[];

    final response = await get(
        Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
    if (response.statusCode == 200) {
      var mapResponse = jsonDecode(response.body);
      if (mapResponse['data'] == null || mapResponse['data'] is! List) {
        throw const HttpException(
            "Invalid Response: No 'data' element found in response ");
      }
      employeeList = (mapResponse['data'] as List)
          .map<Employee>((e) => Employee.fromJson(e))
          .toList();
    }
    return employeeList;
  }

  Future<bool> addEmployee(body) async {
    var url = Uri.parse('https://dummy.restapiexample.com/api/v1/create');
    final response = await post(url, body: body);
    return response.statusCode == 200;
  }
}
