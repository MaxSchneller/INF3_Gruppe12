package Fakultaet;

public class FacultyProblem extends DivisibeProblem {

	private FacultySolution solution;
	private int uebergebeneZahl, veranderbareZahl, ergebnis;
	
	public FacultyProblem() {
		solution = new FacultySolution();
	}
	
	public int uebergebeneZahl(){return uebergebeneZahl;}
	
	public void set(int uebergebeneZahl){
		this.uebergebeneZahl = uebergebeneZahl;
		veranderbareZahl=Math.abs(uebergebeneZahl);
		ergebnis=Math.abs(uebergebeneZahl);
		directlySolvable = false;
		computeSolution();		
	}
	
	@Override
	protected void checkSolvability() {
		if (veranderbareZahl==1){
			directlySolvable = true;
			solution.set(ergebnis);
		}
		else if (veranderbareZahl == 0){
			directlySolvable = true;
			solution.set(1);
		}
	}

	@Override
	protected void divide() {
		assert !directlySolvable : "precondition";
		ergebnis = (veranderbareZahl - 1) * ergebnis;
		veranderbareZahl--;
	}
	
	public FacultySolution solution (){
		return solution;
	}
	
}
