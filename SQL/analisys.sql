-- Top 10 Kunden mit dem höchsten Rückgabewert
select
    r.customerid,
    k.firstname,
    k.lastname,
    count(r.orderno) as gesamt_retouren_auftrag,
    sum(r.quantity) as gesamt_retouren_menge,
    sum(r.betrag) as gesamt_retouren_betrag
from retourenkopf r
join kunden k on r.customerid = k.customerid
group by r.customerid, k.firstname, k.lastname
order by gesamt_retouren_betrag
limit 10;


-- Top 10 Kunden, die 18% des Gesamtumsatzes ausmachen
select
    customerid,
    firstname,
    lastname,
    betrag,
    anzahl_auftrag,
    round((betrag/gesamt_umsatz_total)*100,2) as prozent_betrag
from (
    select
        p.customerid,
        firstname,
        lastname,
        sum(betrag) AS betrag,
        count(orderno) AS anzahl_auftrag,
        (select sum(betrag) from auftragspos) as gesamt_umsatz_total
    from auftragspos p
    join kunden k on p.customerid = k.customerid
    group by p.customerid, firstname, lastname
    order by betrag desc
    limit 10);


-- Produktkategorie 'C' hat das höchste Verkaufsvolumen und entspricht fast 50% des Gesamtumsatzes.
select
    productcategory,
    gesamt_menge,
    gesamt_umsatz,
    round((gesamt_umsatz/gesamt_umsatz_total)*100,2) as prozent_umsatz
from (
    select
        productcategory,
        sum(quantity) as gesamt_menge,
        sum(betrag) as gesamt_umsatz,
        (select sum(betrag) from auftragspos) as gesamt_umsatz_total
    from auftragspos
    group by productcategory
)
order by gesamt_umsatz desc;

-- E-Mail hat den höchsten durchschnittlichen Bestellwert, aber "In-Store" ist der Kanal mit den meisten Bestellungen.
select
    orderchannel,
    COUNT(orderno) AS anzahl_auftrag,
    SUM(betrag) AS gesamt_betrag,
    AVG(betrag) AS avg_betrag_channel
from auftragspos
group by orderchannel
order by avg_betrag_channel DESC;


-- Der durchschnittliche Preis für Bulk-Bestellungen ist 3-mal niedriger, aber es gibt deutlich mehr reguläre Bestellungen..
select
    ordertype,
    count(orderno) as anzahl_auftrag,
    sum(quantity) as gesamt_menge,
    sum(betrag) as gesamt_betrag,
    sum(betrag) / sum(quantity) as avg_betrag_type
from auftragspos
group by ordertype;
