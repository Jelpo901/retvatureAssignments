import java.util.*;

public class repl {
    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);
        int balance = 0;

        System.out.println("1. Check Balance\n2. Deposit\n3. Withdraw\n4. Exit");
        int input = scn.nextInt();

        while (input != 4)
        {
            if (input == 1)
            {
                System.out.println("Your balance is: " + balance);
                System.out.println("1. Check Balance\n2. Deposit\n3. Withdraw\n4. Exit\n");
                input = scn.nextInt();
            }
            else if (input == 2)
            {
                System.out.println("How much would you like to deposit: ");
                int depositInput = scn.nextInt();
                balance += depositInput;
                System.out.println("1. Check Balance\n2. Deposit\n3. Withdraw\n4. Exit\n");
                input = scn.nextInt();
            }
            else if (input == 3)
            {
                System.out.println("How much would you like to withdraw: ");
                int withdrawInput = scn.nextInt();
                if (withdrawInput > balance)
                {
                    System.out.println("You can not have a negative balance.");
                    System.out.println("1. Check Balance\n2. Deposit\n3. Withdraw\n4. Exit\n");
                    input = scn.nextInt();

                }
                else
                {
                    balance -= withdrawInput;
                    System.out.println("1. Check Balance\n2. Deposit\n3. Withdraw\n4. Exit\n");
                    input = scn.nextInt();

                }
            }
        }
    }
}
