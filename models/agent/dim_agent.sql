
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select agent_id,first_name,last_name from known_agents
    union all
    select c.agent_id,null,null from calls c
    left join known_agents a on c.agent_id = a.agent_id
    where a.agent_id is null

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
