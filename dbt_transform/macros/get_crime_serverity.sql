{% macro get_crime_serverity(crime_part) -%}

case 
    when {{ crime_part }} = 1 then 'serious'
    when {{ crime_part }} = 2 then 'less_serious'
    else 'Unknown'
end 

{%- endmacro %}