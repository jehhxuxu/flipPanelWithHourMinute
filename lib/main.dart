import 'package:flutter/material.dart';
import 'package:flip_panel/flip_panel.dart';

import 'fileBloc.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flip Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = FileBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<Espera>(
            stream: bloc.getPeriodicStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlipPanel.builder(
                      itemBuilder: (context, index) => Container(
                        alignment: Alignment.center,
                        width: 150.0,
                        height: 128.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Text(
                          '${snapshot.data.hora}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80.0,
                              color: Colors.yellow),
                        ),
                      ),
                      itemsCount: 24,
                      period: Duration(minutes: 1),
                      loop: -1,
                    ),
                    FlipPanel.builder(
                      itemBuilder: (context, index) => Container(
                        alignment: Alignment.center,
                        width: 196.0,
                        height: 128.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Text(
                          '${snapshot.data.minuto}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80.0,
                              color: Colors.yellow),
                        ),
                      ),
                      itemsCount: 60,
                      period: Duration(minutes: 1),
                      loop: -1,
                    ),
                  ],
                );
              }
              return Container();
            }),
      ),
    );
  }
}
