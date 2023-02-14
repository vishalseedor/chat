import 'package:chat_app/chat_screen/chat_users.dart';
import 'package:chat_app/chat_screen/conversationList.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
   final TextEditingController searchcontroller=TextEditingController();
 
  List<ChatUsers>chatUsers=[
    
    ChatUsers(text:'Kishore', secondaryText:"Awesome Setup", image:'assets/one.png', time:"10.00am"),
      ChatUsers(text:'Sushalt', secondaryText: "That's Great", image:'assets/two.png', time:"1.30am"),
      ChatUsers(text:'Bruno', secondaryText: "Hey where are you?", image:'assets/three.png', time:"31 Mar"),
      ChatUsers(text:'Aswin', secondaryText: "Busy! Call me in 20 mins", image:'assets/four.png', time: "28 Mar"),
      ChatUsers(text:'Shajin', secondaryText:"Thankyou, It's awesome", image:'assets/five.png', time:"23 Mar"),
      ChatUsers(text:'Micheal', secondaryText: "will update you in evening", image:'assets/six.png', time:"17 Mar"),
      ChatUsers(text:'Suresh', secondaryText:"Can you please share the file?", image:'assets/one.png', time:"24 Feb"),
      ChatUsers(text:'Ramesh', secondaryText: "How are you?", image:'assets/two.png', time:"18 Feb"),
      ChatUsers(text:'Dani', secondaryText:  "Hey where are you?", image:'assets/five.png', time:"18 Feb"),
      ChatUsers(text:'Sharma', secondaryText: "Busy! Call me in 20 mins", image:'assets/four.png', time:"18 Feb"),
      ChatUsers(text:'Dhoni', secondaryText: "Can you please share the file?", image:'assets/one.png', time:"18 Feb"),
      ChatUsers(text:'Kholi', secondaryText: "Hey where are you?", image:'assets/two.png', time:"18 Feb"),
      ChatUsers(text:'Pablo', secondaryText: "will update you in evening", image:'assets/six.png', time:"18 Feb"),
      ChatUsers(text:'Sachin', secondaryText: "Busy! Call me in 20 mins", image:'assets/three.png', time:"18 Feb"),

      
        ]; 
      


      
        @override
        void initState() {
                void search(String query){
          final suggestions=chatUsers.where((chat){
            final chatDrop=chat.text.toLowerCase();
            final input=query.toLowerCase();
             return chatDrop.contains(input);
          }).toList();
          setState(() {
            chatUsers=suggestions;
          });
        }
        
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
 
   void search(String query){
          final suggestions=chatUsers.where((chat){
            final chatDrop=chat.text.toLowerCase();
            final input=query.toLowerCase();
             return chatDrop.contains(input);
          }).toList();
          setState(() {
            chatUsers=suggestions;
          });
        }
    return Scaffold(
        body:SingleChildScrollView( 
          physics:const BouncingScrollPhysics(),
          child: Container(
            color: Colors.green[50],
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Chats",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      Container(
                        padding: const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                        height: size.height*0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey,
                        ),
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.camera_enhance,color: Colors.white,size: 25,),
                            const SizedBox(width: 2,),
                            //Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            // CircleAvatar(
                            //   backgroundColor: Colors.grey,
                            //   backgroundImage: AssetImage('assets/one.png'),
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
          padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
          child: 
          TextField(
            textInputAction: TextInputAction.search,
            controller: searchcontroller,
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.grey.shade700),
              prefixIcon: Icon(Icons.search,color: Colors.grey.shade700, size: 20,),
              suffixIcon: Icon(Icons.close,color: Colors.grey.shade700,size: 20,
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding:const EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                color: Colors.grey.shade100
            )
              ),
            ),
           onChanged: search
   
          ),
          
        ),
        
        
        Container(
          height:size.height*0.8,
          child:   ListView.builder(
          
            itemCount:chatUsers.length,
          
        
          
            padding:const EdgeInsets.only(top: 16),
          
        
          
            itemBuilder: (context, index){
          
              return ConversationList(
          
          name:chatUsers[index].text,
          
          messageText:chatUsers[index].secondaryText,
          
          imageUrl:chatUsers[index].image,
          
          time:chatUsers[index].time,
          
          isMessageRead: (index == 0 || index == 3)?true:false,

          
          
              );
          
            },
            
          
          ),
        

        ),
        
            ],
          ),
              ),
        ),
        
   
    );
    
    
  
  }
  
}