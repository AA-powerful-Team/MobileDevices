import 'package:flutter/material.dart';



class MainUserScreen extends StatelessWidget{

@override
Widget build(BuildContext context){

return Scaffold(
  body: Column(
    children: [
      Expanded(flex: 1,child: Container(
        color: Colors.brown[50],
      ) 
      ),
     Container(
        alignment: Alignment.bottomCenter,
        width: 100,
        height: 200,
         )
      
    ],
),
); 


}


}