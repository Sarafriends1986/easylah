
class MyDataOperations{


  //Home Page all list
  listItemForEach(List myList) {
    //print(myList.length);
    myList.forEach((element) {

      print(element);
    });
  }
  //Home Page sorted list
  List  sortItemForEach(List myList, String mySort) {
    List newSortedItemList  = [{"uid_name": "Dummy",
      "prod_name": "Dummy",
      "prod_desc": "Dinner",
      "uid_location": "Bishan",
      "prod_price": "25.00",
      "prod_picture": "images/products/food1.jpg",}];

   newSortedItemList.clear();
    myList.forEach((element) {
      if (element['uid_name']
          .toString()
          .trim()
          .toLowerCase()
          .contains(mySort.trim().toLowerCase()) ||
          element['prod_name']
              .toString()
              .trim()
              .toLowerCase()
              .contains(mySort.trim().toLowerCase()) ||
          element['prod_desc']
              .toString()
              .trim()
              .toLowerCase()
              .contains(mySort.trim().toLowerCase())) {

        print(element);
        newSortedItemList.add(element);
      }
    });

    return newSortedItemList;
  }

  // User page All LIST
  List listUserItemForEach(List myList , String loginUser) {
    List  newUserItemList = [{"uid_name": "Dummy",
      "prod_name": "Dummy",
      "prod_desc": "Dinner",
      "uid_location": "Bishan",
      "prod_price": "25.00",
      "prod_picture": "images/products/food1.jpg",}];
    newUserItemList.clear();
    //print(myList.length);
    myList.forEach((element) {
      if(element['uid_name']
          .toString()
          .trim()
          .toLowerCase()
          .contains(loginUser.trim().toLowerCase())){
        newUserItemList.add(element);
      }


    });
    return newUserItemList;
  }
// User page  and search sorted  LIST
  List  sortUserItemForEach(List myList, String mySort) {
    List  newSortedUserItemList = [{"uid_name": "Dummy",
      "prod_name": "Dummy",
      "prod_desc": "Dinner",
      "uid_location": "Bishan",
      "prod_price": "25.00",
      "prod_picture": "images/products/food1.jpg",}];
    newSortedUserItemList.clear();
    myList.forEach((element) {
      if (element['uid_name']
          .toString()
          .trim()
          .toLowerCase()
          .contains(mySort.trim().toLowerCase()) ||
          element['prod_name']
              .toString()
              .trim()
              .toLowerCase()
              .contains(mySort.trim().toLowerCase()) ||
          element['prod_desc']
              .toString()
              .trim()
              .toLowerCase()
              .contains(mySort.trim().toLowerCase())) {

        print(element);
        newSortedUserItemList.add(element);
      }
    });
    print('inside sort user ');
    print(myList.toString());
    print(mySort);
    print(newSortedUserItemList.toString());

    return newSortedUserItemList;
  }

  // ExcludeUser page All LIST
  List listExcludeUserItemForEach(List myList , String loginUser) {
    List  newExcludeUserItemList = [{"uid_name": "Dummy",
      "prod_name": "Dummy",
      "prod_desc": "Dinner",
      "uid_location": "Bishan",
      "prod_price": "25.00",
      "prod_picture": "images/products/food1.jpg",}];
    newExcludeUserItemList.clear();
    //print(myList.length);
    myList.forEach((element) {
      if(element['uid_name']
          .toString()
          .trim()
          .toLowerCase()
          .contains(loginUser.trim().toLowerCase())) {

      }else{
        newExcludeUserItemList.add(element);
      }


    });
    return newExcludeUserItemList;
  }
// ExcludeUser page and search sorted  LIST
  List  sortExcludeUserItemForEach(List myList, String mySort) {
    List  newExcludeSortedUserItemList = [{"uid_name": "Dummy",
      "prod_name": "Dummy",
      "prod_desc": "Dinner",
      "uid_location": "Bishan",
      "prod_price": "25.00",
      "prod_picture": "images/products/food1.jpg",}];
    newExcludeSortedUserItemList.clear();
    myList.forEach((element) {
      if (element['uid_name']
          .toString()
          .trim()
          .toLowerCase()
          .contains(mySort.trim().toLowerCase()) ||
          element['prod_name']
              .toString()
              .trim()
              .toLowerCase()
              .contains(mySort.trim().toLowerCase()) ||
          element['prod_desc']
              .toString()
              .trim()
              .toLowerCase()
              .contains(mySort.trim().toLowerCase())) {


      }else{
        //print(element);
        newExcludeSortedUserItemList.add(element);
      }
    });
//    print('inside sort user ');
//    print(myList.toString());
//    print(mySort);
//    print(newExcludeSortedUserItemList.toString());

    return newExcludeSortedUserItemList;
  }


}