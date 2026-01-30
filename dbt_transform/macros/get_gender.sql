{% macro get_gender(gender_column) -%}

case {{ gender_column }}
    when 'F' then 'Female'
    when 'M' then 'Male'
    when 'X' then 'Unknown'
    else 'Unknown'
end 

{%- endmacro %}