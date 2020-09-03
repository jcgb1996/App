import 'package:our_future/dominio/i_dominio/dom_store_logic.dart';
import 'package:our_future/dominio/models/category_store.dart';

class InfraStoreLogic extends DomStoreLogic {
  InfraStoreLogic();
  @override
  List<CategoryStore> getCartegoria() {
    List<CategoryStore> popularCourseList = <CategoryStore>[
      CategoryStore(
        imagePath: 'assets/design_course/interFace3.png',
        title: 'App Design Course',
        lessonCount: 12,
        money: 25,
        rating: 4.8,
      ),
      CategoryStore(
        imagePath: 'assets/design_course/interFace4.png',
        title: 'Web Design Course',
        lessonCount: 28,
        money: 208,
        rating: 4.9,
      ),
      CategoryStore(
        imagePath: 'assets/design_course/interFace3.png',
        title: 'App Design Course',
        lessonCount: 12,
        money: 25,
        rating: 4.8,
      ),
      CategoryStore(
        imagePath: 'assets/design_course/interFace4.png',
        title: 'Web Design Course',
        lessonCount: 28,
        money: 208,
        rating: 4.9,
      ),
    ];
    return popularCourseList;
  }

  List<CategoryStore> getPopularCartegoria() {
    List<CategoryStore> categoryList = <CategoryStore>[
      CategoryStore(
        imagePath: 'assets/design_course/interFace1.png',
        title: 'User interface Design',
        lessonCount: 24,
        money: 25,
        rating: 4.3,
      ),
      CategoryStore(
        imagePath: 'assets/design_course/interFace2.png',
        title: 'User interface Design',
        lessonCount: 22,
        money: 18,
        rating: 4.6,
      ),
      CategoryStore(
        imagePath: 'assets/design_course/interFace1.png',
        title: 'User interface Design',
        lessonCount: 24,
        money: 25,
        rating: 4.3,
      ),
      CategoryStore(
        imagePath: 'assets/design_course/interFace2.png',
        title: 'User interface Design',
        lessonCount: 22,
        money: 18,
        rating: 4.6,
      ),
    ];
    return categoryList;
  }
}
