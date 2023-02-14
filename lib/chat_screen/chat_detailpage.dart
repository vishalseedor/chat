import 'package:chat_app/chat_screen/chat_message.dart';
import 'package:chat_app/chat_screen/chat_users.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget{
final String chat;
final String image;

  const ChatDetailPage({super.key,required this.chat,required this.image});
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Pablos, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: size.width*0.02),
                CircleAvatar(
                  backgroundImage: AssetImage(widget.image),
                  maxRadius: 25,
                ),
                SizedBox(width: size.width*0.03,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.chat,style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.call,color: Colors.black54,),
                    SizedBox(width:size.width*0.04),
                    Icon(Icons.video_camera_front_sharp,color: Colors.black54,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
         children: <Widget>[
          // ListView.builder(
          //   itemCount: messages.length,
          //   shrinkWrap: true,
          //   padding: EdgeInsets.only(top: 10,bottom: 10),
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index){
          //     // return Container(
          //     //   padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
          //     //   child: Text(messages[index].messageContent),
          //     // );
          //   },
          // ),
        // children: <Widget>[
          Align(
            
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: size.height*0.07,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Row(
                      children: [
                        Container(
                          height:size.height*0.1 ,
                          width:size.width*0.1 ,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(Icons.add, color: Colors.white, size: 20, ),
                        ),
                        SizedBox(width: size.width*0.02,),
                        Icon(Icons.mic),
                      ],
                      
                    ),
                    
                  ),
                  SizedBox(width: size.width*0.03,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: size.width*0.03,),
                  
                  FloatingActionButton(
                    onPressed: (){},
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
                
              ),
            ),
          ),
          ListView.builder(
  itemCount: messages.length,
  shrinkWrap: true,
  padding: EdgeInsets.only(top: 10,bottom: 10),
  physics: NeverScrollableScrollPhysics(),
  itemBuilder: (context, index){
    return Container(
      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
      child: Column(
        children: [
          Align(
            alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
            
            
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
              ),
              
              
              padding:const EdgeInsets.all(16),
              child: Text(messages[index].messageContent, style: TextStyle(fontSize: 13) ),
            ),
          ),
            // Container(
          //   height: size.height*0.02, 
          //   width: size.width*0.09,
            
          //   decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),color: Colors.grey),
          //   child: Center(child: Text('Today',style: TextStyle(color: Colors.white,fontSize: 10),)),
          // )
         
        ],
      ),
      
    );
    
  },
  
),


          
         ],
      ),
     
    );
  }
}