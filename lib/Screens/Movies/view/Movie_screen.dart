import '../../../Config/export.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieController controller = Get.put(MovieController());
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.string(AppConstants.logo),
                        SvgPicture.string(AppConstants.moreicon)
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SearchBar(),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: SingleChildScrollView(
                          controller: controller.scrollController,
                          child: Column(
                            children: [
                              // CarouselSlider
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  viewportFraction: 0.8,
                                ),
                                items: controller.moviesslider.map((image) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.sp),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(),
                                          child: Image.network(
                                            image.primaryImage!.url.toString(),
                                            fit: BoxFit.cover,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return Center(
                                                  child:
                                                      Text("No image found"));
                                            },
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),

                              SizedBox(height: 20.h),

                              // Horizontal ListView.builder
                              Container(
                                height: 250.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 200.w,
                                      child:
                                          MoviesCard(controller.movies[index]),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: 20.h),

                              // GridView.builder
                              GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 2 / 3,
                                ),
                                itemCount:
                                    controller.searchController.text.isEmpty
                                        ? controller.movies.length
                                        : controller.filteredMovies.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return MoviesCard(
                                      controller.searchController.text.isEmpty
                                          ? controller.movies[index]
                                          : controller.filteredMovies[index]);
                                },
                              ),
                              if (controller.searchController.text.isEmpty)
                                !controller.isLoadingMore
                                    ? Center(child: CircularProgressIndicator())
                                    : Container()
                            ],
                          )),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20),
        ),
      ),
    );
  }
}
