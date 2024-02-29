import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.tuuraButton,
    required this.baskanda,
  });
  final bool tuuraButton;
  final void Function(bool) baskanda;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
            onPressed: () => baskanda(tuuraButton),
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    tuuraButton == true ? Colors.green : Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            child: Text(
              tuuraButton == true ? 'Туура' : 'Туура эмес',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            )),
      ),
    );
  }
}
