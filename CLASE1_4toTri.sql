-- ## Stored Procedures (Procesos Almacenados)
-- 1 ------------- Funcioncion de HolaMundo
 
CREATE or ALTER FUNCTION dbo.SaludoHolaMundo()
RETURNS NVARCHAR(50)
AS
BEGIN 
	RETURN 'Hola Mundo'
END;

-- Ejecutamos 

SELECT dbo.SaludoHolaMundo() as Mensaje;

-- 2 ------------- Convertidor de datos celsius a Fahrenheit

CREATE OR ALTER FUNCTION dbo.CelsiusFahrenheit(@Celsius FLOAT)
RETURNS FLOAT
AS 
BEGIN	
	RETURN (@Celsius * 9.0/5.0) + 32
END; 

-- Ejecutamos 

SELECT dbo.CelsiusFahrenheit(25.5) as Convertidor

-- 3 ------------- Analizar y realizar una funcion que sume dos numeros

CREATE OR ALTER FUNCTION dbo.SumaDosNumeros(@N_1 FLOAT, @N_2 FLOAT)
RETURNS FLOAT
AS 
BEGIN 
	RETURN (@N_1 + @N_2)
END;

-- Ejecutamos

SELECT dbo.SumaDosNumeros(10, 11) AS SUMA

-- 4 ------------- Funcion que concatene el nombre y apellido en mayusculas

CREATE OR ALTER FUNCTION dbo.NombreApellidoEnMayusculas(@Nombre VARCHAR(50), @APELLIDO VARCHAR(50))
RETURNS VARCHAR(100)
AS 
BEGIN 
	RETURN(UPPER((@NOMBRE) + ' ' + (@APELLIDO)))
END;

-- Ejecutamos 

SELECT dbo.NombreApellidoEnMayusculas('Peter', 'Parker');

-- 5 ------------- Hacer un programa que ingrese el numero de la semana (1-7) y retorne en letras a que dia pertenece

CREATE OR ALTER FUNCTION dbo.DiaDeLaSemana(@Dia INT)
RETURNS VARCHAR(50)
BEGIN
	DECLARE @VAR VARCHAR(10)
	SELECT @VAR = CASE @Dia
						WHEN 1 THEN 'Domingo'
						WHEN 2 THEN 'Lunes'
						WHEN 3 THEN 'Martes'
						WHEN 4 THEN 'Miercoles'
						WHEN 5 THEN 'Jueves'
						WHEN 6 THEN 'Viernes'
						WHEN 7 THEN 'Sabado'
					END
	RETURN @VAR
END;

-- Ejectuar
	-- Nota: Ambas son formas validas para mostrar resultado (Dependiendo del objetivo)

SELECT dbo.DiaDeLaSemana(6) as DIA_DE_LA_SEMANA;
PRINT dbo.DiaDeLaSemana(6);

-- Ejercicio: 1 ------------- Hacer una funcion que permita ingresar un valor del 1 al 12 
--	  			              para imprimir el valor del mes del año al que corresponde

CREATE OR ALTER FUNCTION dbo.MesDelAnho(@Mes INT)
RETURNS VARCHAR(50)
BEGIN
	DECLARE @VAR VARCHAR(10)
	SELECT @VAR = CASE @Mes
		WHEN 1 THEN 'Enero'
		WHEN 2 THEN 'Febrero'
		WHEN 3 THEN 'Marzo'
		WHEN 4 THEN 'Abril'
		WHEN 5 THEN 'Mayo'
		WHEN 6 THEN 'Junio'
		WHEN 7 THEN 'Julio'
		WHEN 8 THEN 'Agosto'
		WHEN 9 THEN 'Septiembre'
		WHEN 10 THEN 'Octubre'
		WHEN 11 THEN 'Noviembre'
		WHEN 12 THEN 'Diciembre'
	END
	RETURN @VAR
END;

-- Ejecutamos

SELECT dbo.MesDelAnho(6) as MES_DEL_ANHO;
PRINT dbo.MesDelAnho(8);