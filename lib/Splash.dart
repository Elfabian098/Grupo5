import 'package:flutter/material.dart';
import 'package:guia5/home.dart';


class MyAppSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePageSplash(),
    );
  }
}

class MyHomePageSplash extends StatefulWidget{
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePageSplash>
{
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome() async
  { await Future.delayed(Duration(milliseconds: 4000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(title: 'Comunidad Conocimiento I+D+I+Sistemas')));

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 320,
              height: 320,
              color: Colors.white,
              child: Image.asset('../assets/logoucv.jpg'),
            ),
          ],
        )
      )
    );
  }
}