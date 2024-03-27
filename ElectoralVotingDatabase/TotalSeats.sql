create view Totals_Seats
AS
SELECT
t.abbreviation,t.PartyName as name,[Total seats Won] = 0
FROM Party t
go
/*View Total Seats Won*/
SELECT abbreviation,name, COALESCE(sum(t1.seat), 0) [Total seats Won]
FROM winners t1
right join Totals_Seats t2 on (t1.party = t2.abbreviation) 
WHERE t2.abbreviation = 'TWP' or t2.abbreviation = 'OPP'
group by t2.abbreviation,t2.name, t2.[Total seats Won]
ORDER BY t2.abbreviation DESC;
