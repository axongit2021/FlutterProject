public class Logic {
    public static void main(String args[]){

        System.out.println("The area of the circle is: ");
        double l=circle_area(12.3);
        System.out.print(l);

        System.out.println("\nThe perimeter of the triangle is: ");
        double t=triangle_peri(10.2);
        System.out.print(t);
        System.out.println("\nThe volume of the box is: ");
        double r=box_volume(10.6,2.1,5.4);
        System.out.print(r);
    }
    static double circle_area(double mRadius){
        return Math.PI*mRadius*mRadius;
    }
    static double triangle_peri(double mLenght){
        return mLenght+mLenght+mLenght;
    }
    static double box_volume(double mLength,double mWidth,double mHeight){
        return mHeight*mLength*mWidth;
    }


}
