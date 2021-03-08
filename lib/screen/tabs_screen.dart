import 'package:flutter/material.dart';
import 'package:flutter_app_widget_test_210301/const.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      ListTile(
        leading: Icon(Icons.local_activity, size: 50),
        title: Text('Activity'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_airport, size: 50),
        title: Text('Airport'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_atm, size: 50),
        title: Text('ATM'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_bar, size: 50),
        title: Text('Bar'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_cafe, size: 50),
        title: Text('Cafe'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_car_wash, size: 50),
        title: Text('Car Wash'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_convenience_store, size: 50),
        title: Text('Convenience Store'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_dining, size: 50),
        title: Text('Dining'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_drink, size: 50),
        title: Text('Drink'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_florist, size: 50),
        title: Text('Florist'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_gas_station, size: 50),
        title: Text('Gas Station'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_grocery_store, size: 50),
        title: Text('Grocery Store'),
        subtitle: Text('Description here'),
      ),
    ];

    return DefaultTabController(
      // initialIndex: 1,
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('DTC TEST'),
            bottom: TabBar(
              tabs: <Widget>[
                Text(
                  '01',
                ),
                Icon(Icons.offline_pin),
                Text(
                  '03',
                  style: TextStyle(fontSize: 18, color: Colors.yellow),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Image.asset('images/sun.png'),
              ),
              Center(
                  child: Center(
                      //https://www.woolha.com/tutorials/flutter-using-listwheelscrollview-widget-examples
                      child: ListWheelScrollView(
                itemExtent: 75,
                children: items,
                magnification: 1.5,
                useMagnifier: true,
                physics: FixedExtentScrollPhysics(),
                diameterRatio: 1.5,
                squeeze: 0.8,
                onSelectedItemChanged: (index) => {},
              ))),
              Center(
                child: Text(
                  'Bla',
                  style: MyTextStyle,
                ),
              )
            ],
          )),
    );
  }

  void myLisView() {
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          color: Colors.deepOrange,
          child: ListTile(
            leading: Icon(Icons.account_balance),
            title: SelectableText(
              'MADÁR az ász',
              toolbarOptions: ToolbarOptions(copy: true, selectAll: true),
            ),
            trailing: Icon(Icons.style),
            subtitle: Text("Tovább a második oldalra"),
            onTap: () {},
          )),
    );
  }
}
