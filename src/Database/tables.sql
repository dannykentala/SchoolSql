-- Create AccountStatuses table (for storing all possible account statuses)
CREATE TABLE AccountStatuses (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
);

-- Create Genders table (for storing gender options)
CREATE TABLE Genders (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL
);

-- Create IdentificationTypes table (for storing identification types)
CREATE TABLE IdentificationTypes (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL
);

-- Create StudentTypes table (for storing student types)
CREATE TABLE StudentTypes (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL
);

-- Create Carrers table (for storing career options)
CREATE TABLE Carrers (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
);

-- Create Semesters table (for storing semester data)
CREATE TABLE Semesters (
  Id SERIAL PRIMARY KEY,
  SemesterCode VARCHAR(50) NOT NULL,
  Year VARCHAR(4) NOT NULL
);

-- Create Skills table (for storing skills)
CREATE TABLE Skills (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
);

-- Create WorkPlaces table (for storing work places)
CREATE TABLE WorkPlaces (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
);

-- Create EmploymentSchedules table (for storing employment schedules)
CREATE TABLE EmploymentSchedules (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL
);

-- Create Students table (for storing student information)
CREATE TABLE Students (
  Id SERIAL PRIMARY KEY,
  StudentTypeId INT REFERENCES StudentTypes(Id),
  IdentificationTypeId INT REFERENCES IdentificationTypes(Id),
  AccountStatusId INT REFERENCES AccountStatuses(Id),
  GenderId INT REFERENCES Genders(Id),
  Name VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  IdentificationNumber VARCHAR(50) NOT NULL,
  Email VARCHAR(255) NOT NULL UNIQUE,
  PhoneNumber VARCHAR(20) NOT NULL
);

-- Create Students_Carrers table (for storing student career enrollments)
CREATE TABLE Students_Carrers (
  Id SERIAL PRIMARY KEY,
  StudentId INT REFERENCES Students(Id) ON DELETE CASCADE,
  CarrerId INT REFERENCES Carrers(Id)
);

-- Create Students_Semesters table (for storing student semesters)
CREATE TABLE Students_Semesters (
  Id SERIAL PRIMARY KEY,
  StudentCarrerId INT REFERENCES Students_Carrers(Id) ON DELETE CASCADE,
  SemesterId INT REFERENCES Semesters(Id)
);

-- Create Students_Graduations table (for storing student graduations)
CREATE TABLE Students_Graduations (
  Id SERIAL PRIMARY KEY,
  StudentSemesterId INT REFERENCES Students_Semesters(Id) ON DELETE CASCADE
);

-- Create Students_Skills table (for storing student skills)
CREATE TABLE Students_Skills (
  Id SERIAL PRIMARY KEY,
  StudentId INT REFERENCES Students(Id),
  SkillId INT REFERENCES Skills(Id)
);

-- Create Student_JobPreferences table (for storing student job preferences)
CREATE TABLE Student_JobPreferences (
  Id SERIAL PRIMARY KEY,
  StudentId INT REFERENCES Students(Id),
  WorkPlaceId INT REFERENCES WorkPlaces(Id),
  EmploymentScheduleId INT REFERENCES EmploymentSchedules(Id)
);

-- Create ApplicationStatuses table (for storing application statuses)
CREATE TABLE ApplicationStatuses (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL
);

-- Create Businesses table (for storing business information)
CREATE TABLE Businesses (
  Id SERIAL PRIMARY KEY,
  AccountStatusId INT REFERENCES AccountStatuses(Id),
  Name VARCHAR(255) NOT NULL
);

-- Create JobRoles table (for storing job roles)
CREATE TABLE JobRoles (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
);

-- Create ContractTypes table (for storing contract types)
CREATE TABLE ContractTypes (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL
);

CREATE TABLE OfferStatuses (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL
);

-- Create JobOffers table (for storing job offers)
CREATE TABLE JobOffers (
  Id SERIAL PRIMARY KEY,
  BusinessId INT REFERENCES Businesses(Id),
  ContractTypeId INT REFERENCES ContractTypes(Id),
  JobRoleId INT REFERENCES JobRoles(Id),
  WorkPlaceId INT REFERENCES WorkPlaces(Id),
  EmploymentScheduleId INT REFERENCES EmploymentSchedules(Id),
  OfferStatusId INT REFERENCES OfferStatuses(Id)
  Salary DECIMAL(10, 2),
  OfferTitle VARCHAR(255) NOT NULL,
  Description TEXT,
  Experience VARCHAR(255),
  Location VARCHAR(255)
);

-- Create JobOffer_Skills table (for storing job offer skill requirements)
CREATE TABLE JobOffer_Skills (
  Id SERIAL PRIMARY KEY,
  JobOfferId INT REFERENCES JobOffers(Id),
  SkillId INT REFERENCES Skills(Id)
);

-- Create JobApplications table (for storing job applications)
CREATE TABLE JobApplications (
  Id SERIAL PRIMARY KEY,
  StudentId INT REFERENCES Students(Id),
  JobOfferId INT REFERENCES JobOffers(Id)
);

-- Create JobApplication_Statuses table (for storing job application status changes)
CREATE TABLE JobApplication_Statuses (
  Id SERIAL PRIMARY KEY,
  JobApplicationId INT REFERENCES JobApplications(Id),
  ApplicationStatusId INT REFERENCES ApplicationStatuses(Id),
  Date DATE NOT NULL
);