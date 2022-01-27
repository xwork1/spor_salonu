import 'package:flutter/material.dart';
import 'package:spor_salonu/screen/istatistik/data/users.dart';
import 'package:spor_salonu/screen/istatistik/model/user.dart';
import 'package:spor_salonu/screen/istatistik/utils.dart';
import 'package:spor_salonu/screen/istatistik/widget/scrollable_widget.dart';
import 'package:spor_salonu/screen/istatistik/widget/text_dialog_widget.dart';

class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  late List<UserTest> users;

  @override
  void initState() {
    super.initState();

    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Bölge Adı', '1.Ay', '2.Ay'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[2];

      return DataColumn(
        label: Text(column),
        numeric: isAge,
      );
    }).toList();
  }

  List<DataRow> getRows(List<UserTest> users) => users.map((UserTest user) {
        final cells = [user.firstName, user.lastName + 'cm', user.age];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0 || index == 1;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    editFirstName(user);
                    break;
                  case 1:
                    editLastName(user);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editFirstName(UserTest editUser) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editUser.firstName,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(firstName: firstName) : user;
        }).toList());
  }

  Future editLastName(UserTest editUser) async {
    final lastName = await showTextDialog(
      context,
      title: 'Change Last Name',
      value: editUser.lastName,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(lastName: lastName) : user;
        }).toList());
  }
}
