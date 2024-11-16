import 'package:financial/providers/amount_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_button.dart';
import '../widgets/icon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<AmountProvider>(context).loadAmount();
  }

  @override
  Widget build(BuildContext context) {
    final amount = Provider.of<AmountProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.person),
            SizedBox(
              width: 10,
            ),
            Text("Jean Marko Aguirre")
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My goals"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                "${amount.currentAmount}",
                style: const TextStyle(color: Colors.black),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Movements"),
                GestureDetector(
                    onTap: () => addMovement(context),
                    // onTap: () => amount.increaseAmount(20),
                    child: const Icon(Icons.add_box_rounded))
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const MovementWidget();
                    }))
          ],
        ),
      ),
    );
  }
}

class MovementWidget extends StatelessWidget {
  const MovementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: IconWidget(
        icon: Icons.medical_information,
      ),
      title: Text("Main work"),
      subtitle: Text("June 1st"),
      trailing: Text(
        "+ S/.${3000}",
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.w600, fontSize: 20),
      ),
    );
  }
}

void addMovement(BuildContext context) => showDialog(
    context: context,
    builder: (context) {
      final formKey = GlobalKey<FormState>();
      final movementController = TextEditingController();
      bool isIncome = true;
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            // title: const Text(
            //   "Movements",
            //   textAlign: TextAlign.center,
            // ),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: movementController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Movement's name",
                    ),
                    validator: (value) {
                      return (value == null || value.isEmpty)
                          ? 'Set a name to your movement'
                          : null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: "Income",
                        isActive: isIncome,
                        onPressed: () {
                          setState(() {
                            isIncome = true;
                          });
                        },
                      ),
                      CustomButton(
                        text: "Expenses",
                        isActive: !isIncome,
                        onPressed: () {
                          setState(() {
                            isIncome = false;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "AmountScreen",
                          arguments: movementController.text);
                    }
                  },
                  child: const Text("Continue"))
            ],
          );
        },
      );
    });
