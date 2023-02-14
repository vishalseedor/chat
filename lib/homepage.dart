import 'package:chat_app/chat_screen/call_screen.dart';
import 'package:chat_app/chat_screen/chat_page.dart';
import 'package:chat_app/chat_screen/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int  _selectedindex=0;
  

 
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body:
        
        ChatPage(),
        
         bottomNavigationBar: BottomNavigationBar(
        
          
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey.shade600,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Chats',
              
             // title: Text("Chats"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_work),
              label: 'Channels'
              //title: Text("Channels"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profile'
             // title: Text("Profile"),
            ),
            
          ],
        
            
          
        ),
    
      ),
    );
    
  }
}