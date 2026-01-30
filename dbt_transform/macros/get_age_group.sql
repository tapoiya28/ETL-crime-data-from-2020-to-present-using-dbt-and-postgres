{% macro get_age_group(age_column) -%}

case 
    when {{ age_column }} < 18 then '-18'
    when {{ age_column }} between 18 and 25 then '18-25'
    when {{ age_column }} between 26 and 40 then '26-40'
    when {{ age_column }} between 41 and 65 then '41-65'
    else '65+'
end 

{%- endmacro %}