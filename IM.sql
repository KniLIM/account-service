create database IM;
use IM;

create table user (
    id varchar(32) unique ,
    email varchar(32) unique ,
    phone varchar(32) unique ,
    password varchar(128),
    nickname varchar(32) ,
    avator varchar(128) ,
    sex boolean,
    signature varchar(128) ,
    location varchar(128) ,
    birthday timestamp default now(),
    created_at timestamp default now(),
    primary key (id)
);


create table friendship(
    uid varchar(32),
    friend varchar(32),
    nickname varchar(32),
    is_top boolean,
    is_black boolean,
    created_at timestamp default now(),
    primary key (uid,friend),
    foreign key (friend) references user(id),
    foreign key (uid) references user(id)
);

create table groupchat(
    id varchar(32),
    owner varchar(32),
    name varchar(32) ,
    avator varchar(128) ,
    signature varchar(128),
    announcement varchar(2048),
    created_at timestamp default now(),
    primary key (id),
    foreign key (owner) references user(id)
);


create table groupship(
    uid varchar(32),
    gid varchar(32),
    is_admin boolean,
    is_block boolean,
    created_at timestamp default now(),
    primary key (uid,gid),
    foreign key (uid) references user(id),
    foreign key (gid) references groupchat(id)
);
