import '../../../Config/export.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  MovieCard({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.sp),
        child: Image.network(
          imageUrl,
          width: 120.w,
          height: 130.h,
          fit: BoxFit.cover,
        ),
      ),
    ).paddingOnly(right: 10);
  }
}
