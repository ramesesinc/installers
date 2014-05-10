package bpls.facts;

public class BusinessLocation {
	
	boolean governmentproperty;
	boolean local;
	boolean rented;
	String barangayid;

	public BusinessLocation(a) {
		if(a.type == 'local') local = true;
		else if(a.type == 'government') {
			governmentproperty = true;
			local = true;		
		}	
		else if( a.type == 'rented') {
			rented = true;	
			local = true;
		}		  
		if(a.barangay) {
			barangayid = a.barangay.objid	
		}
	}

}