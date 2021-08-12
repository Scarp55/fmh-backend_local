create sequence block_seq;
create table block
(
    id      int not null primary key default nextval('block_seq'),
    name    varchar,
    comment varchar,
    deleted boolean
);
comment on table block is 'блоки';
comment on column block.id is 'id в системе';
comment on column block.name is 'наименование блока';
comment on column block.comment is 'комментарий';
comment on column block.deleted is 'флаг удаления';


create sequence nurseStation_seq;
create table nurse_station
(
    id      int not null primary key default nextval('nurseStation_seq'),
    name    varchar,
    comment varchar,
    deleted boolean
);
comment on table nurse_station is 'посты';
comment on column nurse_station.id is 'id в системе';
comment on column nurse_station.name is 'наименование';
comment on column nurse_station.comment is 'комментарий';
comment on column nurse_station.deleted is 'флаг удаления';


create sequence room_seq;
create table room
(
    id               int not null primary key default nextval('room_seq'),
    name             varchar,
    block_id         int,
    nurse_station_id int,
    max_occupancy    int,
    comment          varchar,
    deleted          boolean
);
comment on table room is 'палаты';
comment on column room.id is 'id в системе';
comment on column room.name is 'наименование';
comment on column room.block_id is 'id блока';
comment on column room.nurse_station_id is 'id поста';
comment on column room.max_occupancy is 'макс вместимость';
comment on column room.comment is 'Комментарии';
comment on column room.deleted is 'флаг удаления';


create sequence admission_seq;
create table admission
(
    id            int       not null primary key default nextval('admission_seq'),
    patient_id    int       not null,
    plan_date_in  timestamp not null,
    plan_date_out timestamp,
    fact_date_in  timestamp,
    fact_date_out timestamp,
    status        varchar,
    room_id       int,
    comment       varchar,
    deleted       boolean
);
comment on table admission is 'госпитализации';
comment on column admission.id is 'id в системе';
comment on column admission.patient_id is 'id пациента';
comment on column admission.plan_date_in is 'Планируемая дата поступления';
comment on column admission.plan_date_out is 'Планируемая дата выписки';
comment on column admission.fact_date_in is 'Фактическая  дата поступления';
comment on column admission.fact_date_out is 'Фактическая дата выписки';
comment on column admission.status is 'статуса госпитализации';
comment on column admission.room_id is 'id палаты';
comment on column admission.comment is 'комментарий';
comment on column admission.deleted is 'флаг удаления';


create sequence patient_seq;
CREATE TABLE patient
(
    id                   int not null primary key default nextval('patient_seq'),
    first_name           varchar(100),
    last_name            varchar(100),
    middle_name          varchar(100),
    birth_date           date,
    current_admission_id int,
    deleted              boolean
);
comment on table patient is 'пациент';
comment on column patient.id is 'id в системе';
comment on column patient.first_name is 'имя';
comment on column patient.middle_name is 'отчество';
comment on column patient.last_name is 'фамилия';
comment on column patient.birth_date is 'дата рождения';
comment on column patient.current_admission_id is 'id актуальной госпитализации';
comment on column patient.deleted is 'флаг удаления';


create sequence wish_seq;
create table wish
(
    id                int     not null primary key default nextval('wish_seq'),
    patient_id        int     not null,
    title             varchar,
    description       varchar not null,
    creator_id        int     not null,
    executor_id       int,
    create_date       timestamp,
    plan_execute_date timestamp,
    fact_execute_date timestamp,
    status            varchar not null,
    deleted           boolean
);
comment on table wish is 'просьбы';
comment on column wish.id is 'id в системе';
comment on column wish.title is 'тема просьбы';
comment on column wish.patient_id is 'id в таблице Пациент';
comment on column wish.description is 'описание';
comment on column wish.creator_id is 'id автора';
comment on column wish.executor_id is 'id исполнителя';
comment on column wish.create_date is 'дата создания';
comment on column wish.plan_execute_date is 'плановое время исполнения';
comment on column wish.fact_execute_date is 'фактическое время исполнения';
comment on column wish.status is 'статус';
comment on column wish.deleted is 'флаг удаления';

create sequence wishComment_seq;
create table wishComment
(
    id          int not null primary key default nextval('wishComment_seq'),
    wish_id    int,
    description varchar,
    creator_id  int not null,
    create_date timestamp

);
comment on table wishComment is 'Комментарии к просьбам';
comment on column wishComment.id is 'id в системе';
comment on column wishComment.wish_id is 'id просьбы';
comment on column wishComment.description is 'описание комментария к просьбе';
comment on column wishComment.creator_id is 'id автора комментария к просьбе';
comment on column wishComment.create_date is 'дата создания комментария к просьбе';


create sequence wishVisibility_seq;
create table wishVisibility
(
    id       int not null primary key default nextval('wishVisibility_seq'),
    wish_id int,
    role_id  int,
    deleted  boolean
);
comment on table wishVisibility is 'видимости просьб';
comment on column wishVisibility.id is 'id в системе';
comment on column wishVisibility.wish_id is 'id просьбы';
comment on column wishVisibility.role_id is 'id роли';
comment on column wishVisibility.deleted is 'флаг удаления';

create sequence user_seq;
create table users
(
    id           int not null primary key default nextval('user_seq'),
    login        varchar,
    password     varchar,
    first_name   varchar(100),
    last_name    varchar(100),
    middle_name  varchar(100),
    phone_number varchar,
    email        varchar,
    deleted      boolean
);
comment on table users is 'пользователи';
comment on column users.id is 'id в системе';
comment on column users.login is 'логин';
comment on column users.password is 'пароль';
comment on column users.first_name is 'имя';
comment on column users.middle_name is 'отчество';
comment on column users.last_name is 'фамилия';
comment on column users.phone_number is 'тел. номер';
comment on column users.email is 'почта';
comment on column users.deleted is 'флаг удаления';


create sequence claim_seq;
create table claim
(
    id                int     not null primary key default nextval('claim_seq'),
    title             varchar,
    description       varchar not null,
    creator_id        int     not null,
    executor_id       int,
    create_date       timestamp,
    plan_execute_date timestamp,
    fact_execute_date timestamp,
    status            varchar not null,
    deleted           boolean
);
comment on table claim is 'заявки';
comment on column claim.id is 'id в системе';
comment on column claim.title is 'тема заявки';
comment on column claim.description is 'описание';
comment on column claim.creator_id is 'id автора';
comment on column claim.executor_id is 'id исполнителя';
comment on column claim.create_date is 'дата создания';
comment on column claim.plan_execute_date is 'плановое время исполнителя';
comment on column claim.fact_execute_date is 'фактическое время исполнения';
comment on column claim.status is 'статус заявки';
comment on column claim.deleted is 'флаг удаления';

create sequence claimComment_seq;
create table claimComment
(
    id          int not null primary key default nextval('claimComment_seq'),
    claim_id    int,
    description varchar,
    creator_id  int not null,
    create_date timestamp

);
comment on table claimComment is 'Комментарии к заявкам';
comment on column claimComment.id is 'id в системе';
comment on column claimComment.claim_id is 'id заявки';
comment on column claimComment.description is 'описание комментария к заявке';
comment on column claimComment.creator_id is 'id автора комментария к заявке';
comment on column claimComment.create_date is 'дата создания комментария к заявке';

create sequence claimVisibility_seq;
create table claimVisibility
(
    id       int not null primary key default nextval('claimVisibility_seq'),
    claim_id int,
    role_id  int,
    deleted  boolean
);
comment on table claimVisibility is 'видимости заявок';
comment on column claimVisibility.id is 'id в системе';
comment on column claimVisibility.claim_id is 'id заявки';
comment on column claimVisibility.role_id is 'id роли';
comment on column claimVisibility.deleted is 'флаг удаления';

create sequence role_seq;
create table role
(
    id      int not null primary key default nextval('role_seq'),
    name    varchar,
    deleted boolean
);
comment on table role is 'роли';
comment on column role.id is 'id в системе';
comment on column role.name is 'название роли';
comment on column role.deleted is 'флаг удаления';



create sequence advertisement_seq;
create table advertisement
(
    id          int not null primary key default nextval('advertisement_seq'),
    creator_id  int,
    title       varchar,
    description varchar,
    create_data timestamp,
    deleted     boolean
);
comment on table advertisement is 'новости';
comment on column advertisement.id is 'id в системе';
comment on column advertisement.creator_id is 'id автора';
comment on column advertisement.description is 'описание';
comment on column advertisement.title is 'заголовок';
comment on column advertisement.create_data is 'дата создания';
comment on column claim.deleted is 'флаг удаления';

create sequence userRole_seq;
create table user_role
(
    id      int not null primary key default nextval('userRole_seq'),
    user_id int,
    role_id int,
    deleted boolean
);
comment on table user_role is 'роли пользователя';
comment on column user_role.id is 'id в системе';
comment on column user_role.user_id is 'id пользователя';
comment on column user_role.role_id is 'id роли';
comment on column role.deleted is 'флаг удаления';


alter table admission
    add foreign key (patient_id) references patient;
alter table admission
    add foreign key (room_id) references room;
alter table advertisement
    add foreign key (creator_id) references users;
alter table claim
    add foreign key (creator_id) references users;
alter table claim
    add foreign key (executor_id) references users;
alter table wish
    add foreign key (creator_id) references users;
alter table wish
    add foreign key (executor_id) references users;
alter table wish
    add foreign key (patient_id) references patient;
alter table patient
    add foreign key (current_admission_id) references admission;
alter table room
    add foreign key (block_id) references block;
alter table room
    add foreign key (nurse_station_id) references nurse_station;


-- ДАЛЬШЕ НЕ ПОКА НЕ ТРОГАЛ !
-- CREATE TYPE admissions_status AS ENUM ('Discharged', 'Active', 'Expected');
-- create sequence admissions_status_seq;
-- create table adm_status
-- (
--     id      int not null primary key default nextval('admissions_status_seq'),
--     name    admissions_status,
--     code    varchar,
--     deleted boolean
-- );
-- comment on table adm_status is 'статусы госпитализации';
-- comment on column adm_status.id is 'id в системе';
-- comment on column adm_status.name is 'название статуса в enum';
-- comment on column adm_status.code is 'код статуса';
-- comment on column adm_status.deleted is 'флаг удаления';
--
--
-- CREATE TYPE role_u AS ENUM ('Администратор', 'Медицинский работник', 'Волонтёр', 'Сотрудник АХЧ');
-- create sequence role_seq;
-- create table role
-- (
--     id      int not null primary key default nextval('role_seq'),
--     name    role_u,
--     code    varchar,
--     deleted boolean
-- );
-- comment on table role is 'роли';
-- comment on column role.id is 'id в системе';
-- comment on column role.name is 'название роли в enum';
-- comment on column role.code is 'код роли';
-- comment on column role.deleted is 'флаг удаления';
