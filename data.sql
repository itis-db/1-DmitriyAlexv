insert into activitytype(
    	  activitytypeid
        ,name
        ,sysname
    )
    select d.*
    from (
    	values(1,'Программа','Program')
        ,(2,'Подпрограмма','SubProgram')
        ,(3,'Проект','Project')
        ,(4,'Контракт','Contract')
        ,(5,'КТ','Point')
    ) d(activitytypeid, name, sysname)
    where not exists(
    	select 1 from activitytype t
        where t.activitytypeid = d.activitytypeid
	);

insert into activity (
		activityid,
		parentid,
		activitytypeid
		) 
	select d.*
	from(values (1, null, 1)
 		,(2, 1, 2)
 		,(3, 2, 3)
 		,(4, 3, 5)
 		,(5, 3, 4)
 		,(6, 5, 5)
	) d(activityid, parentid, activitytypeid)
	where not exists(
    	select 1 from activity t
        where t.activityid = d.activityid
	);
insert into program (activityid, programname) values (1, 'Program 1');

insert into subprogram (activityid, subprogramname) values (2, 'Sub Program 1');

insert into project (activityid, projectname) values (3, 'Project 1');

insert into area (areaid, areaname) values (1,'Area  1');

insert into contract (activityid, contractname, areaid) values (5, 'Contract 1', 1);

insert into point (activityid, pointname) values (4, 'Point 1');
insert into point (activityid, pointname) values (6, 'Point 2');