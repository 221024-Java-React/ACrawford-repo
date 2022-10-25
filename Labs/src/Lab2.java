public class Lab2 {

        public static void main(String[] args) {

            System.out.println(add(1, 2));
            System.out.println(sub(2, 1));
            System.out.println(multiply(1.1, 2.2));
            System.out.println(divide(2.2, 1.1));

        }

        public static int add(int x, int y){
            return x + y;
        }

        public static int sub(int x, int y){
            return x - y;
        }

        public static double multiply(double x, double y){
            return x * y;
        }

        public static double divide(double x, double y){
            return x / y;
        }
}
