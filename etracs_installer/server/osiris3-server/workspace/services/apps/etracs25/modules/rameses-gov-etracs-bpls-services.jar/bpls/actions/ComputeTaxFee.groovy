package bpls.actions;

import com.rameses.rules.common.*;
import bpls.facts.*;
import java.rmi.server.*;

public class ComputeTaxFee implements RuleActionHandler {
	def request;
	def BA;
	def NA;
	def type;
	public void execute(def params, def drools) {
		def entity = request.entity;
		def taxfees = request.taxfees;
		def taxfeefacts = request.taxfeefacts;
		def lob = params.lob;
		def acctid = params.account.key;
		def amt = params.amount.doubleValue;
		def test = null;
		
 		if( !lob ) {
			test = taxfees.find{it.lob?.objid==null && it.account.objid == acctid};
		}
		else {
			test = taxfees.find{it.lob?.objid!=null && it.lob.objid == lob.objid && it.account.objid == acctid };
		}

		//if account already exists, do not override.
		if(!test) {
			def info = [objid:"BPTXFEE"+new UID()];
			info.account = BA.findAccount( [objid: acctid] );
			if(lob) {
				info.lob = [objid:lob.objid, name:lob.name];
			}
			info.taxfeetype = type;
			info.paymentmode = info.account.paymentmode;
			info.assessedvalue = NA.round(amt);
			info.amount = NA.round(amt);
			info.rulename = drools.rule.name;
			taxfees << info;
			taxfeefacts << info;
		}
		else {
			//add rule history so we can trace rules that executed the account.
			if( test._taxfees == null ) test._taxfees = [];
			def hist = [rulename: drools.rule.name, amount: amt];
			if( lob!=null) hist.lob = [objid:lob.objid, name:lob.name];
			test._taxfees << hist;
		}
	}
}