#include <stdio.h>
#include <string.h>

typedef struct {
    char nume[50];
    double timp;
} Alergator;

int main() {
    Alergator alergatori[10] = {
        {"George", 10.22},
        {"Ana", 8.75},
        {"Mihai", 9.50},
        {"Elena", 11.10},
        {"Radu", 9.10},
        {"Ioana", 10.05},
        {"Cristi", 8.90},
        {"Andreea", 12.00},
        {"Vlad", 9.80},
        {"Diana", 10.50}
    };

    int n = 10;

    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (alergatori[j].timp > alergatori[j + 1].timp) {
                Alergator temp = alergatori[j];
                alergatori[j] = alergatori[j + 1];
                alergatori[j + 1] = temp;
            }
        }
    }

    for (int i = 0; i < n; i++) {
        printf("Locul %d: %s\n", i + 1, alergatori[i].nume);
    }

    return 0;
}