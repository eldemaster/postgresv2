
CREATE TABLE valori (

    id bigint,
    val varchar NOT NULL
);

CREATE TABLE cars (

    id SMALLINT PRIMARY KEY,
    logo VARCHAR NOT NULL,
    model VARCHAR NOT NULL,
    release_year SMALLINT,
    horse_power SMALLINT,
    torque SMALLINT
);
