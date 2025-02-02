-- Prüft, dass keine doppelte Aufträge gibt. Orderno is unique.
select orderno, count(*)
from auftragskopf
group by orderno
having count(*)>1;

-- Prüft, dass keine doppelte Artikel gibt. Productcode is unique.
select productcode, count(*)
from artikel
group by productcode
having count(*)>1;

-- Prüft, dass keine doppelte kunden gibt. Customerid is unique.
select customerid, count(*)
from kunden
group by customerid
having count(*)>1;

select * from orders where ordertype = 'Bulk' order by orderno, customerid;

select distinct ordertype, quantity from orders where quantity > 0 order by quantity;

select distinct orderno, ordertype, quantity from orders where quantity > 0 order by quantity;
