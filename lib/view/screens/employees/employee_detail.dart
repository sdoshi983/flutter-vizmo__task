import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vizmo_task/models/employee_model.dart';
import 'package:vizmo_task/view/widgets/reusable_employee_widgets.dart';

import '../../../data/constants.dart';

class EmployeeDetail extends StatefulWidget {
  EmployeeDetail({this.employeeDetails});
  var employeeDetails;
  @override
  State<EmployeeDetail> createState() => _EmployeeDetailState();
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  List checkIns = [];
  bool areCheckInsFetched = false;

  @override
  void initState() {
    super.initState();
    callApis();
  }

  void callApis() async {
    String employeeId = widget.employeeDetails['id'];
    checkIns = await EmployeeModel.getEmployeeCheckIns(employeeId);
    setState((){
      areCheckInsFetched = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Details & Checkins'),
        backgroundColor: Constants.kThemeColor,
      ),
      body: Container(
        height: Constants.height,
        padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.03),
        child: Column(
          children: [
            ReusableText(keyText: 'Name', value: widget.employeeDetails['name'],),
            SizedBox(height: Constants.height * 0.03,),
            ReusableText(keyText: 'Email', value: widget.employeeDetails['email'],),
            SizedBox(height: Constants.height * 0.03,),
            ReusableText(keyText: 'Phone', value: widget.employeeDetails['phone'],),
            SizedBox(height: Constants.height * 0.03,),
            ReusableText(keyText: 'Country', value: widget.employeeDetails['country'],),
            SizedBox(height: Constants.height * 0.03,),
            Container(height: 1, width: Constants.width, color: Colors.grey,),
            SizedBox(height: Constants.height * 0.01,),
            Center(
              child: Text(
                'Checkins:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Constants.width * 0.035
                ),
              ),
            ),
            SizedBox(height: Constants.height * 0.03,),
            areCheckInsFetched == false ?
            Center(child: CircularProgressIndicator()) :
            Expanded(
              child: ListView.builder(
                itemCount: checkIns.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.03),
                    margin: EdgeInsets.only(bottom: Constants.height * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Column(
                      // NOTE: Reusable widgets are used to decrease the lines of code and thereby making it much clearer.
                      children: [
                        ReusableText(keyText: 'Location', value: checkIns[index]['location'],),
                        SizedBox(height: Constants.height * 0.02,),
                        ReusableText(keyText: 'Purpose', value: checkIns[index]['purpose'],),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
