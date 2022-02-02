import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Muhammed Altay'),
            accountEmail: const Text('muaybilisim@gmail.com'),
            currentAccountPicture: Image.network(
                'https://muaybilisim.com/wp-content/uploads/2021/02/logo-dark-yellow.png'),
            otherAccountsPictures: const <Widget>[],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    debugPrint('asdsad');
                  },
                  splashColor: Colors.cyan,
                  child: const ListTile(
                    leading: Icon(Icons.payment_outlined),
                    title: Text('Ödemelerim'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.work),
                  title: Text('Hizmet Profilim'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.list),
                  title: Text('Hizmet Listesi'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Çıkış'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
