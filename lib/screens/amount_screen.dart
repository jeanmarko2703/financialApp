import 'package:financial/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class AmountScreen extends StatelessWidget {
  const AmountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Work"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "3,000",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 50),
                    ),
                    Text("SOL",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 50,
                            color: Colors.white.withOpacity(0.5)))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Your savings S/. 45,000")
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                IconWidget(icon: Icons.local_post_office),
                SizedBox(
                  width: 10,
                ),
                Text("Icon"),
                Spacer(),
                Text("Income"),
                SizedBox(
                  width: 10,
                ),
                Text("Expenses")
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white.withOpacity(0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text("1"), Text("2"), Text("3")],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text("4"), Text("5"), Text("6")],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text("7"), Text("8"), Text("9")],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text(" "), Text("0"), Icon(Icons.backspace)],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
