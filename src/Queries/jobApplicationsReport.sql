CREATE OR REPLACE FUNCTION jobApplicationsReport(
  vfilters JSONB
)
  RETURNS SETOF JobApplicationsDetails
LANGUAGE plpgsql
AS $$
DECLARE
  vjobOfferId INT := (vfilters->>'jobOfferId')::INT;
  vstudentId INT := (vfilters->>'studentId')::INT;
BEGIN
  RETURN QUERY
    SELECT 
      ja.id,
      concat(st.name, ' ', st.lastname) AS studentName,
      jof.company,
      jof.offertitle AS applyToOffer
    FROM jobapplications ja
      LEFT JOIN students st
        ON ja.studentid = st.id
      LEFT JOIN joboffersdetails jof
        ON ja.jobofferid = jof.id
    WHERE 
      (vjobOfferId IS NULL OR ja.jobofferid = vjobOfferId)
      AND (vstudentId IS NULL OR ja.studentid = vstudentId);
END;
$$;

-- JobApplicationsReport, filter by businnes and student id
SELECT * FROM jobapplicationsreport(
  '{
    "jobOfferId": null,
    "studentId": 1
  }'::JSONB)