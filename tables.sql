create table if not exists activitytype
(
    activitytypeid int not null
        constraint pk_activitytype
            primary key,
    name           text    not null,
    sysname        text    not null
);
--
create table if not exists activity (
    activityid int not null
    	constraint pk_activity
    		primary key,
    parentid int,
    activitytypeid int
);
--
create table if not exists program (
    activityid int not null
    	constraint pk_program 
    		primary key,
    programname text
);
--
create table if not exists subprogram (
    activityid int not null
    	constraint pk_subprogram
    		primary key,
    subprogramname text
);
--
create table if not exists project (
    activityid int not null
    	constraint pk_project
    		primary key,
    projectname text
);
--
create table if not exists contract (
    activityid int not null
    	constraint pk_contract
    		primary key,
    contractname text,
    areaid int
);
--
create table if not exists point (
    activityid int not null
    	constraint pk_point
    		primary key,
	pointname text
);
--
create table if not exists area (
    areaid int not null
    	constraint pk_area
    		primary key,
	areaname text
);

 
