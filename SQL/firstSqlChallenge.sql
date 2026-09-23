select * from customer;
select * from customer where state = 'AZ';
select * from invoice where invoice_date < current_date - interval '6 months';
update customer set phone = null where phone !~ '^\+1 \d{3} \d{3}-\d{4}$'; 
select * from track where milliseconds > 180000;
update customer set country = 'USA', address = null, city = null, state = null where country != 'USA';

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

create table record_logs (
    log_id INT PRIMARY KEY,
    record_id INT NOT NULL,
    field_changed VARCHAR(100) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_value INT,
    new_value INT
)

CREATE OR REPLACE FUNCTION log_customer_changes()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.customer_id IS DISTINCT FROM NEW.customer_id THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'customer_id', OLD.customer_id::text, NEW.customer_id::text);
    END IF;

    IF OLD.first_name IS DISTINCT FROM NEW.first_name THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'first_name', OLD.first_name, NEW.first_name);
    END IF;

    IF OLD.last_name IS DISTINCT FROM NEW.last_name THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'last_name', OLD.last_name, NEW.last_name);
    END IF;

    IF OLD.company IS DISTINCT FROM NEW.company THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'company', OLD.company, NEW.company);
    END IF;

    IF OLD.address IS DISTINCT FROM NEW.address THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'address', OLD.address, NEW.address);
    END IF;

    IF OLD.city IS DISTINCT FROM NEW.city THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'city', OLD.city, NEW.city);
    END IF;

    IF OLD.state IS DISTINCT FROM NEW.state THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'state', OLD.state, NEW.state);
    END IF;

    IF OLD.country IS DISTINCT FROM NEW.country THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'country', OLD.country, NEW.country);
    END IF;

    IF OLD.postal_code IS DISTINCT FROM NEW.postal_code THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'postal_code', OLD.postal_code, NEW.postal_code);
    END IF;

    IF OLD.phone IS DISTINCT FROM NEW.phone THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'phone', OLD.phone, NEW.phone);
    END IF;

    IF OLD.fax IS DISTINCT FROM NEW.fax THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'fax', OLD.fax, NEW.fax);
    END IF;

    IF OLD.email IS DISTINCT FROM NEW.email THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'email', OLD.email, NEW.email);
    END IF;

    IF OLD.support_rep_id IS DISTINCT FROM NEW.support_rep_id THEN
        INSERT INTO record_logs (record_id, field_changed, old_value, new_value)
        VALUES (NEW.customer_id, 'support_rep_id', OLD.support_rep_id::text, NEW.support_rep_id::text);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER customer_audit_trigger
AFTER UPDATE ON customer
FOR EACH ROW
EXECUTE FUNCTION log_customer_changes();