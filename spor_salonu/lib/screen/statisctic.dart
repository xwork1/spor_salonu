import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowHeight: 70,
        headingRowHeight: 60,
        rows: List.generate(7, (index) {
          return const DataRow(cells: <DataCell>[
            DataCell(
              Text(
                "Date",
              ),
            ),
            DataCell(
              Text(
                "Test",
              ),
            ),
            DataCell(
              Text(
                "Test",
              ),
            ),
            DataCell(
              Text(
                "Test",
              ),
            ),
            DataCell(
              Text(
                "Test",
              ),
            ),
            DataCell(
              Text(
                "Test",
              ),
            ),
            DataCell(
              Text(
                "Test",
              ),
            ),
          ]);
        }),
        columns: const [
          DataColumn(label: Text("Tarih"),),
          DataColumn(label: Text("1.Ay"),),
          DataColumn(label: Text("2.Ay"),),
          DataColumn(label: Text("3.Ay"),),
          DataColumn(label: Text("4.Ay"),),
          DataColumn(label: Text("5.Ay"),),
          DataColumn(label: Text("6.Ay"),),
        ],
      ),
    );
  }
}
