/* ------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION epoch2timestamp(a_epoch INTEGER DEFAULT 0) RETURNS TIMESTAMP IMMUTABLE LANGUAGE 'sql' AS
$_$
  -- a_epoch: количество секунд
SELECT CASE
  WHEN $1 = 0 THEN NULL
  ELSE (TIMESTAMP 'epoch' + $1 * INTERVAL '1 second')::timestamp
END;
$_$;
SELECT poma.comment('f', 'epoch2timestamp', 'Преобразование секунд к типу TIMESTAMP');

