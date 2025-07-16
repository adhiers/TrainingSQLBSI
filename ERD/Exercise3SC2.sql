-- Study Case 2

--drop table Employee;
--drop table TrainingCourse;
--drop ;

create table Employee (
    EmployeeId int identity(1,1) primary key,
	EmployeeName varchar(30) not null,
	Email varchar(50) not null,
    PhoneNumber varchar(20) not null,
    HireDate datetime not null,
    BirthDate date not null
)

create table TrainingCourse(
    CourseId int identity(1,1) primary key,
    CourseTitle varchar(50) not null,
    CourseDescription text not null,
    DurationHrs int not null
)

create table Instructor(
    InstructorId int identity(1,1) primary key,
    EmployeeId int not null,
    HireDate date not null
    foreign key (EmployeeId) references Employee(EmployeeId)
)

create table TrainingSession(
    CourseId int,
    EmployeeId int,
    primary key (CourseId, EmployeeId),
    foreign key (CourseId) references TrainingCourse(CourseId),
    foreign key (EmployeeId) references Employee(EmployeeId)
)

create table ParticipationRecord(
    RecordId int identity(1,1) primary key,
    InstructorId int,
    EmployeeId int,
    CourseId int,
    AttendedDate date not null,
    Assesment bit not null,
    Notes text not null,
    foreign key (InstructorId) references Instructor(InstructorId),
    foreign key (EmployeeId) references Employee(EmployeeId),
    foreign key (CourseId) references TrainingCourse(CourseId)
)