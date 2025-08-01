-- Study Case 2

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
    SessionId int identity(1,1),
    CourseId int,
    InstructorId int,
    primary key(SessionId),
    foreign key (CourseId) references TrainingCourse(CourseId),
    foreign key (InstructorId) references Instructor(InstructorId)
)

create table ParticipationRecord(
    RecordId int identity(1,1),
    EmployeeId int,
    SessionId int,
    AttendedDate date not null,
    Assesment bit not null,
    Notes text not null,
    primary key(EmployeeId, SessionId, RecordId),
    foreign key (SessionId) references TrainingSession(SessionId),
    foreign key (EmployeeId) references Employee(EmployeeId)

)