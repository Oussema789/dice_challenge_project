
import 'package:dicee_challenge_project/main.dart';
import 'package:dicee_challenge_project/score.dart';
import 'package:dicee_challenge_project/welcoming_page.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform, exit;
import 'package:flutter/services.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key, }) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int sum =0;
  Score score =   box.get('Score');


  @override
  Widget build(BuildContext context) {

    if (result.isEmpty){
      sum=0;
    }else{
      sum = result[result.length-1];
    }
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.red,

      body:   Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(

              image: DecorationImage(

                image: AssetImage(
                  'images/ResultPage.png',

                ),
                fit: BoxFit.cover,

              ),
            ),

          ),

          Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 300 ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 15,
                      ),
                    ]
                  ),

                  child: Center(
                    child: Text("Your wealth : $sum 🪙🪙",style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(


                    child: Center(
                      child: Image.asset("images/repeat.png",scale: 5,
                        color: Colors.red,),
                    ),

                  onTap: (){

                      if (result.isEmpty){
                        sum=0;
                      }else{
                       score.value =0;
                        result.length =0;
                        print(result);

                      }


                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  HomePage()),
                    );
                  },
                ),
                SizedBox(
                  height: size.height*0.2,
                ),

                GestureDetector(

                    onTap: () {
                      // if (Platform.isAndroid) {
                      //   SystemNavigator.pop();
                      // }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            children: [

                              Expanded(
                                child: AlertDialog(
                                  title: Column(
                                    children: [
                                      Text("Are you sure?"),
                                    ],
                                  ),
                                  content: Text('Do you want to exit from the application?'),
                                  actions: [
                                    FlatButton(
                                      textColor: Colors.black,
                                      onPressed: () {
                                        if (Platform.isAndroid) {
                                          SystemNavigator.pop();
                                        }
                                      },
                                      child: Text('Exit'),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: size.height*0.1,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            color: Colors.black,
                            blurRadius: 10,
                          )
                        ]
                      ),
                      child: Row(

                        children: [
                          Icon(Icons.login_outlined,size: 30,),
                          SizedBox(
                            width: 25,
                          ),
                          Text("close app",style: TextStyle(
                            fontSize: 25,
                          ),
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),

          ),

        ],
      ),
    );
  }
}


