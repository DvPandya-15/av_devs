import 'package:av_devs/controller/home_page_controller.dart';
import 'package:av_devs/model/employee.dart';
import 'package:av_devs/service/employee_service.dart';
import 'package:av_devs/view/create_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);
  final homePageController = HomePageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text("Employees's List"),
      ),
      // body: GetBuilder<HomePageController>(
      //     init: HomePageController(),
      //     builder: (controller) {
      //       if (controller.isLoading) {
      //         return const Center(child: CircularProgressIndicator());
      //       }
      //       if (controller.employeeList == null) {
      //         return const Center(child: Text("Error"));
      //       }
      //       if (controller.employeeList!.isEmpty) {
      //         return const Center(child: Text("No Employees Found!"));
      //       }
      //       return ListView.separated(
      //           physics: const BouncingScrollPhysics(),
      //           itemBuilder: (context, index) {
      //             return ListTile(
      //               title: Text(controller.employeeList![index].employeeName!),
      //               subtitle: Text(
      //                   "Age : ${controller.employeeList![index].employeeAge!.toString()}"),
      //             );
      //           },
      //           separatorBuilder: (context, index) {
      //             return const SizedBox(height: 5);
      //           },
      //           itemCount: controller.employeeList!.length);
      //     }),
      body: FutureBuilder<List<Employee>>(
        future: EmployeeService().getEmployees(),
        builder: (context, AsyncSnapshot<List<Employee>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: Text("Something went wrong!"),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Employee> employee = snapshot.data!;

          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(employee[index].employeeName!),
                  subtitle:
                      Text("Age : ${employee[index].employeeAge!.toString()}"),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 5);
              },
              itemCount: employee.length);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Get.to(const CreateEmployeeScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
