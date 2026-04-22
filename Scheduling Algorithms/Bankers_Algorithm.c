#include <stdio.h>
#include <stdbool.h>

#define MAX_PROCESSES 10
#define MAX_RESOURCES 10

struct Process {
    int allocated[MAX_RESOURCES];
    int max_demand[MAX_RESOURCES];
    int need[MAX_RESOURCES];
};

bool getSafeSequence(int available[], struct Process processes[], int n, int m) {

    int work[MAX_RESOURCES];
    bool finish[MAX_PROCESSES];
    int safeSeq[MAX_PROCESSES];

    // Initialize work = available
    for (int i = 0; i < m; i++)
        work[i] = available[i];

    // Initialize finish array
    for (int i = 0; i < n; i++)
        finish[i] = false;

    int count = 0;

    while (count < n) {

        bool found = false;

        for (int i = 0; i < n; i++) {

            if (!finish[i]) {

                bool canExecute = true;

                // Check if need <= work
                for (int j = 0; j < m; j++) {
                    if (processes[i].need[j] > work[j]) {
                        canExecute = false;
                        break;
                    }
                }

                if (canExecute) {

                    // Release allocated resources
                    for (int j = 0; j < m; j++)
                        work[j] += processes[i].allocated[j];

                    safeSeq[count] = i;
                    finish[i] = true;
                    count++;
                    found = true;
                }
            }
        }

        if (!found) {
            printf("\nSystem is NOT in a safe state.\n");
            return false;
        }
    }

    printf("\nSystem is in a SAFE state.\n");
    printf("Safe Sequence: ");

    for (int i = 0; i < n; i++)
        printf("P%d ", safeSeq[i]);

    printf("\n");

    return true;
}

int main() {

    int n, m;

    printf("Enter number of processes: ");
    scanf("%d", &n);

    printf("Enter number of resource types: ");
    scanf("%d", &m);

    int available[MAX_RESOURCES];

    printf("Enter available resources:\n");
    for (int i = 0; i < m; i++)
        scanf("%d", &available[i]);

    struct Process processes[MAX_PROCESSES];

    for (int i = 0; i < n; i++) {

        printf("\nProcess P%d\n", i);

        printf("Allocated resources: ");
        for (int j = 0; j < m; j++)
            scanf("%d", &processes[i].allocated[j]);

        printf("Maximum demand: ");
        for (int j = 0; j < m; j++) {
            scanf("%d", &processes[i].max_demand[j]);

            processes[i].need[j] =
                processes[i].max_demand[j] - processes[i].allocated[j];
        }
    }

    getSafeSequence(available, processes, n, m);

    return 0;
}
