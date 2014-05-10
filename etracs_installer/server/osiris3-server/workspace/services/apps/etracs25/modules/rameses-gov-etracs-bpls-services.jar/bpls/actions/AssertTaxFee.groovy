package bpls.actions;

import com.rameses.rules.common.*;
import bpls.facts.*;


public class AssertTaxFee implements RuleActionHandler {
	def ruleSvc;
	def request;
	
	public void execute(def type, def drools) {
		def facts = request.facts;
		def taxfees = request.taxfees;
		def taxfeefacts = request.taxfeefacts;
		def testlist = [];

		for(it in taxfeefacts) {
			def bt = new TaxFeeAccount();
			bt.objid = it.objid;
			bt.acctid = it.account.objid;
			if(it.lob?.objid) {
				//find the LOB
				bt.lob = facts.find{ z-> (z instanceof bpls.facts.LOB) && z.lobid==it.lob.objid };
			} 
			bt.name = it.account.title;
			bt.amount = it.amount;
			bt.type = it.taxfeetype;
			bt.assessedvalue = it.assessedvalue;
			bt.data = it;
			bt.highest = false;
			bt.lowest = false;
			testlist << bt;
			facts << bt;
		}
		//locate highest or lowest based on amount
		if( testlist.size() > 1 ) {
			testlist.max{ it.amount }.highest = true;
			testlist.min{ it.amount }.lowest = true;
		}
	}
}