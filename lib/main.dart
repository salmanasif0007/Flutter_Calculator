import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator '),
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
  String output='0';

  String _output ='';
  double num1=0;
  double num2=0;
  String operation='';


   buttonPressed(String buttonText) {
    if (buttonText == 'Clear'){
       _output='0';
       num1=0;
       num2=0;
       operation='';
    }
    else if (buttonText == '+' ||buttonText == '-' || buttonText == 'x' || buttonText == '/' ){
      num1 = double.parse(output);
      operation=buttonText;
      _output='0';
    }
    else if(buttonText == '='){
      num2= double.parse(output);
      if(operation == '+'){
        _output=(num1 + num2).toString();
      }
       if(operation == '-'){
        _output=(num1 - num2).toString();
      }
      if(operation == 'x'){
        _output=(num1 * num2).toString();
      }
      if(operation == '/'){
        _output=(num1 / num2).toString();
      }

    }
      else{
        _output=_output + buttonText;

    }
      print(_output);
      setState(() {
        output=double.parse(_output).toStringAsFixed(2);
      });
  }

Widget buildButton(String buttonText){
 return Expanded(
    child: RaisedButton(
      padding: EdgeInsets.all(25.0),
      child: Text(buttonText,
      style: TextStyle(fontWeight: FontWeight.w700,
      fontSize: 22.0),
      ),

      onPressed: (){
        buttonPressed(buttonText);
      },
      color: Colors.blueGrey[700],
      textColor: Colors.white,
    ),
  );
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Center(child: Text(widget.title),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: Text(output,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 55.0,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),

            Column(
              children:[
                Row(
                children:[
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
                Row(
                  children:[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('x'),
                  ],
                ),
                Row(
                  children:[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ],
                ),
                Row(
                  children:[
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('.'),
                    buildButton('+'),
                  ],
                ),
                Row(
                  children:[
                    buildButton('Clear'),
                    buildButton('='),
                  ],
                ),
               ],
              ),
          ],
    ),
    )
    );
  }
}



