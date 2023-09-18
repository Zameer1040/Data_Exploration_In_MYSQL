create database system_information;
use system_information;
create table Performance(
Time  datetime Null,
cpu_usage numeric(5,2) Null,
memory_usage numeric(5,2) Null,
cpu_interupts numeric(18,0) Null,
cpu_calls numeric(18,0) Null,
memory_used numeric(18,0) Null,
memory_free numeric(18,0) Null,
bytes_sent numeric(18,0) Null,
bytes_recieved numeric(18,0) Null,
disc_usage numeric(5,2));

select * from Performance;