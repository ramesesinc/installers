package bpls.actions;

import com.rameses.rules.common.*;
import bpls.facts.*;

public class AddRequirement implements RuleActionHandler {
	def request;
	def BR;

	public void execute(def params, def drools) {
		def type = params.type;
		def step = params.step;
		if( !request.requirements.find{it.refid == type.key}) {
			def z = BR.findEntry([objid: type.key])
			println "yes req found " + z;
			/*
			def filetype=null;
			if(z.type=="DATA") filetype = "bprequirement:DATA";
			*/
			request.requirements << [refid: type.key, type:z.type, title: type.value, step: step ]; 
		}
	}

}

