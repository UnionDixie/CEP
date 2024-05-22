#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;

int main() {
    int N, M;
    cin >> N >> M;

    vector<string> grid(N);
    for (int i = 0; i < N; ++i) {
        cin >> grid[i];
    }

    vector<vector<int>> up(N, vector<int>(M, 0));
    vector<vector<int>> down(N, vector<int>(M, 0));
    vector<vector<int>> left(N, vector<int>(M, 0));
    vector<vector<int>> right(N, vector<int>(M, 0));

    // Calculate upward white cell spans
    for (int j = 0; j < M; j++) {
        for (int i = 0; i < N; i++) {
            if (grid[i][j] == '1') {
                up[i][j] = (i == 0) ? 1 : up[i - 1][j] + 1;
            }
        }
    }

    // Calculate downward white cell spans
    for (int j = 0; j < M; j++) {
        for (int i = N - 1; i >= 0; i--) {
            if (grid[i][j] == '1') {
                down[i][j] = (i == N - 1) ? 1 : down[i + 1][j] + 1;
            }
        }
    }

    // Calculate leftward white cell spans
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            if (grid[i][j] == '1') {
                left[i][j] = (j == 0) ? 1 : left[i][j - 1] + 1;
            }
        }
    }

    // Calculate rightward white cell spans
    for (int i = 0; i < N; i++) {
        for (int j = M - 1; j >= 0; j--) {
            if (grid[i][j] == '1') {
                right[i][j] = (j == M - 1) ? 1 : right[i][j + 1] + 1;
            }
        }
    }

    int max_t_size = 0;

    // Find the maximum 'T'
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            if (grid[i][j] == '1') {
                // Consider each direction as a stem of 'T'
                vector<int> verticals = { up[i][j], down[i][j] };
                vector<int> horizontals = { left[i][j], right[i][j] };

                for (int v : verticals) {
                    for (int h : horizontals) {
                        if (h > 1) {  // crossbar must have at least a length of 3
                            int t_size = v + (h - 1);  // count the center cell only once
                            max_t_size = max(max_t_size, t_size);
                        }
                    }
                }
            }
        }
    }

    cout << max_t_size << endl;

    return 0;
}
