create schema todo collate utf8_general_ci;

create table task
(
    taskId int auto_increment,
    description varchar(255) not null,
    timestamp varchar(255) not null,
    isCompleted boolean default false not null,
    constraint task_pk
        primary key (taskId)
);

create table disc_catalog.flight(
                                    flightId integer CONSTRAINT task_pk PRIMARY KEY,
                                    stability varchar(25) not null,
                                    speed numeric(4,2) not null,
                                    glide numeric(4,2) not null,
                                    turn numeric(4,2) not null,
                                    fade numeric(4,2) not null
);

create table disc_catalog.disc(
                                  discId integer CONSTRAINT task_pk PRIMARY KEY,
                                  brand varchar(25) not null,
                                  name varchar(50) not null,
                                  plastic varchar(50),
                                  stability varchar(25) not null,
                                  speed numeric(4,2) not null,
                                  glide numeric(4,2) not null,
                                  turn numeric(4,2) not null,
                                  fade numeric(4,2) not null,
                                  isCollected boolean default false not null,
                                  isOwned boolean default false not null,
                                  description varchar(255) not null
);
