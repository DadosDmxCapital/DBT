-- macros/grant_select_to_datime.sql
{% macro grant_select_to_datime() %}
    {% set tables = run_query("SELECT tablename FROM pg_tables WHERE schemaname = 'public'").columns[0].values() %}
    {% for table in tables %}
        GRANT SELECT ON TABLE public.{{ table }} TO datime;
    {% endfor %}

    {% set views = run_query("SELECT viewname FROM pg_views WHERE schemaname = 'public'").columns[0].values() %}
    {% for view in views %}
        GRANT SELECT ON TABLE public.{{ view }} TO datime;
    {% endfor %}
{% endmacro %}
