
--Creamos una nueva Base de datos
Create DataBase PizzeriaOficial

--Usamos la Base de datos creada
Use PizzeriaOficial 

--Creamos la tablla registro de clientes
Create table cliente (
Codigo_cliente int Primary key Not null IDENTITY (1,1),
nombre varchar(50) Not null,
apellidos varchar(50) Not null,
dni varchar(8) Not null,
direccion varchar(50) Not null,
telefono varchar(9) Not null,
email varchar(100) Not null )

--Creamos la tabla registro de ventas
Create table ventas (
Codigo_ventas int Primary key Not null IDENTITY (1,1),
Codigo_cliente int NOT NULL,
Codigo_empleado int NOT NULL,
fecha_venta date Not null)

--Creamos la tabla detalle de venta
Create table detalle_venta(
Codigo_detalle_venta int Primary key Not null IDENTITY (1,1),
Codigo_venta int NOT NULL,
Codigo_producto int NOT NULL,
cantidad decimal(18,3) Not null,
precio_unitario decimal(18,3)Not null )




--Creamos la tabla registro de producto
Create table producto(
Codigo_producto int Primary key Not null IDENTITY (1,1),
Codigo_tipo_pizza int NOT NULL,
imagen image )

--Creamos la tabla tipo de pizza
Create table tipo_pizza (
Codigo_tipo_pizza int Primary key Not null IDENTITY (1,1),
descripcion varchar(255) Not null,
precio decimal(18,3) Not null)

--Creamos la tablla registro de empleados
Create Table empleado (
Codigo_empleado int Primary key Not null IDENTITY (1,1),
nombres varchar(50) Not null,
apellidos varchar(50) Not null,
sexo varchar(1) Not null,
fecha_nacimiento date Not null,
direccion varchar(100) Not null,
telefono varchar(9) Not null,
email varchar(100) Not null,
usuario varchar(50) Not null,
contraseña varchar(50) Not null,
cargo_desempeña varchar(1) Not null,
acceso varchar(1) Not null)




--Creamos la tabla registro de una compra
Create Table compra(
Codigo_compra int Primary key Not null IDENTITY (1,1),
Codigo_empleado int NOT NULL,
Codigo_proveedor int NOT NULL,
fecha_compra date Not null)

--Creamos la tabla detalle de compra
Create table detalle_compra (
Codigo_detalle_compra int Primary key Not null IDENTITY (1,1),
Codigo_compra int NOT NULL,
Codigo_insumo int NOT NULL,
cantidad decimal(18,3) Not null,
precio_unitario decimal(18,3) Not null)

--Creamos la tabla registro de insumos
Create Table insumos (
Codigo_insumo int Primary key Not null IDENTITY (1,1),
nombre varchar(50) Not null,
fecha_vencimiento date,
unidades_disponibles decimal(18,3) Not null,
descripcion varchar(255) Not null)

Create Table proveedor(
Codigo_proveedor int Primary key Not null IDENTITY (1,1),
Ruc varchar(8) Not null,
razon_social varchar(50) Not null,
email varchar(100)Not null,
pagina_empresa varchar(255) Not null,
direccion varchar(100) Not null,
postalcode varchar(7) Not null,
pais varchar(50) Not null,
ciudad varchar(50) Not null)
---------------------------------------------------------------------------------------------------------------

-----FOREIGN KEY DE VENTAS 
Alter table ventas
add constraint FK_CodigoCliente FOREIGN KEY (Codigo_cliente) REFERENCES cliente(Codigo_cliente) ON DELETE CASCADE
ALTER TABLE ventas
add CONSTRAINT FK_CodigoEmpleado FOREIGN KEY (Codigo_empleado) references empleado(Codigo_empleado)

---FOREIGN KEY DE DETALLE_VENTA
Alter table detalle_venta
ADD CONSTRAINT FK_CodigoVenta FOREIGN KEY (Codigo_venta) REFERENCES ventas(Codigo_ventas) ON DELETE CASCADE
ALTER TABLE detalle_venta
ADD CONSTRAINT Fk_CodigoProducto FOREIGN KEY (Codigo_producto) REFERENCES producto(Codigo_producto)

---FOREIGN KEY_PRODUCTO
ALTER TABLE producto 
ADD CONSTRAINT FK_CodigoTipo FOREIGN KEY (Codigo_tipo_pizza) REFERENCES tipo_pizza(Codigo_tipo_pizza) ON DELETE CASCADE

----FOREIGN KEY COMPRA
ALTER TABLE compra 
ADD CONSTRAINT FK_CodigoEmpleado2 FOREIGN KEY (Codigo_empleado) REFERENCES empleado(Codigo_empleado)
ALTER TABLE compra
ADD CONSTRAINT FK_CodigoProveedor FOREIGN KEY (Codigo_proveedor) REFERENCES proveedor(Codigo_proveedor)

----FOREIGN KEY DETALLE_COMPRA
ALTER TABLE detalle_compra 
ADD CONSTRAINT  FK_CodigoCompra FOREIGN KEY (Codigo_compra) REFERENCES compra(Codigo_compra) ON DELETE CASCADE
ALTER TABLE detalle_compra 
ADD CONSTRAINT FK_CodigoInsumo  FOREIGN KEY (Codigo_insumo) REFERENCES insumos(Codigo_insumo)

-----Modificar el tamaño de una columna
Alter table empleado
Alter column cargo_desempeña varchar(20)

Alter table empleado
Alter column acceso varchar(20)

