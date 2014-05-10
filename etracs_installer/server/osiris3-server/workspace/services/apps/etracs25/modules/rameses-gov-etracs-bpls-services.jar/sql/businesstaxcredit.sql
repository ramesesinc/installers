#######################################
# used for retrieving the application
#######################################
[findByBusinessid]
SELECT * FROM business_taxcredit WHERE businessid=$P{businessid}

[getDetails]
SELECT * FROM business_taxcredit_detail WHERE parentid=$P{objid}

