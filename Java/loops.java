public class loops {
    public static void main(String[] args) 
    {
        System.out.print("For Loop: ");
        for (int i = 1; i <= 5; i++)
        {
            System.out.printf("%d ", i);
        }

        System.out.print("\nWhile Loop: ");
        int i = 1;
        while (i <= 5)
        {
            System.out.printf("%d ", i);
            i++;
        }

        System.out.print("\nDo-While Loop: ");
        i = 1;
        do
        {
            System.out.printf("%d ", i);
            i++;  
        }
        while (i <= 5);
    }
}
