with recursive activity_hierarchy as (
    select 
        a.activityid,
        a.parentid,
        a.activitytypeid,
        act.name as activitytypename
    from activity a
    join activitytype act on act.activitytypeid = a.activitytypeid
    where a.activityid = 1
    union all
    select
        a.activityid,
        a.parentid,
        a.activitytypeid,
        act.name as activitytypename
   	from activity_hierarchy ah
    join activity as a on a.parentid = ah.activityid
    join activitytype as act on act.activitytypeid = a.activitytypeid
)
select 
	activityid,
	null as areaid,
	activitytypename
	from activity_hierarchy as ah
	where ah.activitytypeid < 3
	union all
	select
		null as activityid,
		(select 
			c.areaid 
			from activity_hierarchy as ah
			join contract as c on ah.activityid = c.activityid
			where ah.activitytypeid = 4) as areaid,
		'Территория' as activitytypename
	union all
	select 	
		activityid,
		null as areaid,
		activitytypename
	from activity_hierarchy as ah
	where ah.activitytypeid > 2;
	

