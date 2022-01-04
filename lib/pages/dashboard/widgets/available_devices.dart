import 'package:cms/constants/style.dart';
import 'package:cms/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

// Example without a datasource
class AvailableDevices extends StatelessWidget {
  const AvailableDevices({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            color: lightGrey.withOpacity(.1),
            blurRadius: 12,
          ),
        ],
        border: Border.all(
          color: lightGrey,
          width: .5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              SizedBox(
                width: 20,
              ),
              CustomText(
                text: "Available Devices",
                color: lightGrey,
                weight: FontWeight.bold,
              ),
            ],
          ),
          DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: const [
              DataColumn2(
                label: Text('SN'),
                size: ColumnSize.L,
              ),
              DataColumn(
                label: Text('Device ID'),
              ),
              DataColumn(
                label: Text('Device Name'),
              ),
              DataColumn(
                label: Text('Location'),
              ),
              DataColumn(
                label: Text('Actions'),
              ),
            ],
            rows: List<DataRow>.generate(
              7,
              (index) => DataRow(
                cells: [
                  const DataCell(CustomText(text: "1")),
                  const DataCell(CustomText(text: "355456789189757")),
                  const DataCell(CustomText(text: "Tablet 1")),
                  // DataCell(
                  //   Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       const Icon(
                  //         Icons.star,
                  //         color: Colors.deepOrange,
                  //         size: 18,
                  //       ),
                  //       const SizedBox(width: 5,),
                  //       CustomText(
                  //         text: "4.$index",
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const DataCell(CustomText(text: "Dar es salaam")),
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: active,
                            //   width: 2,
                            // ),
                            // color: light,
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: const CustomText(
                            text: "Edit",
                            // color: active.withOpacity(.7),
                            color: Colors.white,
                            weight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: active,
                            //   width: 2,
                            // ),
                            // color: light,
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: const CustomText(
                            text: "Delete",
                            // color: active.withOpacity(.7),
                            color: Colors.white,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              )
            ),
          ),
        ],
      ),
    );
  }
}