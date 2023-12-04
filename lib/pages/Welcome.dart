import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
         body:SizedBox(
           width:double.infinity ,
           height:double.infinity,


             child:Stack( children:[
                     Column(
                       children: [
                        Text("Welcome",textAlign:TextAlign.center ,style:TextStyle(fontSize: 55 , ) ,),
                         Center(
                           child:SvgPicture.asset( "scr/main/res/Icons Assets/chat.svg",
                           alignment:Alignment.center ,),
                         ),
                         SizedBox(
                           height: 22,
                         ),
                         ElevatedButton(
                           onPressed: () {
                             Navigator.pushNamed(context, "/login");
                           },

                           style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all(Colors.purple),
                             padding: MaterialStateProperty.all(
                                 EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                             shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(27))),
                           ),
                           child: Text(
                             "login",
                             style: TextStyle(fontSize: 24),
                           ),
                         ),
                         SizedBox(
                           height: 22,
                         ),

                         ElevatedButton(
                           onPressed: () {
                             Navigator.pushNamed(context, "/signup");
                           },

                           style: ButtonStyle(
                             backgroundColor:
                             MaterialStateProperty.all(Colors.purple[100]),
                             padding: MaterialStateProperty.all(
                                 EdgeInsets.symmetric(horizontal: 77, vertical: 13)),
                             shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(27))),
                           ),
                           child: Text(
                             "SIGNUP",
                             style: TextStyle(fontSize: 17, color: Colors.grey[850]),
                           ),
                         ),

                       ],
                     ),

               
               Positioned(
                   left:0,
                   child:Image.asset("scr/main/res/Image Assets/main_top.png",width: 111,)
               ),
                 Positioned(
                  bottom:0 ,
                    child: Image.asset("scr/main/res/Image Assets/main_bottom.png",width: 150,))

             ],
             ) ,
    )
    )
    );
  }
}
