import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeChecks extends StatelessWidget {
  final String name;
  final String title;
  final String snackbarTitle;

  const TypeChecks(
      {Key? key,
      required this.name,
      required this.title,
      required this.snackbarTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(title),
          actions: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Não',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offNamed('/');

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(snackbarTitle)));
                        },
                        child: Text(
                          'Sim',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      child: Container(
        height: height * 3,
        width: width * 20,
        decoration: BoxDecoration(
            color: Color(0xff492e8d),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
