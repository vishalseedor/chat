import 'package:chat_app/chat_screen/chat_detailpage.dart';
import 'package:chat_app/chat_screen/chat_users.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatefulWidget{
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList({required this.name,required this.messageText,required this.imageUrl,required this.time,required this.isMessageRead});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(width:size.width*0.05),
                  Expanded(
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                 return ChatDetailPage(chat: widget.name,image: widget.imageUrl,);
                 }));
                        

                      }),
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.name, style: TextStyle(fontSize: 16),),
                            SizedBox(height:size.height*0.01),
                            Text(widget.messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.green,
                  child: Text('2',style:TextStyle(color: Colors.white,fontSize: 9,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: size.height*0.01,),
                Text(widget.time,style: TextStyle(fontSize: 10,fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}