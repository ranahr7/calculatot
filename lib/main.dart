import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String data =" ",data2=" ";

  double FirstNumber=0,SecondNumber=0;
  String operator="";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Calculator")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 20.0,right: 20.0,bottom: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
          SizedBox(height: 210.0,),
            Padding(
              padding: const EdgeInsets.only(right: 15.0,bottom: 5.0),
              child: Text(data2,style: TextStyle(fontSize: 16.0,color: Colors.grey,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0,bottom: 5.0),
              child: Text(data,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10.0,),

            Expanded(
              child: Container(
                child: GridView.count(crossAxisCount: 4,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      data=" ";
                      data2=" ";

                    });
              }, child: Text("C",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                ),
                  ElevatedButton(
                    onPressed: () {
                    FirstNumber = double.parse(data);
                    operator="÷";
                    setState(() {
                      data2 = data + " ÷ ";
                      data="";
                    });
                  },
                child: Text("÷",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: () {
                    FirstNumber = double.parse(data);
                    operator="x";
                    setState(() {
                      data2 = data + " X";
                    data="";
                    });
                  }, child: Text("X",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: (){
                  }, child: Text("←",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      data= data+"7";

                    });
                  }, child: Text("7",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      data= data+"8";
                    });
                  }, child: Text("8",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      data= data+"9";

                    });
                  }, child: Text("9",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ), ElevatedButton(onPressed: () {
                      FirstNumber = double.parse(data);
                      operator="-";
                      setState(() {
                        data2 = data + " - ";
                      data="";
                      });
                    },
                      child: Text("-",style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      data= data+"4";

                    });
                  }, child: Text("4",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {

                      data= data+"5";
                    });
                  }, child: Text("5",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      data= data+"6";

                    });
                  }, child: Text("6",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: () {
                    FirstNumber = double.parse(data);
                    operator="+";
                    setState(() {
                      data2 = data + " + ";
                    data="";
                    });
                  }, child: Text("+",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {

                      data= data+"1";
                    });
                  }, child: Text("1",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {

                      data= data+"2";
                    });
                  }, child: Text("2",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      data= data+"3";

                    });
                  }, child: Text("3",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      SecondNumber=double.parse(data);
                      data2="";
                      data = Calculate();
                    });
                  }, child: Text("=",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                  ),
                    ElevatedButton(
                      onPressed: (){
                        data= data+".";
                    }, child: Text(".",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        data= data+"0";

                      });
                    }, child: Text("0",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    ),
                    ElevatedButton(onPressed: (){
                      FirstNumber = double.parse(data);
                      operator ="%";
                      setState(() {
                        data2 = data +"%";
                        data="";
                      });
                    }, child: Text("%",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    ),
                    ElevatedButton(onPressed: (){

                     var temp = int.parse(data);
                      var binary = temp.toRadixString(2);

                      setState(() {
                        data = binary.toString();
                      });
                    }, child: Text("Bin",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                    ),


         ],
                ),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  String Calculate(){
    String result="";
    double temp=0;
    switch(operator){
      case "+":{
       temp= FirstNumber+SecondNumber;

       break;
      }
      case "-":{
        temp= FirstNumber-SecondNumber;

        break;
      }
      case "x":{
        temp= FirstNumber*SecondNumber;

        break;
      }
      case "÷":{
        temp= FirstNumber/SecondNumber;

        break;
      }

      case "%":{
        temp= (FirstNumber/SecondNumber)*100;

        break;
      }

    }
    result = temp.toString();
    return result;
  }

}
