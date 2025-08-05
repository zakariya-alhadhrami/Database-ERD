use spark


-- departement table
create table Department(
	
	DNUM int primary key,
	Dname nvarchar(20) not null unique,
	DepLocation nvarchar(20) not null,
	HireDate date,
	ManagerSSN int


);


create table Employee(

	SSN int primary key,
	Fname nvarchar(20) not null,
	Lname nvarchar(20) not null,
	DoB date,
	Gender nvarchar(1) not null CHECK (Gender IN ('M', 'F')),
	Supervisor_SSN int,
	DNUM int not null,

	foreign key (Supervisor_SSN) references Employee(SSN),
	foreign key (DNUM) references Department(DNUM)


);

alter table Department 
add foreign key (ManagerSSN) references Employee(SSN);


create table Depdent(

	DepdNum int primary key not null,
	DoB date not null,
	Gender nvarchar(1) not null CHECK (Gender IN ('M', 'F')),
	SSN int not null,

	foreign key (SSN) references Employee(SSN)



);


create table Project(

	Pnum int primary key not null,
	Pname nvarchar(20) not null unique,
	Plocation nvarchar(20) not null,
	city nvarchar(20) not null,
	DNUM int not null,

	foreign key (DNUM) references Department(DNUM)


);


create table EmployeeProject(

	SSN int not null,
	Pnum int not null,
	WorkHours decimal(5,2) not null,

	primary key (SSN, Pnum),

	foreign key (SSN) references Employee(SSN),
	foreign key (Pnum) references Project(Pnum)




);