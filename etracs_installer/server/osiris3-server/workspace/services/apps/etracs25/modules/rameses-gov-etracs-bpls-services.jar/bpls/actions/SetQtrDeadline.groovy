package bpls.actions;

import com.rameses.rules.common.*;
import bpls.facts.*;

public class SetQtrDeadline implements RuleActionHandler {
	def request;
	def dateSvc;
	def expiryDate;

	public void execute(def params, def drools) {
		def entry = params.entry;
		def q = entry.qtr;
		def y = entry.year;
		def bd = dateSvc.getBeginningQtrDate( q, y, 1 );
		def qtrDate = dateSvc.parseDate( bd, null );
		def ed = expiryDate.findExpiryDate([year:y, qtr: q]);
		if(ed) {
			entry.deadline = ed.expirydate;
		}	
		else {
			int mon = qtrDate.month;
			def smon = "-"+mon+"-";
			if( mon < 10) smon = "-0"+mon+"-"; 
			entry.deadline = dateSvc.parseDate(y+smon+"20", null).date;
		}
		//add to request facts. very impt. otherwise this cannot be seen in other rule groups.
		request.facts << entry;
	}
}