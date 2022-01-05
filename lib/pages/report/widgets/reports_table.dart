import 'package:cms/constants/style.dart';
import 'package:cms/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

// Example without a datasource
class ReportsTable extends StatelessWidget {
  const ReportsTable({ Key key }) : super(key: key);


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
            label: Text('Total Uptime'),
          ),
          DataColumn(
            label: Text('Daily Average Uptime'),
          ),
        ],
        rows: List<DataRow>.generate(
          4,
          (index) => const DataRow(
            cells: [
              DataCell(CustomText(text: "All Amazon Demo")),
              DataCell(CustomText(text: "1 hours 45 minutes")),
              DataCell(CustomText(text: "17 minutes")),
            ],
          ),
        ),
      ),
    );
  }
}