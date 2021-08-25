import 'package:flutter/material.dart';

class MYDRAWER extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(20.0),
            // margin: EdgeInsets.all(40.0),
            child: Column(
              children: [
                Container(
                  // padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  height: 100.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(double.infinity),
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                    image: DecorationImage(
                      image: NetworkImage(
                        "data:image/jpeg;base64,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",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text("Aditya Khandelwal"),
                Text("aditya00khandelwal@gmail.com"),
              ],
            ),
          ),
          ListTile(
              title: Text(
                "SERVICES",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.adb_sharp),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MENUABOUT()),
                );
              }),
          ListTile(
            title: Text(
              "WALLET",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.account_balance_wallet_outlined),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "INVITE FRIENDS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.add_circle_outline_rounded),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "LOCATE US",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.add_location_alt_outlined),
            onTap: () {},
          ),
          SizedBox(height: 150.0),
          ListTile(
            title: Center(
              child: Text(
                "@ All Rights Reserved @",
                style: TextStyle(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MENUHOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("this is HOME SSCREEN FROM MENU bar"),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator.pop(context);
        },
        label: Text("back"),
      ),
    );
  }
}

class MENUABOUT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Center(
        child: Text("this is about SCREEN FROM MENU bar"),
      ),
    );
  }
}

class MENULOGOUT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout"),
      ),
      body: Center(child: Text("this is logout SSCREEN FROM MENU bar")),
    );
  }
}
