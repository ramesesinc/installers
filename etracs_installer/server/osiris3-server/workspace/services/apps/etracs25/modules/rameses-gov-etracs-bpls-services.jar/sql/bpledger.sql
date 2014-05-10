#######################################
# BPLedgerService
#######################################
[getReceivables]
SELECT 
	br.*, 
	r.code AS account_code, 
	br.taxfeetype AS account_taxfeetype, 
	br.amount - br.amtpaid - br.discount AS balance,
	app.appno
FROM bpreceivable br 
INNER JOIN revenueitem r ON  r.objid=br.account_objid 
LEFT JOIN bpapplication app ON app.objid=br.applicationid
WHERE br.businessid=$P{objid} AND ((br.amount-br.amtpaid- br.discount) > 0) 
ORDER BY br.iyear DESC, br.lob_name DESC, r.code ASC

[getPayments]
SELECT * FROM bppayment WHERE businessid=$P{objid} ORDER BY refdate DESC

[getReceivablePayments]
SELECT * 
FROM bpreceivable_credit 
WHERE receivableid = $P{objid}

[removeReceivables]
DELETE FROM bpreceivable WHERE ledgerid=$P{objid}

###########################################
# used for billing
###########################################
[getUnpaidForBilling]
SELECT 
	br.objid AS objid,
    app.objid AS application_objid,
    app.appyear AS application_appyear,
    app.apptype AS application_apptype,
	app.appno AS application_appno,
	app.appno,

    br.lob_objid AS lob_objid,
    br.lob_objid AS lob_lobid,
    br.lob_name AS lob_name,
    br.lob_assessmenttype,
    l.classification_objid AS lob_classification_objid,
    
	br.account_objid AS account_objid,
	br.account_title AS account_title,
	r.code AS account_code, 
	br.taxfeetype AS account_taxfeetype,
	br.taxfeetype,
	br.amount, 
	br.amtpaid, 
	br.discount,
	br.refid,
	br.reftype,
	br.department,
	br.iyear, 
	br.iqtr, 
	br.taxfeetype, 
	br.amount - br.amtpaid - br.discount AS balance
	
FROM bpreceivable br 
INNER JOIN revenueitem r ON  r.objid=br.account_objid
LEFT JOIN bpapplication app ON app.objid=br.applicationid
LEFT JOIN lob l ON br.lob_objid=l.objid 
WHERE ${filter} AND ((br.amount-br.amtpaid- br.discount) > 0) 
ORDER BY br.iyear DESC, br.lob_name DESC, r.code ASC


###########################################
# used by BPApplicationCashReceiptService
###########################################
[getUnpaidReceivables]
SELECT br.objid, br.businessid, br.objid AS receivableid, 
r.code as account_code, br.account_title, br.account_objid, br.taxfeetype AS account_taxfeetype,
br.lob_objid,br.lob_name,br.amount, br.amtpaid
FROM bpreceivable br
INNER JOIN revenueitem r ON br.account_objid=r.objid 
WHERE br.businessid=$P{businessid}  AND ((br.amount-br.amtpaid- br.discount) > 0) 


##########################################
# used by BusinessCashReceiptInterceptor
##########################################
[updateReceivablePayment]
UPDATE bpreceivable 
SET amtpaid = amtpaid + $P{amtpaid}, 
discount=discount + $P{discount} 
WHERE objid=$P{receivableid}

[getReceivableBalances]
SELECT br.applicationid, br.ledgerid, SUM( br.amount - br.amtpaid ) AS balance
FROM business_receivable br 
WHERE br.objid IN (${receivableids}) 
GROUP BY br.applicationid, br.businessid


###############################################
# used by BusinessCashReceiptInterceptor .Void
###############################################
[findReceivablePaymentForVoid]
SELECT * 
FROM bppayment 
WHERE refid=$P{receiptid}

[getPaymentItemsForVoid]
SELECT * 
FROM bppayment_item WHERE paymentid=$P{paymentid} 

[reverseReceivablePayment]
UPDATE bpreceivable 
SET amtpaid = amtpaid - $P{amtpaid}, 
discount=discount - $P{discount} 
WHERE objid=$P{receivableid}

[updateReceivablePaymentForVoiding]
UPDATE bppayment 
SET voided = 1 
WHERE refid=$P{receiptid}


###############################################
# used by BPLedgerService
###############################################
[getHasPaidReceivable]
SELECT * FROM bpreceivable WHERE applicationid=$P{applicationid} AND amtpaid > 0

[removeReceivablesForApplication]
DELETE FROM bpreceivable WHERE applicationid=$P{applicationid}


[findTaxCreditAccount]
SELECT 
r.objid,
r.code,
r.title,
r.fund_objid, 
r.fund_title 
FROM revenueitem r 
INNER JOIN revenueitem_attribute ra ON ra.revitemid=r.objid
WHERE ra.account_objid = 'TAXCREDIT' AND ra.attribute_objid='businessaccounttype'

[getPaymentItems]
SELECT * FROM bppayment_item WHERE paymentid=$P{objid} ORDER BY lob_name DESC, account_code ASC


[findHasBalance]
SELECT SUM(br.amount - br.amtpaid - br.discount) AS balance
FROM bpreceivable br 
WHERE br.businessid=$P{businessid} ${filter}

