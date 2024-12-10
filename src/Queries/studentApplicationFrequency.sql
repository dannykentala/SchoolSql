DROP FUNCTION studentapplicationfrequency;

CREATE OR REPLACE FUNCTION studentApplicationFrequency(
  vfilters JSONB
)
  RETURNS TABLE (
    studentid INT,
    postulationCount BIGINT,
    studentName TEXT,
    studenttype VARCHAR
  )
LANGUAGE plpgsql
AS $$
DECLARE
  vstudentType VARCHAR := (vfilters->>'studentType')::VARCHAR;
BEGIN
  RETURN QUERY
    SELECT 
      st.id,
      count(st.id) counter,
      concat(st.name, ' ', st.lastname) AS studentName,
      st.studenttype
    FROM jobapplications ja
      LEFT JOIN studentsdetails st
        ON ja.studentid = st.id
      LEFT JOIN joboffersdetails jof
        ON ja.jobofferid = jof.id
    WHERE 
      (vstudentType IS NULL OR st.studenttype = vstudentType)
    GROUP BY
      st.id,
      studentname,
      st.studenttype
    ORDER BY
      counter DESC;
END;
$$;

SELECT * FROM studentapplicationfrequency(
  '{
    "studentType": null
  }'::JSONB)