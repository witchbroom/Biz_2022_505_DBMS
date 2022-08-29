SELECT * FROM teacher;

INSERT INTO academy (
    aca_code,
    aca_name,
    aca_subject,
    aca_addr,
    aca_info,
    aca_img,
    aca_region,
    aca_age,
    aca_teacher
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3,
    :v4,
    :v5,
    :v6,
    :v7,
    :v8
);

DELETE FROM academy;
