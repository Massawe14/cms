import 'package:cms/constants/style.dart';
import 'package:cms/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

// Example without a datasource
class DisplayTable extends StatelessWidget {
  const DisplayTable({ Key key }) : super(key: key);


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
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        columns: const [
          DataColumn2(
            label: Text('Display Name'),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text('Current Schedule'),
          ),
          DataColumn(
            label: Text('Last Seen Online'),
          ),
          DataColumn(
            label: Text('Current Status'),
          ),
          DataColumn(
            label: Text('Network Status'),
          ),
        ],
        rows: List<DataRow>.generate(
          7,
          (index) => const DataRow(
            cells: [
              DataCell(CustomText(text: "test scheme")),
              DataCell(CustomText(text: "No Schedule", color: Colors.red)),
              DataCell(CustomText(text: "09 Dec 2022 03:11PM")),
              DataCell(Icon(Icons.check, color: Colors.green)),
              DataCell(CustomText(text: "Ok", color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}