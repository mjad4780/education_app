import '../../../../utility/images_aseets.dart';

class BottomNavigationBarEntity {
  final String activeImage;

  BottomNavigationBarEntity({required this.activeImage});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
        activeImage: Assets.images01home,
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.myCourse,
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.chat,
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.transaction,
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.profile,
      ),
    ];
