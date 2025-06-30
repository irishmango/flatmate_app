import 'package:flatmate_app/messages/toggle_switch.dart';
import 'package:flutter/material.dart';

class MessagesScreenWidget extends StatefulWidget {
  const MessagesScreenWidget({super.key});

  @override
  State<MessagesScreenWidget> createState() => _MessagesScreenWidgetState();
}

class _MessagesScreenWidgetState extends State<MessagesScreenWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 120),
                    child: ToggleSwitch(
                      onChanged: (_) {},
                    ),
                  ),
                  SizedBox()
                ],
              );
            },
          ),
        ),
        ...List.generate(8, (index) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 10, 134, 43),
                    ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User $index",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Last message snippet..."),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Color.fromARGB(255, 10, 134, 43),
                    foregroundColor: Colors.white,
                    child: Text("2", style: TextStyle(fontSize: 12)),
                  )
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}