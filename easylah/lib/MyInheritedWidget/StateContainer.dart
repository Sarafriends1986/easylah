import 'package:easylah/Models/User.dart';
import 'package:easylah/UserPostAds/ModelCatergory.dart';
import 'package:flutter/material.dart';



class StateContainer extends StatefulWidget {
  final Widget child;
  final ModelCategory modelCategory;
  final User user;

  StateContainer({@required this.child, this.modelCategory,this.user});

  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InheritedStateContainer)
    as InheritedStateContainer)
        .data;
  }

  @override
  StateContainerState createState() => new StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  ModelCategory modelCategory;

  void updateUser({mname,sname}) {
    if (modelCategory == null) {
      modelCategory = new ModelCategory(fnMainCategory: mname ,fnSubCategory: sname);
      setState(() {
        modelCategory = modelCategory;
      });
    } else {
      setState(() {
        modelCategory.fnMainCategory = mname ?? modelCategory.fnMainCategory;
        modelCategory.fnSubCategory = sname ?? modelCategory.fnSubCategory;
      });
    }
  }

  User user;

  void updateMyUser({uid,email}) {
    if (user == null) {
      user = new User(uid: uid ,email: email);
//      setState(() {
//        user = user;
//      });
    } else {
//      setState(() {
//        user.uid = uid ?? user.uid;
//        user.email = email ?? user.email;
//      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;
  InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}