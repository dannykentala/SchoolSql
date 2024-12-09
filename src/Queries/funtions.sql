CREATE FUNCTION GetStudentName(studentId int) 
RETURNS INT
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN studentId;
END $$;