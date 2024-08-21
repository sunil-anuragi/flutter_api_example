import '../../../Config/export.dart';

class MovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MoviesdetailsController controller = Get.put(MoviesdetailsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  child: CircularProgressIndicator())
              : Column(
                  children: [
                    // Top Section with Image and Play Button
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(150),
                              bottomRight: Radius.circular(150)),
                          child: Image.network(
                            controller.moviesdetail.first.primaryImage == null
                                ? ""
                                : controller
                                    .moviesdetail.first.primaryImage!.url
                                    .toString(),
                            width: double.infinity,
                            height: 350.h,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Center(child: Text("No image found"));
                            },
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 350.h,
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 20.0,
                          child: Icon(Icons.add,
                              color: MycolorConstants.primarycolor, size: 40),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 20.0,
                          child: Icon(Icons.share,
                              color: MycolorConstants.primarycolor, size: 30.0),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            child: Center(
                              child: Icon(
                                Icons.play_circle_fill,
                                color: MycolorConstants.primarycolor,
                                size: 70.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Title and Rating Section
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            controller
                                .moviesdetail.first.originalTitleText!.text
                                .toString(),
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: Myfont.quicksand),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            controller.moviesdetail.first.releaseYear!.year
                                    .toString() +
                                '| TV-14',
                            style: TextStyle(
                                color: MycolorConstants.blackcolor,
                                fontSize: 18.0,
                                fontFamily: Myfont.quicksand),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Sci-Fi & Fantasy, Mystery, Drama',
                            style: TextStyle(
                                color: MycolorConstants.greycolor,
                                fontFamily: Myfont.quicksand),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '1 Season',
                            style: TextStyle(color: MycolorConstants.greycolor, fontFamily: Myfont.quicksand),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'User Ratings: 85%',
                            style: TextStyle(fontSize: 18.0, fontFamily: Myfont.quicksand),
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            width: 300.w,
                            height: 15.h,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 0.7,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    MycolorConstants.primarycolor),
                                backgroundColor: Color(0xffD6D6D6),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // Overview Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Overview',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: MycolorConstants.primarycolor,
                                 fontFamily: Myfont.quicksand),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Wanda Maximoff and Vision—two super-powered beings living idealized suburban lives—begin to suspect that everything is not as it seems.',
                            style: TextStyle(
                              color: MycolorConstants.blackcolor,
                              fontSize: 16.0,
                               fontFamily: Myfont.quicksand
                            ),
                          ),
                          SizedBox(height: 20.0),

                          // Starring Section
                          Text(
                            'Starring',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: MycolorConstants.primarycolor,
                                 fontFamily: Myfont.quicksand),
                          ),
                          SizedBox(height: 8.0),
                          SizedBox(
                            height: 150.h,
                            child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ActorCard(
                                    name: 'Elizabeth Olsen',
                                    imageUrl:
                                        'https://via.placeholder.com/100');
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // More Details Section
                    SizedBox(height: 15.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.h),
                          Center(
                            child: Text(
                              'More Details',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: MycolorConstants.primarycolor,
                                   fontFamily: Myfont.quicksand),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Divider(
                              thickness: 1, color: MycolorConstants.blackcolor),
                          SizedBox(height: 8.h),
                          GridView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            children: [
                              DetailCard(
                                  title: 'Directed By',
                                  detail: 'Ronald Richards'),
                              DetailCard(
                                  title: 'Produced by',
                                  detail: 'Cameron Williamson'),
                              DetailCard(title: 'Status', detail: 'Released'),
                              DetailCard(
                                  title: 'Original Language',
                                  detail: 'English'),
                              DetailCard(
                                  title: 'Budget', detail: '\$7,000,000'),
                              DetailCard(
                                  title: 'Revenue', detail: '\$70,000,000'),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Divider(
                              thickness: 1, color: MycolorConstants.blackcolor),
                        ],
                      ),
                    ),

                    // Recommendations Section
                    SizedBox(height: 25.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: MycolorConstants.primarycolor,
                                borderRadius: BorderRadius.circular(15.sp)),
                            child: Text(
                              'Recommendations',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: MycolorConstants.whitecolor,
                                  fontFamily: Myfont.quicksand),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          SizedBox(
                            height: 160.h,
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return MovieCard(
                                    imageUrl:
                                        'https://via.placeholder.com/100x180',
                                    title: 'Deadpool');
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
        ),
      ),
    );
  }
}
