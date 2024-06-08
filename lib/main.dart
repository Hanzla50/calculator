import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget{
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  Widget calcbutton(String btntext,Color btncolor, Color txtcolor){
    return Container(
      child: ElevatedButton(
        onPressed: (){
          // operations
        },
        child: Text(btntext,
        style: TextStyle(
          fontSize: 35,
          color: txtcolor,
        ),
        ),
        style: ElevatedButton.styleFrom(
          shape:CircleBorder(),
          backgroundColor: btncolor,
          padding: EdgeInsets.all(20),
          //side: BorderSide(color: btncolor)
          
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Calculator"),backgroundColor: Colors.black,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.all(10.0),
                child: Text("0",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white,
                fontSize: 100),
                ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('AC', Colors.grey, Colors.black),
                calcbutton('DEL', Colors.grey, Colors.black),
                calcbutton('%', Colors.grey, Colors.black),
                calcbutton('/', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7', Color.fromARGB(255, 66, 66, 66), Colors.black),
                calcbutton('8', Colors.grey, Colors.black),
                calcbutton('9', Colors.grey, Colors.black),
                calcbutton('x', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Colors.grey, Colors.black),
                calcbutton('5', Colors.grey, Colors.black),
                calcbutton('6', Colors.grey, Colors.black),
                calcbutton('-', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('1', Colors.grey, Colors.black),
                calcbutton('2', Colors.grey, Colors.black),
                calcbutton('3', Colors.grey, Colors.black),
                calcbutton('+', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(34, 20, 128, 20)
                  ),
                  //padding
                  onPressed: (){
                  },
                  child: Text("0", style: TextStyle(fontSize: 35,color: Colors.white),),
                ),
                calcbutton('.', Colors.grey, Colors.black),
                calcbutton('=', Colors.amber, Colors.white),
              ],
            ),


          ],
        ),
        )
    );
  }
}