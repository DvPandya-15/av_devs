import 'package:av_devs/model/employee.dart';
import 'package:av_devs/service/employee_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomePageController extends GetxController {
  final employeeService = EmployeeService();
  HomePageController() {
    fetchEmployee();
  }

  List<Employee>? employeeList;
  bool isLoading = true;

  void fetchEmployee() async {
    try {
      employeeList = await employeeService.getEmployees();
      print("Found $employeeList");
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }
}
