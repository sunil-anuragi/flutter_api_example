
import '../../../Config/export.dart';

class ActorCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  ActorCard({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 125.w,
              height: 115.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.0),
          Text(name, style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              
                                 fontFamily: Myfont.quicksand)),
        ],
      ),
    );
  }
}

