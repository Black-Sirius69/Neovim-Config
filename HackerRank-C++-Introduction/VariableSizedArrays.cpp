// time-limit: 4000
// problem-url:
// https://www.hackerrank.com/challenges/variable-sized-arrays/problem

#include <ios>
#include <iostream>
#include <vector>

int main() {
  int n, q;
  std::cin >> n;
  std::cin >> q;
  std::vector<std::vector<int>> a(n, std::vector<int>());

  for (int i = 0; i < n; i++) {
    int k;
    std::cin >> k;
    std::vector<int> b(k);

    for (int j = 0; j < k; j++) {
      std::cin >> b[j];
    }
    a[i] = b;
  }

  for (int i = 0; i < q; i++) {
    int x, y;
    std::cin >> x;
    std::cin >> y;
    std::cout << a[x][y] << std::endl;
  }

  return 0;
}
