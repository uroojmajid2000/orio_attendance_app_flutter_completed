part of '../notification_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(children: [
          MyText.h2('Today'),
          const SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => const NotificationTile(),
          ),
        ]),
      ),
    );
  }
}
