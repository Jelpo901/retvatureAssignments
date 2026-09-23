public class oeprators {
    public static void main(String[] args) {
        int a = 20;
        int b = 10;

        int add = a + b;
        int sub = a - b;
        int mul = a * b;
        int div = a / b;

        boolean greater = (a > b);
        boolean greaterAnd = ((a > b) && (b > 0)); 

        System.out.println("Addition: " + add);
        System.out.println("Subtraction: " + sub);
        System.out.println("Multiplication: " + mul);
        System.out.println("Division: " + div);
        System.out.println("Is a greater than b? " + greater);
        System.out.println("Is a > b and b > 0? " + greaterAnd); 
    }
}
