PROGRAM MultiplosDe3 (INPUT, OUTPUT);
VAR
Numero, Cnt: INTEGER;
BEGIN
Cnt := 0;
Write ('Entra el primer número de la serie: '); ReadLn (Numero);
WHILE Numero <> 0 DO
BEGIN
IF (Numero MOD 3) = 0 THEN
INC (Cnt);
Write ('Dame otro numero (0 para terminar): '); ReadLn (Numero);
END;
WriteLn ('La cantidad de múltiplos de 3 ingresados es ', Cnt);
Write ('Pulse [Intro] para finalizar...');
END.