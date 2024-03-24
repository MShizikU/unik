CREATE TABLE msg_queue(
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    payload jsonb NOT NULL,
    pid integer DEFAULT NULL
);

CREATE TABLE msg_log(
	id bigint,
	pid integer
);