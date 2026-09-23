public class calculator {
    public static void main(String[] args) {
        double num1 = 7;
        double num2 = 3;
        char operator = '+';
        String again = "y";
        double result;

        while (again == "y")
        {
            if (operator == '+')
            {
                result = num1 + num2;
                System.out.println("Result: " + result);
            }
            else if (operator == '-')
            {
                result = num1 + num2;
                System.out.println("Result: " + result);
            }
            else if (operator == '*')
            {
                result = num1 * num2;
                System.out.println("Result: " + result);
            }
            else if (operator == '/' && num2 == 0)
            {
                System.out.print("Cannot divide by zero.");
            }
            else if(operator == '/')
            {
                result = num1 / num2;
                System.out.println("Result: " + result);
            }
            again = "n";
        }

        System.out.print("Thank you for using the calculator.");
    }
}
