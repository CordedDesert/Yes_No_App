import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier{

final ScrollController chatScrollControler = ScrollController();
final GetYesNoANswer getYesNoANswer = GetYesNoANswer();

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
     Message(text: 'Estas bien bro?', fromWho: FromWho.me)
  ];

  Future <void> sendMessage (String text) async {

    if(text.isEmpty) return;
    
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')){
       herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply () async {
    final herMessage = await getYesNoANswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  //se crea el scroll
  Future<void> moveScrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollControler.animateTo(
      chatScrollControler.position.maxScrollExtent,
       duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

}