#include <stdio.h>

#define InitBalance 1000
  float Balance;

int main() { 
  int operation;
  float income, withdraw;
  
  printf("\nWelcome to the FSO ATM\n");
  Balance = InitBalance;
  operation = 0;
  printf("\nIndicate operation to do:\n");
  printf("1. Cash Income\n2. Cash Withdrawal\n3. Balance Enquiry\n");
  printf("4. Account Activity\n5. Change PIN\n6. Exit\n\n");
  printf("Operation: ");
  scanf("%d", &operation); 
  
  switch (operation) {
      case 1:
          printf("Cash Income\n");
          printf("\nEnter the amount to deposit: ");   
          scanf("%f", &income);
          Balance = Balance+income;  
          printf("Successful income\n");
          break;
      case 2:
          printf("Cash Withdrawal\n");
          printf("\nEnter the amount to withdraw: ");
          scanf("%f", &income);
    
          if (Balance > income){
            Balance=Balance-income;
          } else {
          printf("Operation does not allowed\n");
          printf("Not enough cash\n");
          }
          break;
      case 3:
          printf("Balance Enquiry\n");
          break;
      case 4:
          printf("This operation is not implemented\n");
          break;
      case 5:
          printf("This operation is not implemented\n");
          break;
      case 6:
          printf("EXIT\n");
          break;
      default:
        printf("ERROR: This opertaion does not applied\n");
  
        printf("\n\nCurrent Balance: %.2f €", Balance);
        printf("\n\nThanks\n\n");
        return(0);
    }
}
