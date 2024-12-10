-- DROP FUNCTION businessjoboffersreport;

CREATE OR REPLACE FUNCTION businessJobOffersReport(
  vfilters JSONB
)
  RETURNS SETOF jobOffersDetails
LANGUAGE plpgsql
AS $$
DECLARE
  vbusinessid INT := (vfilters->>'businessId')::INT;
  jobTitleRegex VARCHAR := (vfilters->>'jobTitle')::VARCHAR;
BEGIN
  RETURN QUERY
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
        ON jof.offerstatusid = os.id
    WHERE
      (vbusinessid IS NULL OR jof.businessid = vbusinessid)
      AND (jobTitleRegex IS NULL OR jof.offertitle ILIKE concat('%', jobTitleRegex, '%'));
      -- AND (vfilters->>'min_salary' IS NULL OR jof.salary >= (vfilters->>'min_salary')::NUMERIC)
      -- AND (vfilters->>'max_salary' IS NULL OR jof.salary <= (vfilters->>'max_salary')::NUMERIC)
      -- AND (vfilters->>'min_experience' IS NULL OR jof.experience >= (vfilters->>'min_experience')::INT)
      -- AND (vfilters->>'max_experience' IS NULL OR jof.experience <= (vfilters->>'max_experience')::INT);
END;
$$;

-- job offers by business
SELECT * FROM businessjoboffersreport(
  '{
    "businessId": 1,
    "jobTitle": null
  }'::JSONB)