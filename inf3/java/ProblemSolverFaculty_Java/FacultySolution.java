package Fakultaet;

public class FacultySolution {
	
	private int faculty;
	
	protected FacultySolution(){
	}
	
	public int faculty(){
		return faculty;
	}
	
	protected void set (int faculty){
		assert faculty >= 1 : "precondition";
		this.faculty = faculty;
	}
}
