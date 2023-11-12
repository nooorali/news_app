import 'package:flutter/material.dart';
import 'package:news_app/pages/home/widgets/category_item.dart';
import 'package:news_app/pages/home/widgets/custom_drawer.dart';
import 'package:news_app/pages/home/widgets/news_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/search/search_news.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoryData? selectedCategory;



  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<CategoryData> categories = [
      CategoryData(
        categoryId: "sports",
        categoryTitle: AppLocalizations.of(context)!.sports,
        categoryImage: "assets/images/sports.png",
        categoryBackgroundColor: const Color(0xFFC91C22),
      ),
      CategoryData(
        categoryId: "general",
        categoryTitle: AppLocalizations.of(context)!.politics,
        categoryImage: "assets/images/Politics.png",
        categoryBackgroundColor: const Color(0xFF003E90),
      ),
      CategoryData(
        categoryId: "health",
        categoryTitle: AppLocalizations.of(context)!.health,
        categoryImage: "assets/images/health.png",
        categoryBackgroundColor: const Color(0xFFED1E79),
      ),
      CategoryData(
        categoryId: "business",
        categoryTitle: AppLocalizations.of(context)!.buisness,
        categoryImage: "assets/images/bussines.png",
        categoryBackgroundColor: const Color(0xFFCF7E48),
      ),
      CategoryData(
        categoryId: "enviroment",
        categoryTitle: AppLocalizations.of(context)!.environment,
        categoryImage: "assets/images/environment.png",
        categoryBackgroundColor: const Color(0xFF4882CF),
      ),
      CategoryData(
        categoryId: "science",
        categoryTitle: AppLocalizations.of(context)!.science,
        categoryImage: "assets/images/science.png",
        categoryBackgroundColor: const Color(0xFFF2D352),
      ),
    ];
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            selectedCategory == null
                ? AppLocalizations.of(context)!.news
                : selectedCategory!.categoryTitle,
            style: theme.textTheme.titleLarge,
          ),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: SearchNews());
            }, icon: Icon(Icons.search,size: 30,)),
          ],
        ),
        drawer: CustomDrawer(
          onItemClicked: onCategoryDrawerClicked,
        ),
        body: selectedCategory == null
            ? Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.pick_your_category_of_interest,
                textAlign: TextAlign.start,
                style: theme.textTheme.titleLarge!
                    .copyWith(color: Color(0xFF4F5A69)),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 9 / 11,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => CategoryItem(
                    categoryData: categories[index],
                    index: index,
                    onItemClick: onItemClicked,
                  ),
                  itemCount: categories.length,
                ),
              )
            ],
          ),
        )
            : NewsView(categoryData: selectedCategory!),
      ),
    );
  }

  onItemClicked(CategoryData categoryData) {
    print(categoryData.categoryId);
    selectedCategory = categoryData;
    setState(() {});
  }

  onCategoryDrawerClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}

class CategoryData {
  final String categoryId;
  final String categoryTitle;
  final String categoryImage;
  final Color categoryBackgroundColor;

  const CategoryData({
    required this.categoryId,
    required this.categoryTitle,
    required this.categoryImage,
    required this.categoryBackgroundColor,
  });
}