create table if not exists t_role
(
	roleid text not null
		constraint t_role_pk
			primary key,
	rolename varchar not null,
	note varchar,
	dts_rec_cre timestamp default CURRENT_TIMESTAMP,
	user_rec_cre varchar,
	dts_rec_upd timestamp default CURRENT_TIMESTAMP,
	user_rec_upd varchar,
	delkbn varchar default 0
)
;

alter table t_role owner to yoochenil
;

create table if not exists t_user
(
	userid varchar default nextval('t_user_userid_seq'::regclass) not null
		constraint t_user_pk
			primary key,
	username varchar not null,
	password varchar not null,
	email varchar,
	name_kanji varchar,
	name_kana varchar,
	birthday varchar,
	gender varchar,
	todohuken varchar,
	address1 varchar,
	address2 varchar,
	address3 varchar,
	storeid varchar,
	work_time varchar,
	note varchar,
	dts_rec_cre timestamp default CURRENT_TIMESTAMP,
	user_rec_cre varchar,
	dts_rec_upd timestamp default CURRENT_TIMESTAMP,
	user_rec_upd varchar,
	delkbn varchar default 0,
	roleid varchar default 1
		constraint t_user_t_role_fk
			references t_role,
	post varchar,
	name_display varchar not null
)
;

alter table t_user owner to yoochenil
;

create unique index if not exists t_user_username_uindex
	on t_user (username)
;

create table if not exists t_permission
(
	permissionid varchar not null
		constraint t_permission_pk
			primary key,
	permissionname varchar not null,
	note varchar,
	dts_rec_cre timestamp default CURRENT_TIMESTAMP,
	user_rec_cre varchar,
	dts_rec_upd timestamp default CURRENT_TIMESTAMP,
	user_rec_upd varchar,
	delkbn varchar default 0,
	roleid varchar
		constraint t_permission_t_role_fk
			references t_role
)
;

alter table t_permission owner to yoochenil
;

create table if not exists t_post
(
	postid varchar,
	old_post varchar,
	new_post varchar,
	todohuken_kana varchar,
	address1_kana varchar,
	address2_kana varchar,
	todohuken_kanji varchar,
	address1_kanji varchar,
	address2_kanji varchar,
	flg1 varchar,
	flg2 varchar,
	flg3 varchar,
	flg4 varchar,
	flg5 varchar,
	flg6 varchar
)
;

alter table t_post owner to yoochenil
;

create table if not exists t_store
(
	storeid varchar default nextval('t_store_storeid_seq'::regclass) not null
		constraint t_store_pk
			primary key,
	storename varchar,
	note varchar,
	dts_rec_cre timestamp default CURRENT_TIMESTAMP,
	user_rec_cre varchar,
	dts_rec_upd timestamp default CURRENT_TIMESTAMP,
	user_rec_upd varchar,
	delkbn varchar default 0,
	roomnum varchar
)
;

alter table t_store owner to yoochenil
;

create table if not exists t_hanyo
(
	hanyoid varchar default nextval('t_hanyo_hanyoid_seq'::regclass) not null
		constraint t_hanyo_pk
			primary key,
	kb_hanyo varchar,
	cd_hanyo varchar,
	masterti varchar,
	flg_hanyo_1 varchar,
	flg_hanyo_2 varchar,
	flg_hanyo_3 varchar,
	flg_hanyo_4 varchar,
	note varchar,
	dts_rec_cre timestamp default CURRENT_TIMESTAMP,
	user_rec_cre varchar,
	dts_rec_upd timestamp default CURRENT_TIMESTAMP,
	user_rec_upd varchar,
	delkbn varchar default 0
)
;

alter table t_hanyo owner to yoochenil
;

create table if not exists t_course
(
	courseid varchar default nextval('t_course_courseid_seq'::regclass) not null
		constraint t_course_pk
			primary key,
	coursename varchar,
	kb_course varchar,
	coursetime integer,
	note varchar,
	dts_rec_cre timestamp default CURRENT_TIMESTAMP,
	user_rec_cre varchar,
	dts_rec_upd timestamp default CURRENT_TIMESTAMP,
	user_rec_upd varchar,
	delkbn varchar default 0,
	price_uriage varchar default 0 not null,
	price_genka varchar default 0 not null,
	coursekbn varchar
)
;

alter table t_course owner to yoochenil
;

create table if not exists t_work
(
	id varchar default nextval('t_work_workid_seq'::regclass) not null
		constraint t_work_pk
			primary key,
	title varchar,
	storeid varchar
		constraint t_work_t_store_fk
			references t_store,
	roomid varchar,
	resourceid varchar,
	start timestamp not null,
	"end" timestamp not null,
	courseid varchar
		constraint t_work_t_course_fk
			references t_course,
	note varchar,
	dts_rec_cre timestamp default CURRENT_TIMESTAMP,
	user_rec_cre varchar,
	dts_rec_upd timestamp default CURRENT_TIMESTAMP,
	user_rec_upd varchar,
	delkbn varchar default 0,
	level varchar,
	staffid varchar
		constraint t_work_t_user_username_fk
			references t_user (username)
)
;

alter table t_work owner to yoochenil
;

