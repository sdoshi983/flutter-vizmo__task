import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vizmo_task/data/constants.dart';
import 'package:vizmo_task/providers/main_provider.dart';

class SortEmployeeBottomSheet extends StatefulWidget {
  const SortEmployeeBottomSheet({Key? key}) : super(key: key);

  @override
  State<SortEmployeeBottomSheet> createState() => _SortEmployeeBottomSheetState();
}

class _SortEmployeeBottomSheetState extends State<SortEmployeeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var mainProvider = Provider.of<MainProvider>(context);
    var hash = mainProvider.hash;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.02),
      child: Container(
        height: Constants.height * 0.4,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sort by:',
                style: TextStyle(
                    fontSize: Constants.width * 0.05,
                ),
              ),
              SizedBox(height: Constants.height * 0.04,),
              GestureDetector(
                onTap: (){
                  mainProvider.setSortColumn('name');
                },
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: Constants.width,
                    padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.05, vertical: Constants.height * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: hash.containsKey('sortColumn') && hash['sortColumn'] == 'name' ? Constants.kThemeColor : Colors.grey.withOpacity(0.2))),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: Constants.width * 0.035
                      ),
                    )
                  ),
                ),
              ),
              SizedBox(height: Constants.height * 0.03,),
              GestureDetector(
                onTap: (){
                  mainProvider.setSortColumn('email');
                },
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                      width: Constants.width,
                      padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.05, vertical: Constants.height * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: hash.containsKey('sortColumn') && hash['sortColumn'] == 'email' ? Constants.kThemeColor : Colors.grey.withOpacity(0.2))),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontSize: Constants.width * 0.035
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: Constants.height * 0.07,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      mainProvider.setSortColumn('none');
                      Navigator.pop(context);
                    },
                    child: Container(
                      // height: Constants.height * 0.07,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        width: Constants.width * 0.43,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Constants.kThemeColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: Icon(Icons.cancel, color: Constants.kThemeColor,)),
                            SizedBox(width: Constants.width * 0.03,),
                            Text(
                              'Clear',
                              style: TextStyle(
                                  color: Constants.kThemeColor,
                                  fontFamily: 'bold',
                                  fontSize: 16
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      // height: Constants.height * 0.075,
                        width: Constants.width * 0.43,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),

                        decoration: BoxDecoration(
                          color: Constants.kThemeColor,
                          borderRadius: BorderRadius.circular(8),),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: Icon(Icons.sort, color: Colors.white,)),
                            SizedBox(width: Constants.width * 0.03,),
                            Text(
                              'Sort',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'bold',
                                  fontSize: 16
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
