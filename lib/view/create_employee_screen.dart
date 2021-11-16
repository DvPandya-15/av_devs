import 'package:av_devs/service/employee_service.dart';
import 'package:flutter/material.dart';

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen({Key? key}) : super(key: key);

  @override
  _CreateEmployeeScreenState createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  final empName = TextEditingController();
  final empAge = TextEditingController();

  void saveEmp() {
    if (empName.text.isNotEmpty && empAge.text.isNotEmpty) {
      print("called save emp");
      final body = {
        "name": empName.text,
        "age": empAge.text,
      };

      EmployeeService().addEmployee(body).then((success) {
        if (success) {
          showDialog(
            builder: (context) => AlertDialog(
              title: const Text('Employee has been added!!!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    empName.text = '';
                    empAge.text = '';
                  },
                  child: Text('OK'),
                )
              ],
            ),
            context: context,
          );
          return;
        }
      });
    } else {
      showDialog(
        builder: (context) => AlertDialog(
          title: Text('Add Details!!!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            )
          ],
        ),
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text("Create Employee"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Icon(
              Icons.person,
              size: 100,
              color: Colors.redAccent,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: empName,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Name",
                  fillColor: Colors.white70),
            ),
            const SizedBox(height: 25),
            TextField(
              keyboardType: TextInputType.number,
              controller: empAge,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Age",
                  fillColor: Colors.white70),
            ),
            const SizedBox(height: 25),
            TextButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5),
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<MaterialAccentColor>(
                    Colors.redAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              onPressed: () => saveEmp(),
            ),
          ],
        ),
      ),
    );
  }
}
