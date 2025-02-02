with kunden as
    (
    select distinct
        customerid,
        firstname,
        lastname,
        country,
        gender,
        age,
        religion
    from orders
    order by customerid
    ),
artikel as
    (
    select distinct
        productcode,
        description,
        productcategory,
        unitprice,
        color
    from orders
    order by productcode
    ),
discount as
    (
    select distinct
        orderno,
        date_trunc(month,to_date(orderdate,'mm/dd/yyyy hh24:mi')) as orderdate,
        customerid,
        productcode,
        sum(quantity) quantity,
        sum(unitprice*quantity) betrag
    from orders
    where productcode = 'D'
    group by orderno, productcode, date_trunc(month,to_date(orderdate,'mm/dd/yyyy hh24:mi')), customerid
    order by orderno, customerid
    ),
retourenkopf as
    (
    select distinct
        orderno,
        date_trunc(month,to_date(orderdate,'mm/dd/yyyy hh24:mi')) as orderdate,
        customerid,
        sum(quantity) quantity,
        sum(unitprice*quantity) betrag
    from orders
    where quantity <0 and productcode != 'D'
    group by orderno, date_trunc(month,to_date(orderdate,'mm/dd/yyyy hh24:mi')), customerid
    order by orderno, customerid
    ),
retourenpos as
    (
    select distinct
        orderno,
        date_trunc(month,to_date(orderdate,'mm/dd/yyyy hh24:mi')) as orderdate,
        customerid,
        productcode,
        orderchannel,
        ordertype,
        productcategory,
        quantity,
        unitprice,
        quantity*unitprice betrag
    from orders
    where quantity <0 and productcode != 'D'
    order by orderno, customerid
    ),
auftragskopf as
    (
    select distinct
        orderno,
        date_trunc(month,to_date(orderdate,'mm/dd/yyyy hh24:mi')) as orderdate,
        customerid,
        sum(quantity) quantity,
        sum(case when quantity < 0 then (unitprice*quantity) else unitprice*quantity end) betrag
    from orders
    where productcode != 'D' and  quantity > 0
    group by orderno, customerid, date_trunc(month,to_date(orderdate,'mm/dd/yyyy hh24:mi'))
    order by orderno, customerid
    ),
auftragspos as
    (
    select distinct
        orderno,
        date_trunc(month,to_date(orderdate,'mm/dd/yyyy hh24:mi')) as orderdate,
        customerid,
        productcode,
        orderchannel,
        ordertype,
        productcategory,
        quantity,
        unitprice,
        quantity*unitprice betrag
    from orders
    where productcode != 'D' and  quantity > 0
    order by orderno, customerid
    )
--select * from auftragspos;
