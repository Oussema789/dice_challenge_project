
import 'package:dicee_challenge_project/resultPage.dart';
import 'package:dicee_challenge_project/welcoming_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hive_flutter/adapters.dart';

import 'info_game.dart';
import 'score.dart';
late Box box;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ScoreAdapter());
  box = await Hive.openBox('score');
  box.put('Score',Score(value: 0));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  final int valeur;
  const DicePage({Key? key, required this.valeur}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int RightDiceNumber =4;
  Score score =   box.get('Score');
  int valeur =  0;


  void ChangeFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      RightDiceNumber = Random().nextInt(6) + 1;
      // if (result.isEmpty){
      //   valeur = 0;
      // }else{
      //   result[result.length-1] = 0;
      //
      // }
    });


      if ((leftDiceNumber == RightDiceNumber) && (leftDiceNumber % 2 == 0)) {
        print("***************");

        score.value = score.value + 3;
        valeur = score.value;
        result.add(valeur);

        Future.delayed(Duration(milliseconds: 100), () {
          showDialog(
            context: context,
            builder: (BuildContext context) {

              if (result.isEmpty){
                valeur = 0;
                print(result);
              }else{
                result[result.length-1] = valeur;
                print(result);
              }
              return Column(
                children: [

                  Expanded(
                    child: AlertDialog(
                      title: Column(
                        children: [
                          Text("+3 points 🪙🪙"),
                          Text("Score:$valeur"),

                        ],
                      ),
                      content: Text('You got a pair number'),
                      actions: [
                        FlatButton(
                          textColor: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('CANCEL'),
                        ),

                      ],
                    ),
                  ),
                ],
              );
            },
          );
        });



      } else {
        if ((leftDiceNumber == RightDiceNumber) && (leftDiceNumber % 2 != 0)) {
          print("***************");
          score.value = score.value - 1;
          valeur = score.value;
          result.add(valeur);
          Future.delayed(Duration(milliseconds: 1000), () {

            showDialog(
              context: context,
              builder: (BuildContext context) {
                if (result.isEmpty){
                  valeur = 0;
                  print(result);
                }else{
                  result[result.length-1] = valeur;
                  print(result);
                  print(valeur);

                }
                return Column(
                  children: [

                    Expanded(
                      child: AlertDialog(
                        title: Column(
                          children: [
                            Text("-1 points 🪙🪙"),
                            Text("Score:$valeur"),
                          ],
                        ),
                        content: Text('You got an impair number'),
                        actions: [
                          FlatButton(
                            textColor: Colors.black,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('CANCEL'),
                          ),

                        ],
                      ),
                    ),
                  ],
                );
              },
            );

          });


        }
      }

  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Score score = box.get('Score');


    return Scaffold(
      backgroundColor: Colors.red,
      // appBar: AppBar(
      //   toolbarHeight: 100,
      //   shadowColor: Colors.black,
      //   backgroundColor: Colors.red,
      //   title: Text('Dicee Challenge',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontFamily: 'Roboto'
      //     ),
      //
      //   ),
      //
      //   actions: [
      //     Image.asset("images/dice-fire.png",),
      //
      //   ],
      // ),
      body: Center(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(

                image: DecorationImage(

                  image: AssetImage(
                    'images/HomePage.png',

                  ),
                  fit: BoxFit.cover,

                ),
              ),

            ),
            SizedBox(
              height: 20,
            ),
            SafeArea(
              child: Container(
                height: size.width*0.1,
                width: size.width*0.6,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(  color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 12,
                      ),
                    ]
                ),
                child: Center(

                  child: Text("Score:  $valeur 💰",style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   child: Text("Score:$valeur",style: TextStyle(
                //     fontSize: 25,
                //     fontFamily: 'Roboto',
                //     fontWeight: FontWeight.bold,
                //   ),
                //   ),
                // ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            //leftDiceNumber = Random().nextInt(6)+1;
                          });
                        },

                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset("images/dice$leftDiceNumber.png"),
                        ),

                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Padding(

                          padding: const EdgeInsets.all(12.0),

                          child: Image.asset("images/dice$RightDiceNumber.png"),
                        ),
                        onPressed: () {
                          //setState(() { RightDiceNumber = Random().nextInt(6)+1; });
                        },

                      ),
                    )
                  ],

                ),
                SizedBox(
                  height: 25,
                ),
                // RaisedButton(
                //   color: Colors.black,
                //   onPressed: (){
                //     ChangeFace();
                //   },
                //
                //   child: Text("Play", style: TextStyle(
                //     color: Colors.white,
                //   ),
                //   ),
                // ),
                GestureDetector(
                  child: Container(
                    height: size.width*0.1,
                    width: size.width*0.2,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                      BoxShadow(  color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 12,
                      ),
                      ]
                    ),
                    child:  Center(
                      child: Text("Play", style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                      ),
                    ),
                  ),
                  onTap: (){
                    ChangeFace();
                  },
                ),
                SizedBox(
                  height: size.height*0.02,
                ),
                // RaisedButton(
                //   child: Text("Check your result"),
                //   onPressed: (){
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => ScorePage(valeur: valeur,),)
                //     );
                //   },
                // ),
                GestureDetector(
                  child: Container(
                    height: size.width*0.1,
                    width: size.width*0.6,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(  color: Colors.black,
                            spreadRadius: 1,
                            blurRadius: 12,
                          ),
                        ]
                    ),
                    child:  Center(
                      child: Text("Check your wealth", style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScorePage(),)
                    );
                  },
                ),









              ],
            ),


          ],
        ),
      ),
      
    );
  }
}

