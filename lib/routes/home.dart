import 'package:my_app/data/shared.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/action_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Actions'),
    );
    var availHeight = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              height: availHeight * 0.2 <= 125 ? availHeight * 0.2 : 125,
              child: ActionCard(
                'Remote Device Controller',
                subTitle: 'NodeMCU ESP8266 Server at ${SharedData.ip}',
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: availHeight * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionCard('LED #1',
                        isClickable: true,
                        id: 1,
                        icon: SharedData.status.led1 == 1 ? Icons.power : Icons.power_off),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        'Engineered with ❤️ by Abhijith, Emmanuel, Jiss and Joel',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
