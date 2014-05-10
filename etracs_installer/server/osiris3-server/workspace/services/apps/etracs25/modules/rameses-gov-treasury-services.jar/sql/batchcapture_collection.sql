[findBatchControlByState]
select objid from batchcapture_collection 
where controlid=$P{controlid} and state NOT IN ('POSTED','CLOSED')

[updateBatchCaptureState]
update batchcapture_collection set state=$P{state} 
where objid=$P{objid} 

[deleteBatchEntryItem]
delete from batchcapture_collection_entry_item where parentid=$P{objid}

[deleteBatchEntryItemByRootid]
delete from batchcapture_collection_entry_item  
where parentid in (select objid from  batchcapture_collection_entry where parentid=$P{objid}  ) 		

[deleteBatchEntry]
delete from batchcapture_collection_entry where parentid=$P{objid} 


[findBatchEntry]
select objid from batchcapture_collection_entry where objid=$P{objid} 

[post]	
update batchcapture_collection set 
	state=$P{state}, 
	postedby_objid=$P{postedby_objid},
	postedby_name=$P{postedby_name},
	postedby_date=$P{postedby_date}
where objid=$P{objid}

[getList]
select 
	objid, state, formno, collector_name as collectorname, startseries, endseries,
	totalamount, capturedby_name as capturedbyname
from batchcapture_collection 
where startseries like $P{searchtext} 

[getBatchEntry]
select * from batchcapture_collection_entry where parentid=$P{objid} order by receiptno 

[getBatchEntryItems]
select * from batchcapture_collection_entry_item where parentid=$P{objid}

[updateCashReceiptState]
update cashreceipt 
	set state='POSTED' 
where objid=$P{objid} 