DROP FUNCTION jobapplicationscountreport(jsonb)

CREATE OR REPLACE FUNCTION jobApplicationsCountReport(
  vfilters JSONB
)
  RETURNS TABLE (
    jobofferid INT,
    postulationCount BIGINT,
    offertitle VARCHAR,
    company VARCHAR
  )
LANGUAGE plpgsql
AS $$
DECLARE
  vjobOfferId INT := (vfilters->>'jobOfferId')::INT;
  vstudentId INT := (vfilters->>'studentId')::INT;
BEGIN
  RETURN QUERY
    SELECT 
      ja.jobofferid,
      count(ja.jobofferid) AS postulationCount,
      jof.offertitle AS applyToOffer,
      jof.company
    FROM jobapplications ja
      LEFT JOIN students st
        ON ja.studentid = st.id
      LEFT JOIN joboffersdetails jof
        ON ja.jobofferid = jof.id
    WHERE 
      (vjobOfferId IS NULL OR ja.jobofferid = vjobOfferId)
    GROUP BY
      ja.jobofferid,
      jof.offertitle,
      jof.company;
END;
$$;

SELECT * FROM jobapplicationscountreport(
  '{
    "jobOfferId": null
  }'::JSONB)