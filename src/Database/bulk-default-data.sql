-- TRUNCATE TABLE joboffers RESTART IDENTITY CASCADE;
-- TRUNCATE TABLE jobapplication_statuses RESTART IDENTITY CASCADE;

-- Insert data into Students
INSERT INTO Students (StudentTypeId, IdentificationTypeId, Name, LastName, GenderId, IdentificationNumber, Email, PhoneNumber, AccountStatusId) VALUES
(1, 1, 'Juan Arias', 'Perez', 1, '123456789', 'juan.perez12@example.com', '3001234567', 1),
(2, 2, 'Maria', 'Gomez Agilar', 2, '987654321', 'maria.gomez31@example.com', '3007654321', 1),
(1, 3, 'Daniel Carlos', 'Diaz', 1, '654987321', 'carlos.diaz32@example.com', '3002345678', 1),
(3, 1, 'Ana Manuela', 'Lopez', 2, '345678912', 'ana.lopez92@example.com', '3008765432', 2),
(1, 2, 'Luis', 'Martinez', 1, '123123123', 'luis.martinez@example.com', '3001122334', 1),
(2, 1, 'Sofia', 'Rodriguez', 2, '876543210', 'sofia.rodriguez@example.com', '3004433221', 1),
(1, 3, 'Miguel', 'Torres', 1, '654321098', 'miguel.torres@example.com', '3005566778', 2),
(3, 2, 'Isabel', 'Fernandez', 2, '111222333', 'isabel.fernandez@example.com', '3007896541', 1),
(2, 1, 'Javier', 'Martinez', 1, '444555666', 'javier.martinez@example.com', '3003344556', 2),
(1, 3, 'Valeria', 'Gonzalez', 2, '777888999', 'valeria.gonzalez@example.com', '3006677889', 1),
(1, 1, 'Juan', 'Perez', 1, '123456789', 'juan.perez@example.com', '3001234567', 1),
(2, 2, 'Maria', 'Gomez', 2, '987654321', 'maria.gomez@example.com', '3007654321', 1),
(1, 3, 'Carlos', 'Diaz', 1, '654987321', 'carlos.diaz@example.com', '3002345678', 1),
(3, 1, 'Ana', 'Lopez', 2, '345678912', 'ana.lopez@example.com', '3008765432', 2);

-- Insert data into Students_Carrers
INSERT INTO Students_Carrers (StudentId, CarrerId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(1, 1),
(6, 2),
(7, 3),
(8, 4),
(9, 5),
(10, 6);


-- Insert data into Students_Semesters
INSERT INTO Students_Semesters (StudentCarrerId, SemesterId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 3),
(7, 1),
(8, 2),
(9, 3),
(10, 1);

-- Insert data into Students_Graduations
INSERT INTO Students_Graduations (StudentSemesterId) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- Insert data into Students_Skills
INSERT INTO Students_Skills (StudentId, SkillId) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 4),
(3, 7),
(4, 5),
(5, 6),
(5, 7),
(6, 8),
(6, 9),
(7, 10),
(8, 11),
(9, 12),
(9, 13),
(10, 14);

-- Insert data into Student_JobPreferences
INSERT INTO Student_JobPreferences (StudentId, WorkPlaceId, EmploymentScheduleId) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 2),
(4, 1, 1),
(5, 2, 1),
(6, 3, 2),
(7, 1, 2),
(8, 2, 1),
(9, 3, 1),
(10, 1, 2);

SELECT * FROM jobroles;
-- Insert data into JobOffers
INSERT INTO JobOffers (BusinessId, ContractTypeId, JobRoleId, WorkPlaceId, EmploymentScheduleId, OfferStatusId, Salary, OfferTitle, Description, Experience, Location) VALUES
(1, 1, 1, 1, 2, 1, 3000.00, 'Backend Developer', 'Work on backend development of web applications', '2 years', 'New York'),
(1, 2, 2, 2, 1, 1, 4000.00, 'Fullstack Developer', 'Develop both frontend and backend for a startup', '3 years', 'Remote'),
(2, 3, 3, 3, 2, 1, 2500.00, 'System Admin', 'Manage servers and databases', '5 years', 'Los Angeles'),
(3, 1, 4, 1, 2, 1, 3500.00, 'Mobile Developer', 'Develop mobile applications for iOS and Android', '3 years', 'San Francisco'),
(1, 1, 5, 2, 2, 1, 2800.00, 'DevOps Engineer', 'Manage CI/CD pipelines and infrastructure automation', '3 years', 'Austin'),
(2, 2, 2, 1, 1, 2, 4500.00, 'Frontend Developer', 'Work on user interfaces for web applications', '2 years', 'Chicago'),
(3, 1, 4, 3, 2, 2, 3200.00, 'UI/UX Designer', 'Design user experiences and interfaces for mobile apps', '4 years', 'Miami'),
(1, 3, 3, 2, 1, 2, 3300.00, 'Data Analyst', 'Analyze data to improve business decision-making', '1 year', 'Remote'),
(2, 2, 5, 3, 1, 1, 3800.00, 'Project Manager', 'Lead cross-functional teams for software projects', '5 years', 'Seattle'),
(3, 1, 3, 1, 2, 2, 3600.00, 'Cloud Engineer', 'Design and maintain cloud infrastructure', '4 years', 'San Francisco');

-- Insert data into JobOffer_Skills
INSERT INTO JobOffer_Skills (JobOfferId, SkillId) VALUES
(1, 1),
(1, 4),
(2, 2),
(2, 7),
(3, 4),
(3, 9),
(4, 5),
(4, 8),
(5, 10),
(6, 11),
(7, 12),
(8, 13),
(9, 14),
(10, 15);

-- Insert data into JobApplications
INSERT INTO JobApplications (StudentId, JobOfferId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1),
(1, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10),
(9, 1),
(10, 2),
(1, 4),
(2, 5),
(3, 6),
(4, 7),
(5, 8);

-- Insert data into JobApplication_Statuses
INSERT INTO JobApplication_Statuses (JobApplicationId, ApplicationStatusId, Date) VALUES
(1, 1, '2024-12-01'),
(2, 2, '2024-12-02'),
(3, 3, '2024-12-03'),
(4, 4, '2024-12-04'),
(5, 1, '2024-12-05'),
(6, 2, '2024-12-06'),
(7, 3, '2024-12-07'),
(8, 4, '2024-12-08'),
(9, 1, '2024-12-09'),
(10, 2, '2024-12-10'),
(11, 1, '2024-11-10'),
(12, 2, '2024-11-11'),
(13, 3, '2024-11-12'),
(14, 4, '2024-11-13'),
(15, 1, '2024-11-14'),
(16, 2, '2024-11-15'),
(17, 3, '2024-11-16'),
(18, 4, '2024-11-17'),
(19, 1, '2024-11-18'),
(20, 2, '2024-11-19'),
(21, 3, '2024-11-20'),
(22, 4, '2024-11-21'),
(23, 1, '2024-11-22'),
(24, 2, '2024-11-23'),
(25, 3, '2024-11-24'),
(26, 4, '2024-11-25'),
(27, 1, '2024-11-26'),
(28, 2, '2024-11-27'),
(29, 3, '2024-11-28'),
(30, 4, '2024-11-29'),
(31, 1, '2024-12-02'),
(32, 2, '2024-12-03'),
(33, 3, '2024-12-04'),
(34, 4, '2024-12-05'),
(35, 1, '2024-12-06'),
(22, 2, '2024-12-07'),
(11, 3, '2024-12-08');