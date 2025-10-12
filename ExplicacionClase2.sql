-- 10/12/2025 
-- Procesos Almacenados / Funciones

-- 1 - Que nos calcule la Edad ingresando la fecha de nacimiento

CREATE OR ALTER FUNCTION EDAD (@FEC_NACIMIENTO DATETIME)
RETURNS INT
AS 
BEGIN
	RETURN DATEDIFF (YY, @FEC_NACIMIENTO, GETDATE())
END;

SELECT dbo.EDAD('12/10/1986') as EDAD

-- 2 - INVERTIR EL ORDEN DE LAS LETRAS DE UNA PALABRA

CREATE OR ALTER FUNCTION INVERTIR_PALABRA(@N VARCHAR(20))
RETURNS VARCHAR(19)
AS 
	BEGIN 
		DECLARE @SIZE int, @Dig char(1), @Invertido varchar(19), @i int
		set @SIZE = Len(Ltrim(rtrim(@N)))
		set @Invertido = ''
		set @Dig = ''
		set @i = 1
			while (@i <= @SIZE)
				begin 
				SET @Dig = SUBSTRING(@N, @i, @i +1)
				SET @Invertido = @Dig + LTRIM(RTRIM(@Invertido))
				set @i = @i + 1
			END
		return @Invertido
	END;

SELECT dbo.Invertir_Palabra('World') as Palabra_Inv

-- 3 - Funcion con IF Anidados

CREATE OR ALTER FUNCTION dbo.Calificaciones(@nota Decimal(5,2))
Returns Varchar(2)
as
	Begin
		Declare @Resultado Varchar(2)

		If @nota >= 90
			Set @Resultado = 'A'
		Else if @Nota >= 80
			Set @Resultado = 'B'
		Else if @nota >= 70
			Set @Resultado = 'C'
		Else if @nota >= 60
			Set @Resultado = 'D'
		Else if @nota >= 50
			Set @Resultado = 'F'
		Return @Resultado
	END;

Select dbo.Calificaciones(75) as Nota