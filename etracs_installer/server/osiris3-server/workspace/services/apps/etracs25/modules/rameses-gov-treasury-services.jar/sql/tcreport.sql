[getCollectionByFund]
select 
  ri.fund_title as fundname, cri.item_objid as acctid, cri.item_title as acctname,
  cri.item_code as acctcode, sum( cri.amount ) as amount 
from( 
      select distinct cr.objid
      from cashreceipt cr 
        INNER JOIN remittance_cashreceipt rc on cr.objid = rc.objid 
        INNER JOIN liquidation_remittance lc on lc.objid = rc.remittanceid 
        INNER JOIN liquidation_cashier_fund lcf ON lcf.liquidationid = lc.liquidationid 
        INNER JOIN bankdeposit_liquidation bl ON lcf.objid = bl.objid
        inner join bankdeposit bd on bd.objid = bl.bankdepositid 
        LEFT JOIN cashreceipt_void vr ON cr.objid = vr.receiptid  
      where cr.receiptdate BETWEEN $P{fromdate} AND $P{todate} 
        and vr.objid is null 
  ) c 
  inner join cashreceiptitem cri on cri.receiptid = c.objid
  inner join revenueitem ri on ri.objid = cri.item_objid 
where ri.fund_objid like $P{fundid} 
group by ri.fund_title, cri.item_objid, cri.item_code, cri.item_title 
order by fundname, acctcode, acctname  

[getFunds]
select * from fund 

[getSubFunds]
select * from fund where parentid = $P{objid}
