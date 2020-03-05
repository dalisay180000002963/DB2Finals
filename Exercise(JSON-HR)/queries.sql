Exercise (JSON-HR)

--query for row_to_json employee list

select row_to_json(employees) from "03052020".employees

--query for row_to_json job list

select row_to_json(jobs) from "03052020".jobs

--query for row_to_json departments list

select row_to_json(departments) from "03052020".departments

--query for row_to_json locations list

select row_to_json(locations) from "03052020".locations

--query for row_to_json countries list

select row_to_json(countries) from "03052020".countries

--query for row_to_json job_history list

select row_to_json(job_history) from "03052020".job_history
