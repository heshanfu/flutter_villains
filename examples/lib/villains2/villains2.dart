import 'package:flutter/material.dart';
import 'package:flutter_villains/villains2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [VillainTransitionObserver()],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (c) {
                return MyHomePage2();
              }));
            },
            child: Text("Next page"),
          ),
        ));
  }
}

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key}) : super(key: key);

  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> with SingleTickerProviderStateMixin{


  VillainController controller;


  @override
  void initState() {
    super.initState();
    controller = new VillainController(sync: this);

    controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultVillainController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Page 2"),
        ),
        body: Column(
          children: <Widget>[
            Text("from the side"),
            Villain(
              controller: controller,
              villainAnimation: VillainAnimation.fadeIn,
              child: Villain(
                  villainAnimation: VillainAnimation.fromLeftToRight
                    ..to = Duration(milliseconds: 600),
                  child: Text("from below")),
            ),
            RaisedButton(onPressed: (){
           //   VillainController.playAllVillains(context);
            }, child: Text("Play villain animations"),),
          ],
        ),
      ),
    );
  }

}
