
import 'package:dicee_challenge_project/info_game.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      body:  Stack(

          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(

                image: DecorationImage(

                  image: AssetImage(
                    'images/welcoming.png',

                  ),
                  fit: BoxFit.cover,

                ),
              ),

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                          child: GestureDetector(
                            child: Image.asset("images/button.gif"),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InfoPage()),
                              );

                            },
                          ),
                        ),
              ],
            ),




          ],
        ),

    );
  }
}
