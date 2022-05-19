import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vizmo_task/data/constants.dart';
import 'package:vizmo_task/models/employee_model.dart';
import 'package:vizmo_task/view/screens/employees/employee_detail.dart';
import 'package:vizmo_task/view/widgets/reusable_employee_widgets.dart';

class EmployeesList extends StatefulWidget {
  @override
  State<EmployeesList> createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  static const _limit = 10;   // indicates the number of records that will be fetched in an api call
  int page = 1;   // value of the page of pagination

  final PagingController _pagingController = PagingController(firstPageKey: 1);   // controller for pagination

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {   // adding listener which will be called every time new items are needed.
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await EmployeeModel.getEmployeesList(page, _limit);
      final isLastPage = newItems.length < _limit;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        page++;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Employees'),
        backgroundColor: Constants.kThemeColor,
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        padding: EdgeInsets.only(left: Constants.width * 0.03, right: Constants.width * 0.03, top: Constants.height * 0.02),
        child: PagedListView(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index){
              var employeeDetails = item as Map;
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/EmployeeDetail', arguments: EmployeeDetail(employeeDetails: employeeDetails,));
                    },
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.02),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey.withOpacity(0.2))
                        ),
                        child: Row(
                          children: [
                            Image.network(employeeDetails['avatar'], width: Constants.width * 0.12, height: Constants.height * 0.08, fit: BoxFit.fill,),
                            SizedBox(width: Constants.width * 0.05,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // NOTE: Reusable widgets are used to decrease the lines of code and thereby making it much clearer.
                              children: [
                                ReusableEmployeeDetailText(icon: Icons.person, text: employeeDetails['name'],),
                                SizedBox(height: Constants.height * 0.01,),
                                ReusableEmployeeDetailText(icon: Icons.email, text: employeeDetails['email'],),
                                SizedBox(height: Constants.height * 0.01,),
                                ReusableEmployeeDetailText(icon: Icons.phone, text: employeeDetails['phone'],)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Constants.height * 0.02,),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
