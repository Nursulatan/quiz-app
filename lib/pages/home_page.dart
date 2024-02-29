import 'package:flutter/material.dart';
import 'package:sabak8/model/quiz_model.dart';
import 'package:sabak8/widgets/custom_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  List<bool> jooptor = [];
  List<bool> tuuraJooptor = [];
  List<bool> kataJooptor = [];

  void teksher(bool value) {
    if (quizzes[index].answer == value) {
      jooptor.add(true);
      tuuraJooptor.add(true);
    } else {
      jooptor.add(false);
      kataJooptor.add(false);
    }
    setState(() {
      if (quizzes[index] == quizzes.last) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Тест аяктады!!!'),
              content: Text('Суроолордун саны: ${jooptor.length}\n'
                  'Сенин туура жооптордун саны: ${tuuraJooptor.length}\n'
                  'Сенин ката жооптордун саны: ${kataJooptor.length}\n'),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Tести кайра баштоо'),
                  onPressed: () {
                    setState(() {
                      index = 0;
                      jooptor.clear();
                      tuuraJooptor.clear();
                      kataJooptor.clear();
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ],
            );
          },
        );
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.person)],
        title: const Text('7 Tapshyrma'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 70),
              child: Text(
                quizzes[index].question,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            CustomButton(
              tuuraButton: true,
              baskanda: (value) {
                teksher(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              tuuraButton: false,
              baskanda: (value) {
                teksher(value);
              },
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: jooptor.length,
                  itemBuilder: (context, index) {
                    return jooptor[index] == true
                        ? const ResultIcon(tuuraIcon: true)
                        : const ResultIcon(tuuraIcon: false);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ResultIcon extends StatelessWidget {
  const ResultIcon({
    super.key,
    required this.tuuraIcon,
  });
  final bool tuuraIcon;
  @override
  Widget build(BuildContext context) {
    return Icon(
      tuuraIcon == true ? Icons.check : Icons.close,
      size: 40,
      color: tuuraIcon == true ? Colors.green : Colors.red,
    );
  }
}
