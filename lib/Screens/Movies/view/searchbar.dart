import '../../../Config/export.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MovieController controller = Get.put(MovieController());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search, color: Colors.grey),
          Expanded(
            child: TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle:TextStyle( fontFamily: Myfont.quicksand),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.mic, color: Colors.grey),
            onPressed: () {
              // Handle mic icon press
            },
          ),
        ],
      ),
    );
  }
}
