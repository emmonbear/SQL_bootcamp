/* return a calculated field named 'person_information' in one line, as 
described in the following example: Anna (age:16,gender:'female',address:
'Moscow').
Add an ascending ordering condition for the calculated column. */
SELECT
      p.name          || 
      ' (age:'        || 
      p.age           || 
      $$,gender:'$$   || 
      p.gender        || 
      $$',address:'$$ || 
      p.address       || 
      $$')$$ AS info
  FROM
      person AS p
 ORDER BY
      info ASC;

      
