import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool notValidInput = false;
  final ipController = TextEditingController(text: '192.168.1.207');

  void _validateAddress() async {
    String ip = ipController.text;

    if (ip.isEmpty || ip.contains(RegExp(r'[A-Za-z]'))) {
    } else {
      /*
      connection = Connection(ip, port, id);
      SocketClient socket = SocketClient(connection!);
      SharedData.soc = socket;
      await socket.connect() ? _watchState(isConnected: true) : _watchState();
      */
    }
  }

  void _watchState({
    bool isConnected = false,
  }) {
    notValidInput = false;
    if (isConnected) {
      Navigator.pushNamed(context, '/home');
    } else if (notValidInput == false) {
      setState(() {
        notValidInput = true;
      });
    }
  }

  @override
  void initState() {
    setState(() {
      notValidInput = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Client Side App'),
    );
    var availHeight = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: availHeight,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Establish Connection',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'IP Address',
                  errorText: (notValidInput ? 'Invalid/Timeout' : null),
                ),
                controller: ipController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  _validateAddress();
                },
                child: const Text(
                  'Connect',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
