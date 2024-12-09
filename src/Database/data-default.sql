-- Insert data into AccountStatuses
INSERT INTO AccountStatuses (Name) VALUES
('active'),
('disable');

-- Insert data into StudentTypes
INSERT INTO StudentTypes (Name) VALUES
('student'),
('graduated'),
('dropout');

-- Insert data into Genders
INSERT INTO Genders (Name) VALUES
('male'),
('female');

-- Insert data into IdentificationTypes
INSERT INTO IdentificationTypes (Name) VALUES
('cedula'),
('tarjeta identidad'),
('pasaporte');

-- Insert data into Carrers
INSERT INTO Carrers (Name) VALUES
('tecnologia en desarrollo de software'),
('ingenieria en desarrollo de software'),
('tecnologia en sistemas mecatronicos'),
('ingenieria administrativa'),
('ingenieria industrial'),
('tecnologia en gestion del disenno textil y de moda');

-- Insert data into EmploymentSchedules
INSERT INTO EmploymentSchedules (Name) VALUES
('part time'),
('full time');

-- Insert data into WorkPlaces
INSERT INTO WorkPlaces (Name) VALUES
('on-site'),
('remote'),
('hybrid');

-- Insert data into Semesters
INSERT INTO Semesters (Semestercode, Year) VALUES
('2024-1', '2024'),
('2024-2', '2024'),
('2025-1', '2025');

-- Insert data into Skills
INSERT INTO Skills (Name) VALUES
('sqlServer'),
('postgreSQL'),
('bash'),
('linux'),
('.net'),
('web api'),
('react'),
('git'),
('github'),
('azure DevOps'),
('ci/cd'),
('scrum'),
('markdown'),
('mermaid'),
('debugging'),
('clean code'),
('solid'),
('team work'),
('leadership'),
('time management');

-- Insert data into ContractTypes
INSERT INTO ContractTypes (Name) VALUES
('fijo'),
('temporal'),
('practicas');

-- Insert data into JobRoles
INSERT INTO JobRoles (Name) VALUES
('backend developer'),
('fullstack developer'),
('system admin'),
('mobile developer'),
('scrum master');

-- Insert data into ApplicationStatuses
INSERT INTO ApplicationStatuses (Name) VALUES
('pending'),
('interviewing'),
('hired'),
('not retained');

-- Insert data into Students
INSERT INTO Students (StudentTypeId, IdentificationTypeId, Name, LastName, GenderId, IdentificationNumber, Email, PhoneNumber, AccountStatusId) VALUES
(1, 1, 'Juan', 'Perez', 1, '123456789', 'juan.perez@example.com', '3001234567', 1),
(2, 2, 'Maria', 'Gomez', 2, '987654321', 'maria.gomez@example.com', '3007654321', 1),
(1, 3, 'Carlos', 'Diaz', 1, '654987321', 'carlos.diaz@example.com', '3002345678', 1),
(3, 1, 'Ana', 'Lopez', 2, '345678912', 'ana.lopez@example.com', '3008765432', 2);

-- Insert data into Students_Carrers
INSERT INTO Students_Carrers (StudentId, CarrerId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insert data into Students_Semesters
INSERT INTO Students_Semesters (StudentCarrerId, SemesterId) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert data into Students_Graduations
INSERT INTO Students_Graduations (StudentSemesterId) VALUES
(1),
(2),
(3);

-- Insert data into Students_Skills
INSERT INTO Students_Skills (StudentId, SkillId) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 4),
(3, 7),
(4, 5);

-- Insert data into Student_JobPreferences
INSERT INTO Student_JobPreferences (StudentId, WorkPlaceId, EmploymentScheduleId) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 2),
(4, 1, 1);

-- Insert data into Businesses
INSERT INTO Businesses (AccountStatusId, Name) VALUES
(1, 'Tech Solutions Inc.'),
(1, 'Software Ventures Ltd.'),
(2, 'FashionTech Apparel');

-- Insert data into JobOffers
INSERT INTO JobOffers (BusinessId, ContractTypeId, JobRoleId, WorkPlaceId, EmploymentScheduleId, Salary, OfferTitle, Description, Experience, Location) VALUES
(1, 1, 1, 1, 2, 3000.00, 'Backend Developer', 'Work on backend development of web applications', '2 years', 'New York'),
(1, 2, 2, 2, 1, 4000.00, 'Fullstack Developer', 'Develop both frontend and backend for a startup', '3 years', 'Remote'),
(2, 3, 3, 3, 2, 2500.00, 'System Admin', 'Manage servers and databases', '5 years', 'Los Angeles'),
(3, 1, 4, 1, 2, 3500.00, 'Mobile Developer', 'Develop mobile applications for iOS and Android', '3 years', 'San Francisco');

-- Insert data into JobOffer_Skills
INSERT INTO JobOffer_Skills (JobOfferId, SkillId) VALUES
(1, 1),
(1, 4),
(2, 2),
(2, 7),
(3, 4),
(3, 9),
(4, 5),
(4, 8);

-- Insert data into JobApplications
INSERT INTO JobApplications (StudentId, JobOfferId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insert data into JobApplication_Statuses
INSERT INTO JobApplication_Statuses (JobApplicationId, ApplicationStatusId, Date) VALUES
(1, 1, '2024-12-01'),
(2, 2, '2024-12-02'),
(3, 3, '2024-12-03'),
(4, 4, '2024-12-04');