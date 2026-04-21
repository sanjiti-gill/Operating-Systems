#include<iostream>
using namespace std;

struct Process{
    int id;
    int arrivaltime;
    int bursttime;
    int priority;
    int completiontime;
    int waitingtime;
    int turnaroundtime;
    bool completed;
};

void swap(Process& a, Process& b){
    Process temp=a;
    a=b;
    b=temp;
}

void calculatetimes(Process process[], int n){
    int currenttime=0;
    int completed=0;
    int totalwaitingtime=0;
    int totalturnaroundtime=0;

   
    while(completed < n){

        int index=-1;
        int highestpriority=9999;

        for(int i=0; i<n; i++){

            if(process[i].arrivaltime<=currenttime && process[i].completed ==false){
                if( process[i].priority<highestpriority){
                    highestpriority=process[i].priority;
                    index=i;
                }

                else if(process[i].priority==highestpriority){
                    if(process[i].arrivaltime<process[index].arrivaltime){
                        index=i;
                    }
                }
            }
        }

        if(index!=-1){
            currenttime+=process[index].bursttime;

            process[index].completiontime=currenttime;
            process[index].turnaroundtime=process[index].completiontime-process[index].arrivaltime;
            process[index].waitingtime=process[index].turnaroundtime-process[index].bursttime;

            process[index].completed=true;

            totalturnaroundtime+=process[index].turnaroundtime;
            totalwaitingtime+=process[index].waitingtime;

            completed++;
        }
        else{
            currenttime++;
        }
    }

    float avgwaitingtime=(float)totalwaitingtime/n;
    float avgturnaroundtime=(float)totalturnaroundtime/n;

    cout << "average waiting time: " << avgwaitingtime << "\n";
    cout << "average turnaroundtime: " << avgturnaroundtime << "\n";

}

void displayProcess(Process process[], int n){

    cout << "\nPROCESS\tAT\tBT\tPR\tCT\tWT\tTAT\n";

    for(int i = 0; i < n; i++){
        cout << "P" << process[i].id << "\t"
             << process[i].arrivaltime << "\t"
             << process[i].bursttime << "\t"
             << process[i].priority << "\t"
             << process[i].completiontime << "\t"
             << process[i].waitingtime << "\t"
             << process[i].turnaroundtime << endl;
    }
}

int main(){
    int n;
    cout << "enter the number of processes: " ;
    cin >> n;
    Process process[n];

    for(int i=0; i<n; i++){
        process[i].id=i+1;
        process[i].completed=false;
        cout << "P" << i+1 << endl;
        cout << "arrival time: " ;
        cin >> process[i].arrivaltime;
        cout << "bursttime: ";
        cin >> process[i].bursttime;
        cout << "priority: ";
        cin >> process[i].priority;
    }

    calculatetimes(process,n);
    displayProcess(process,n);

    return 0;
}
