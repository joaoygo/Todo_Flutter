import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String text;
  final void Function()? onTapEdit;
  final void Function()? onTapDelete;
  const CardWidget(
      {super.key, required this.text, this.onTapEdit, this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(text),
            Row(
              children: [
                GestureDetector(
                  onTap: onTapEdit,
                  child: const Icon(
                    Icons.edit,
                    size: 30,
                  ),
                ),
                GestureDetector(
                  onTap: onTapDelete,
                  child: const Icon(
                    Icons.cancel_sharp,
                    color: Colors.red,
                    size: 30,
                  ),
                )
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
