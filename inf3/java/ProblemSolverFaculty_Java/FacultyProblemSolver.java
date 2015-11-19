package Fakultaet;

public class FacultyProblemSolver {

	protected static final String HINT = "Pleas call the gcd problem solver with integer pairs as arguments!";
	static int uebergebeneZahl= 6;
	
	public static void main(String[] args) {
		System.out.println("Start");
			try{
				FacultyProblem facultyProblem = new FacultyProblem();
				facultyProblem.set(uebergebeneZahl);
				System.out.println("Fakultär aus " + facultyProblem.uebergebeneZahl() + " ist " + facultyProblem.solution().faculty());
			} catch (Exception e){
				System.out.println("Wrong Argument");
			}
//		}
	}

}
