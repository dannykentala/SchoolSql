-- Active: 1733759554435@@bya1jj5cs9v4zp9ufnpy-postgresql.services.clever-cloud.com@50013@bya1jj5cs9v4zp9ufnpy@public
-- Students information view
CREATE VIEW StudentsDetails
AS
SELECT
  s.id,
  s.name,
  s.lastname,
  g.name AS gender,
  i.name AS identificationType,
  s.identificationnumber,
  s.email,
  s.phonenumber,
  sT.name AS studentType,
  a.name AS accountStatus
FROM  students s
  LEFT JOIN studenttypes sT
    ON s.studenttypeid = sT.id
  LEFT JOIN identificationtypes i
    ON s.identificationtypeid = i.id
  LEFT JOIN accountstatuses a
    ON s.accountstatusid = a.id 
  LEFT JOIN genders g
    ON s.genderid = g.id;
	
-- Carrers details view
CREATE VIEW CarrersDetails
AS
SELECT
  sc.id,
  concat(s.name, ' ', s.lastname) AS studentName,
  c.name AS carrer
FROM students_carrers sc
  LEFT JOIN students s
    ON sc.studentid = s.id
  LEFT JOIN carrers c
    ON sc.carrerid = c.id;

-- Student semester details view
CREATE VIEW SemesterDetails
AS
SELECT
  ss.id,
  cd.studentname,
  cd.carrer,
  s.semestercode
FROM students_semesters ss
  LEFT JOIN carrersdetails cd
    ON ss.studentcarrerid = cd.id
  LEFT JOIN semesters s
    ON ss.semesterid = s.id;

-- Graduated students details view
CREATE VIEW GraduatedStudents
AS
SELECT
  sg.id,
  sd.studentname as graduatedStudent,
  sd.carrer,
  sd.semestercode
FROM students_graduations sg
  LEFT JOIN semesterdetails sd
    ON sg.studentsemesterid = sd.id;

-- Students skills details view
CREATE VIEW StudentSkillsDetails
AS
SELECT
  ss.id,
  concat(st.name, ' ', st.lastname) AS studentName,
  sk.name as skill
FROM students_skills ss
  LEFT JOIN skills sk
    ON ss.skillid = sk.id
  LEFT JOIN students st
    ON ss.studentid = st.id;

-- Students job preferences details view
CREATE VIEW StudentJobPreferencesDetails
AS
SELECT
  sj.id,
  concat(st.name, ' ', st.lastname) AS studentName,
  wp.name AS workPlace,
  es.name AS employmentschedule
FROM student_jobpreferences sj
  LEFT JOIN students st
    ON sj.studentid = st.id
  LEFT JOIN workplaces wp
    ON sj.workplaceid = wp.id
  LEFT JOIN employmentschedules es
    ON sj.employmentscheduleid = es.id;

-- job offers details view
CREATE VIEW JobOffersDetails
AS
SELECT
  jof.id,
  jof.offertitle,
  b.name AS company,
  jr.name AS jobRole,
  jof.salary,
  jof.experience,
  jof.location,
  ct.name AS contractType,
  wp.name AS workPlace,
  es.name AS employmentschedule,
  os.name AS offerStatus,
  jof.description
FROM joboffers jof
  LEFT JOIN businesses b
    ON jof.businessid = b.id
  LEFT JOIN contracttypes ct
    ON jof.contracttypeid = ct.id
  LEFT JOIN jobroles jr
    ON jof.jobroleid = jr.id
  LEFT JOIN workplaces wp
    ON jof.workplaceid = wp.id
  LEFT JOIN employmentschedules es
    ON jof.employmentscheduleid = es.id
  LEFT JOIN offerstatuses os
    ON jof.offerstatusid = os.id;

-- job skills details view
CREATE VIEW JobSkillsDetails
AS
SELECT
  js.id,
  jof.company,
  jof.offertitle,
  sk.name as skill
FROM joboffer_skills js
  LEFT JOIN joboffersdetails jof
    ON js.jobofferid = jof.id
  LEFT JOIN skills sk
    ON js.skillid = sk.id;

--  job applications details view
CREATE VIEW JobApplicationsDetails
AS
SELECT 
  ja.id,
  concat(st.name, ' ', st.lastname) AS studentName,
  jof.company,
  jof.offertitle AS applyToOffer
FROM jobapplications ja
  LEFT JOIN students st
    ON ja.studentid = st.id
  LEFT JOIN joboffersdetails jof
    ON ja.jobofferid = jof.id;

--  job applications statuses details view
CREATE VIEW JobApplicationsStatusesDetails
AS
SELECT
  jas.id,
  ja.studentname,
  ja.company,
  ja.applytooffer,
  jas.date,
  aps.name AS applicationStatus
FROM jobapplication_statuses jas
  LEFT JOIN jobapplicationsdetails ja
    ON jas.jobapplicationid = ja.id
  LEFT JOIN applicationstatuses aps
    ON jas.applicationstatusid = aps.id;