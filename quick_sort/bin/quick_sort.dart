import 'dart:math';


void main() {
  
  Random rand = Random();
  List<int> myList = List.generate(1000, (_) => rand.nextInt(1000));
  print("Неотсортированный список: $myList");

  int startIndex = 0;
  int endIndex = myList.length - 1;

  List<int> result = quickSort(myList, startIndex, endIndex);

  print("Отсортированный список: $result");
}

List<int> quickSort(List<int> list, int startIndex, int endIndex) {
  if (startIndex < endIndex) {
    int pivot = partition(list, startIndex, endIndex);

    quickSort(list, startIndex, pivot - 1);
    quickSort(list, pivot + 1, endIndex);
  }
  return list;
}

int partition(List<int> list, startIndex, endIndex) {
  // Проверка списка на пустоту
  if (list.isEmpty) {
    return 0;
  }
  // Назначаем последний эдемент в списке в качестве опорного элемента
  int pivot = list[endIndex];

  // Назначаем счетчик i на единицу меньше чем start index
  int i = startIndex - 1;

  for (int j = startIndex; j < endIndex; j++) {
    if (list[j] < pivot) {
      i++;
      swap(list, i, j);
    }
  }
  // перемещаем последний эдемент в списке и ставим его напротив i-го элемента
  swap(list, i + 1, endIndex);
  return i + 1;
}

// Меняем элементы в списке местами через промежуточную переменную
void swap(List<int> list, int i, int j) {
  int temporary = list[i];
  list[i] = list[j];
  list[j] = temporary;
}
