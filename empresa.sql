/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     24-11-2025 0:05:43                           */
/*==============================================================*/


drop table if exists Departamento;

drop table if exists DetalleProyecto;

drop table if exists Empleado;

drop table if exists Proyecto;

drop table if exists RegistroTiempo;

drop table if exists Rol;

drop table if exists Usuario;

/*==============================================================*/
/* Table: Departamento                                          */
/*==============================================================*/
create table Departamento
(
   departamento_id      int not null,
   nombre               varchar(254),
   ubicacion            varchar(254),
   primary key (departamento_id)
);

/*==============================================================*/
/* Table: DetalleProyecto                                       */
/*==============================================================*/
create table DetalleProyecto
(
   detalle_proyecto_id  int not null,
   empleado_id          varchar(254) not null,
   proyecto_id          int not null,
   fecha_asignacion     datetime,
   rol_en_proyecto      varchar(254),
   horas_asignadas      int,
   primary key (detalle_proyecto_id)
);

/*==============================================================*/
/* Table: Empleado                                              */
/*==============================================================*/
create table Empleado
(
   empleado_id          varchar(254) not null,
   usuario_id           int,
   departamento_id      int not null,
   rol_id               int not null,
   Usu_usuario_id       int,
   nombre               varchar(254),
   apellido             varchar(254),
   direccion            varchar(254),
   telefono             varchar(254),
   email                varchar(254),
   primary key (empleado_id)
);

/*==============================================================*/
/* Table: Proyecto                                              */
/*==============================================================*/
create table Proyecto
(
   proyecto_id          int not null,
   nombre_proyecto      varchar(254),
   fecha_inicio         datetime,
   fecha_termino        datetime,
   descripcion          varchar(254),
   estado               varchar(254),
   primary key (proyecto_id)
);

/*==============================================================*/
/* Table: RegistroTiempo                                        */
/*==============================================================*/
create table RegistroTiempo
(
   registro_id          int not null,
   empleado_id          varchar(254) not null,
   proyecto_id          int not null,
   fecha                datetime,
   horas_trabajo        float,
   descripcion          varchar(254),
   primary key (registro_id)
);

/*==============================================================*/
/* Table: Rol                                                   */
/*==============================================================*/
create table Rol
(
   rol_id               int not null,
   nombre               varchar(254),
   descripcion          varchar(254),
   primary key (rol_id)
);

/*==============================================================*/
/* Table: Usuario                                               */
/*==============================================================*/
create table Usuario
(
   usuario_id           int not null,
   empleado_id          varchar(254) not null,
   Emp_empleado_id      varchar(254) not null,
   nombre_usuario       varchar(254),
   hash_password        varchar(254),
   fecha_ultimo_acceso  datetime,
   primary key (usuario_id)
);

alter table DetalleProyecto add constraint FK_Association_14 foreign key (proyecto_id)
      references Proyecto (proyecto_id) on delete restrict on update restrict;

alter table DetalleProyecto add constraint FK_Association_15 foreign key (empleado_id)
      references Empleado (empleado_id) on delete restrict on update restrict;

alter table Empleado add constraint FK_Association_1 foreign key (usuario_id)
      references Usuario (usuario_id) on delete restrict on update restrict;

alter table Empleado add constraint FK_Association_10 foreign key (rol_id)
      references Rol (rol_id) on delete restrict on update restrict;

alter table Empleado add constraint FK_Association_11 foreign key (Usu_usuario_id)
      references Usuario (usuario_id) on delete restrict on update restrict;

alter table Empleado add constraint FK_Association_7 foreign key (departamento_id)
      references Departamento (departamento_id) on delete restrict on update restrict;

alter table RegistroTiempo add constraint FK_Association_8 foreign key (empleado_id)
      references Empleado (empleado_id) on delete restrict on update restrict;

alter table RegistroTiempo add constraint FK_Association_9 foreign key (proyecto_id)
      references Proyecto (proyecto_id) on delete restrict on update restrict;

alter table Usuario add constraint FK_Association_1 foreign key (empleado_id)
      references Empleado (empleado_id) on delete restrict on update restrict;

alter table Usuario add constraint FK_Association_11 foreign key (Emp_empleado_id)
      references Empleado (empleado_id) on delete restrict on update restrict;

