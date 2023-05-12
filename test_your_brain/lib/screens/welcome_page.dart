import 'package:flutter/material.dart'; 
import 'package:test_your_brain/screens/start_screen.dart'; 
import 'package:test_your_brain/styles/color.dart'; 
  
 class WelcomePage extends StatelessWidget { 
   //routes for after this page 
   static String routeName = '/welcome-page-screen'; 
   const WelcomePage({super.key}); 
   //focntions 
  
   void nextScreen(BuildContext context) { 
     Navigator.pushNamed(context, StartScreen.routeName); 
   } 
  
   @override 
   Widget build(BuildContext context) { 
     return Scaffold( 
         backgroundColor: MyColors.myColor, 
         body: Column( 
           // mainAxisAlignment: MainAxisAlignment.center, 
           children: [ 
             Container( 
               height: 200, 
               // color: Colors.red, 
             ), 
             SizedBox( 
               height: 100, 
               width: 350, 
               child: Image.asset('images/logo_image.jpg'), 
             ), 
             //space 
             const SizedBox(height: 120), 
             const Text( 
               'Welcome', 
               style: TextStyle( 
                 fontSize: 55, 
                 fontWeight: FontWeight.w400, 
                 color: Colors.white, 
               ), 
             ), 
             const SizedBox(height: 30), 
             ElevatedButton( 
                 onPressed: () => nextScreen(context), 
                 style: ElevatedButton.styleFrom( 
                   backgroundColor: Colors.white, 
                   textStyle: const TextStyle( 
                       // fontSize: 18, 
                       // fontWeight: FontWeight.bold, 
                       ), 
  
                   minimumSize: Size(200, 50), 
  
                 ), 
                 child: const Text( 
                   'Next', 
                   style: TextStyle( 
                     color: MyColors.myColor, 
                     fontSize: 25, 
                     fontWeight: FontWeight.bold, 
                   ), 
                 )), 
           ], 
         )); 
   } 
 }
