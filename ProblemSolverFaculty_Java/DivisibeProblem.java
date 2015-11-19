package Fakultaet;

public abstract class DivisibeProblem {

	protected boolean directlySolvable;
	protected abstract void checkSolvability ();
	protected abstract void divide ();
	
	protected void computeSolution (){
		while (true){
			checkSolvability();
			if (directlySolvable){
				break;
			}
			divide ();
		}
	}
}
