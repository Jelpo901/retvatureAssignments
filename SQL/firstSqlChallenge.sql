--select * from customer;
--select * from customer where state = 'AZ';
--select * from invoice where invoice_date < current_date - interval '6 months';
-- update customer set phone = null where phone !~ '^\+1 \d{3} \d{3}-\d{4}$'; 
--select * from track where milliseconds > 180000;
--update customer set country = 'USA', address = null, city = null, state = null where country != 'USA';
/*
create or replace function totalSpending (p_customer_id integer)
returns integer as $spent$
declare 
    spent integer;
begin 
    select sum(total) into spent 
    from invoice
    where invoice.customer_id = p_customer_id;
    
    return spent;
end;
$spent$ language plpgsql;
*/

/*
create or replace procedure updateEmployeeReportToField (i_employee_id integer, i_new_manager_id integer)
language plpgsql
as $$
declare 
    v_current integer := i_new_manager_id;
BEGIN
    if i_employee_id = i_new_manager_id THEN
        raise exception 'Can not report to themselves.';
    end if;

    if not exists (select 1 from employee where employee_id = i_new_manager_id) THEN
        raise exception 'Manager with id % does not exist.', i_new_manager_id;
    end if; 

    while v_current is not null loop
        if v_current = i_employee_id THEN
            raise exception 'Updating would create a circular reporting relationship';
        end if;
        select reports_to into v_current
        from employee where employee_id = v_current;
    end loop;

    update employee
    set reports_to = i_new_manager_id
    where employee_id = i_employee_id;
end;
$$;
*/

create schema pets;
create table pets.Customer(
    customer_Name varchar(40),
    phone_Number int
);
create table pets.Pets(
    animal varchar(20),
    age int,
    owner_Name varchar(40)
);

insert into pets.Customer (customer_Name, phone_Number) VALUES
('John Dog', 39932319),
('John Cat', 13232132),
('Dog Car', 122323213);

insert into pets.Pets (animal, age, owner_Name) VALUES
('Dog', 3, 'John Dog'),
('Cat', 5, 'John Cat'),
('Dog Cat Thing', 33, 'Dog Car');