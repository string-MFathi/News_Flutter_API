import 'package:news_flutter/models/category_models.dart';

List<CategoryModel> getCategory(){
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);


  //2
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1504242425842-802eea352df7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName  = "General";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName  = "Health";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1490818387583-1baba5e638af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=931&q=80";
  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName  = "Science";
  categoryModel.imageUrl =  "https://images.unsplash.com/photo-1575503802870-45de6a6217c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  //6
  categoryModel = CategoryModel();
  categoryModel.categoryName  = "Sports";
  categoryModel.imageUrl =  "https://images.unsplash.com/photo-1423068657086-889315a2eba8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  //7
  categoryModel = CategoryModel();
  categoryModel.categoryName  = "Technology";
  categoryModel.imageUrl =  "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  return category;

}