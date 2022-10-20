import 'package:my_app/data/shared.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/action_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                'NodeMCU ESP8266',
                '',
                subTitle: 'IP: ${SharedData.ip}',
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: availHeight * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ActionCard('Create File', 'Create', icon: Icons.add),
                    const ActionCard('Edit File', 'Edit', icon: Icons.edit),
                    const ActionCard('View File', 'View',
                        icon: Icons.remove_red_eye),
                    const ActionCard('Delete File', 'Delete',
                        icon: Icons.delete_forever),
                    const ActionCard('Raw Command', 'Execute',
                        icon: Icons.admin_panel_settings),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: Text(
                        'ESP8266 Server at ${SharedData.ip}',
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
