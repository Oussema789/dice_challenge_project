import 'package:dicee_challenge_project/main.dart';
import 'package:flutter/material.dart';


class InfoPage extends StatelessWidget {

  const InfoPage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                 image: AssetImage("images/RulesPage.png"),
                  fit: BoxFit.cover,
                ),
              ),
              ),
            Positioned(
              top: size.height*0.4,
              right: size.width*0.02,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text("Rules:",style: TextStyle(
                      //   fontFamily:'Roboto' ,
                      //   fontWeight: FontWeight.bold ,
                      //   fontSize: 25,
                      //   color: Colors.red,
                      // ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 1,
                              blurRadius: 12,


                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Text("This is a simple game based on probability.\n you pressed the game button.\n If the dices show the same number, you take some points.\n Now if the number is a pair you win 3 points,\n otherwise you pay 1 point.",style: TextStyle(
                              fontFamily:'Roboto' ,
                              fontWeight: FontWeight.bold ,
                              fontSize: 13,
                              color: Colors.black,
                            ),
                              maxLines: 20,
                            ),
                            Text("You can check your score and repeat the game once more. ",style: TextStyle(
                              fontFamily:'Roboto' ,
                              fontWeight: FontWeight.bold ,
                              fontSize: 13,
                              color: Colors.black,
                            ),
                              maxLines: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.09,
                      ),
                      Container(
                        height: size.height*0.3,
                        width:  size.width*0.3,
                        child: GestureDetector(
                          child: Image.asset("images/images.png",color: Colors.red,),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DicePage(valeur: 0,)),
                            );

                          },
                        ),
                      ),
                    ],

                  )
                ],
              ), //CircularAvatar
            ),
            //Positioned

          ],
        ),

      );

  }
}
