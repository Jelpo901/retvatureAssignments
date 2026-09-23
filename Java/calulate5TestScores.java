import java.util.*;

public class calulate5TestScores {
    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);
        int size = 5;
        int scores[] = new int[size];

        System.out.println("Enter 5 Test Scores");
        for (int i = 0; i < size; i++)
        {
            scores[i] = scn.nextInt();
        }

        int sum = 0;
        for (int i = 0; i < size; i++)
        {
            sum += scores[i];
        }

        int average = sum/size;
        int max = Arrays.stream(scores).max().getAsInt();
        int min = Arrays.stream(scores).min().getAsInt();

        System.out.println("Total: " + sum);
        System.out.println("Average: " + average);
        System.out.println("Highest " + max);
        System.out.println("Lowest: " + min);
        System.out.println("Your values were: ");

        for (int i = 0; i < 5; i++)
        {
            if (scores[i] >= 90)
            {
                System.out.println(scores[i] + " - A");
            }
            else if (scores[i] >= 80 && scores[i] < 90)
            {
                System.out.println(scores[i] + " - B");
            }
            else if (scores[i] >= 70 && scores[i] < 79)
            {
                System.out.println(scores[i] + " - C");
            }
            else if (scores[i] >= 60 && scores[i] < 69)
            {
                System.out.println(scores[i] + " - D");
            }
            else if (scores[i] < 60)
            {
                System.out.println(scores[i] + " - F");
            } 
        }
    }
}
