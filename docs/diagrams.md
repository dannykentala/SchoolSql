```mermaid
erDiagram
  Genders {
    int Id
    varchar-u Name 
  }
  IdentificationTypes {
    int Id
    varchar-u Name
  }
  StudentTypes {
    int Id
    varchar-u Name
  }
  Carrers {
    int Id
    varchar-u Name
  }
  Semesters {
    int Id
    varchar-u SemesterCode
    varchar year
  }
  Skills {
    int Id
    varchar-u Name
  }
  WorkPlacesTypes {
    int Id
    int-u Name 
  }
  EmploymentSchedules {
    int Id
    int-u Name
  }
  Students {
    int Id
    int-fk StudentTypeId
    int-fk IdentificationTypeId
    int-fk CarrerId
    varchar Name
    varchar LastName
    varchar GenderId
    varchar IdentificationNumber
    varchar Email
    varchar PhoneNumber
  }
  Students_Semesters {
    int Id
    int StudentId
    int SemesterId
  }
  Students_Graduations {
    int Id
    int StudentSemesterId
  }
  Students_Skills {
    int Id
    int StudentId
    int SkillId
  }
  Student_JobPreferences {
    int Id
    int StudentId
    int WorkPlacePreferenceId
    int EmploymentSchedules
  }
```

```mermaid
erDiagram
  ContratTypes {
    int Id
    varchar Name
  }
  Businesses {
    int Id
    varchar Name
  }
  JobRoles {
    int Id
    varchar Name
  }
  JobOffers {
    int Id
    int BusinessId
    int ContractTypeId
    int JobRoleId
    int WorkPlaceId
    int EmploymentScheduleId
    float Salary
    varchar OfferTitle
    varchar Description
    varchar Expirence
    varchar Location
  }
  JobOffer_Skills {
    int JobOfferId
    int SkillId
  }
```

```mermaid
erDiagram
  ApplicationStatuses {
    int Id
    varchar Name 
  }
  JobApplications {
    int StudentId
    int JobOfferId
  }
  JobApplication_Statuses {
    int JobApplicationId
    int ApplicationStateId
    date Date
  }
```