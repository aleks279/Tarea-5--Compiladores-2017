PROGRAM Raiz (INPUT, OUTPUT);
(* Obtener la raíz cuadrada de un número real x cualquiera.*)
VAR
Valor, Resultado: REAL;
BEGIN
WriteLn ('** Calcular la raíz cuadrada **');
Write ('Introduzca el valor: '); ReadLn (Valor);
(* Raíz cuadrada del valor absoluto de x para evitar raíces imaginarias *)
Resultado := sqrt (abs (Valor));
IF Valor > 0 THEN (* Si es positivo, existe el resultado en los reales *)
WriteLn ('La raíz cuadrada de ', Valor, ' es ',Resultado)
ELSE (* Si es negativo, el resultado es imaginario *)
WriteLn ('No existe la raíz cuadrada de ',Valor,' en los reales.');
Write ('Pulse [Intro] para finalizar...');
END.