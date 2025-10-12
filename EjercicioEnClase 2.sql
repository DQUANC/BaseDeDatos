Create Table Sucursal(
ID_Sucursal INT primary key not null,
Nombre Varchar(100),
Ingresos Decimal(10,2),
Gastos Decimal(10,2)
)

Insert into Sucursal (ID_Sucursal, Nombre, Ingresos, Gastos)
Values (1, 'Sucursal Norte', 100000, 40000),
(2, 'Sucursal Sur', 800000, 500000),
(3, 'Sucursal Este', 300000, 20000),
(4, 'Sucursal Oeste', 600000, 50000)

select * from Sucursal

/*
Supon que tienes una tabla con los ingresos y gastos de diferentes sucursales y quieres una funcion que devuelva
un veredicto textual sobre su rendimiento:
	-Excelente si la ganancia es mayor al 50% de los ingresos.
	-Aceptable si esta entre el 20% y 50% 
	-Justo si es mayor a 0% y menor al 20%
	-Perdida si es menor o igual a 0
*/

Create or alter Function dbo.RendimientoSucursal(@ingresos Decimal(10,2), @gastos Decimal(10,2))
returns varchar(20)
as 
begin
	declare @ganancia decimal(10,2)
	declare @porcentaje decimal(5,2)
	declare @resultado varchar(20)

	set @ganancia = @ingresos - @gastos

	if @ingresos = 0
	 set @resultado = 'Sin ingresos'
	else 
		begin
			set @porcentaje = (@ganancia/@ingresos)*100
				if(@porcentaje > 50)
					set @resultado = 'Excelente'
				else if (@porcentaje > 20)
					set @resultado = 'Aceptable'
				else if (@porcentaje >= 0)
					set @resultado = 'Perdida'
		END
		return @resultado
End;

Select 
ID_Sucursal,
Nombre,
Ingresos,
Gastos,
Ingresos - Gastos as Ganancias,
dbo.RendimientoSucursal(Ingresos, Gastos) as Rendimiento
from Sucursal;

