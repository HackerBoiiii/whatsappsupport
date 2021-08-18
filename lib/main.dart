import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wahtsapp Support',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Whatsapp Support'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// ...somewhere in your Flutter app...
  Future<dynamic> launchWhatsApp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await launch(url) ? launch(url) : print('cant open whatsapp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'lib/assets/whatsapp.png',
                height: 350,
                width: 350,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                onPressed: () {
                  launchWhatsApp(message: 'hello', number: '+918755964418');
                  setState(() {

                  });
                },
                child: Text(
                  'Click Here to Whatsapp Support',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
