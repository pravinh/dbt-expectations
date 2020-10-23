{% macro test_expect_column_values_to_not_be_null(model) %}
{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}
{% set partition_column = kwargs.get('partition_column', kwargs.get('arg')) %}
{% set partition_filter =  kwargs.get('partition_filter', kwargs.get('arg')) %}
select count(*)
from {{ model }}
where {{ column_name }} is null
    {% if partition_column and partition_filter %}
        and {{ partition_column }} {{ partition_filter }}
    {% endif %}
{% endmacro %}