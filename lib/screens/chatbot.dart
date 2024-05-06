import 'package:flutter/material.dart';
import 'package:healthcare/screens/color.dart';

class ChatBotWidget extends StatefulWidget {
  @override
  _ChatBotWidgetState createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
  List<String> chatMessages = [];
  TextEditingController _textEditingController = TextEditingController();

  void addMessage(String message) {
    setState(() {
      String botResponse = generateBotResponse(message);
      chatMessages.insert(0, 'Bot: $botResponse'); // Add bot response to the top
      chatMessages.insert(0, 'You: $message'); // Add user message to the top
      _textEditingController.clear();
    });
  }

  String generateBotResponse(String message) {
    if (message.toLowerCase().contains('hello')) {
      return 'Hello! How can I assist you today?';
    } else if (message.toLowerCase().contains('help')) {
      return 'Sure! What do you need help with?';
    } else {
      return "I'm sorry, I can't understand that.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Set your desired border radius
      child: Container(
        color: blue, // Set your desired color here
        child: Column(
          children: [
            _buildInputField(), // Move the text field to the top
            Expanded(
              child: chatMessages.isEmpty
                  ? Center(child: Text('AI Bot', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))
                  : ListView.builder(
                      itemCount: chatMessages.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            chatMessages[index],
                            style: TextStyle(
                              color: Colors.white, // Adjust text color
                              fontWeight: chatMessages[index].startsWith('You') || chatMessages[index].startsWith('Bot') ? FontWeight.bold : FontWeight.normal, // Bold for 'You' and 'Bot'
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  addMessage(value);
                }
              },
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.white), // Adjust hint text color
              ),
              style: TextStyle(color: Colors.white), // Adjust input text color
            ),
          ),
          IconButton(
            icon: Icon(Icons.expand_circle_down, color: Colors.white), // Set send icon color to white
            onPressed: () {
              String message = _textEditingController.text.trim();
              if (message.isNotEmpty) {
                addMessage(message);
              }
            },
          ),
        ],
      ),
    );
  }
}
