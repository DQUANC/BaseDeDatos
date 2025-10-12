/* Ejercicio: Crear una tabla de estudiantes donde guarde la fecha de nacimiento y la informacion necesaria e incluir un procedimiento que calcule
la clasificacion de su edad.
	- 0-17: Ninho
	- 18-20: Joven
	- 21-59: Adulto
	- +60 Adulto mayor
*/

Create table Estudiantes(
Id_Estudiande int identity primary key not null,
Nombre varchar(50),
Apellido varchar(50),
Fecha_Nacimiento date
)

insert into Estudiantes (Nombre, Apellido, Fecha_Nacimiento) Values
('Andres', 'Hernandez', '10/08/2000'),
('Peter', 'Parker', '08/21/2020'),
('Steven', 'Strange', '7/15/1980'),
('Max', 'Verstappen', '12/07/1960')

select * from Estudiantes
drop table Estudiantes


Create or alter function ClasificacionEdad(@FechaNac datetime)
returns varchar(50)
as
	begin
		declare @Edad int 
		set @Edad = DATEDIFF (YY, @FechaNac, GetDate())
		declare @clasificacion varchar(50)
		If @Edad >= 60
			set @clasificacion = 'Adulto Mayor'
		else if @Edad > 21
			set @clasificacion = 'Adulto'
		else if @Edad > 18
			set @clasificacion = 'Joven'
		else if @Edad > 0
			set @clasificacion = 'Ninho'
		return @clasificacion
	End;

Select dbo.ClasificacionEdad('12/10/2019')

Select
Nombre,
Apellido,
Fecha_Nacimiento,
DATEDIFF (yy, Fecha_Nacimiento, getdate()) as Edad,
dbo.ClasificacionEdad(Fecha_Nacimiento) as Clasificacion
from Estudiantes