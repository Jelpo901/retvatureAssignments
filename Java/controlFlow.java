public class controlFlow {
    public static void main(String[] args) {
        int score = 75;
        char grade = 'B';

        if (score >= 90)
        {
            grade = 'A';
            System.out.println("Passed \nGrade: " + grade);
        }
        else if (score >= 75 && score <= 89)
        {
            grade = 'B';
            System.out.println("Passed \nGrade: " + grade); 
        }
        else if (score >= 60 && score <= 74)
        {
            grade = 'C';
            System.out.println("Passed \nGrade: " + grade);
        }
        else if (score < 60 && score >= 50)
        {
            grade = 'D';
            System.out.println("Passed \nGrade: " + grade);
        }
        else
        {
            grade = 'D';
            System.out.println("Failed \nGrade: " + grade);
        }
    }
}
