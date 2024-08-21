import '../../../Config/export.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final String detail;

  DetailCard({required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: MycolorConstants.primarycolor,
              fontWeight: FontWeight.bold,
              fontFamily: Myfont.quicksand),
        ),
        SizedBox(height: 4.0),
        Text(detail,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: Myfont.quicksand)),
      ],
    );
  }
}
