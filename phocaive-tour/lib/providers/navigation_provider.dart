import 'package:flutter_riverpod/flutter_riverpod.dart';

// 선택된 탭 인덱스 상태 관리
final selectedIndexProvider = StateProvider<int>((ref) => 0);

// 탭 변경 로직
class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);

  void changeTab(int index) {
    if (index >= 0 && index < 5) {
      state = index;
    }
  }
}

final navigationProvider = StateNotifierProvider<NavigationNotifier, int>((ref) {
  return NavigationNotifier();
});