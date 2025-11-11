# 📌 Épica 4: Seguridad y autenticación

## 📝 Descripción
Se desarrolla el **Auth Service** utilizando **Spring Security y JWT**, integrado al **API Gateway**, para garantizar un sistema seguro de autenticación y autorización.  
Se implementan **roles diferenciados** para clientes, empleados y administradores, asegurando que los usuarios solo puedan acceder a las funcionalidades correspondientes a su rol y protegiendo los endpoints críticos del sistema.

---

## Sprint 11

- **HU-211:** Como desarrollador backend, **quiero implementar el Auth Service con Spring Security y JWT**, para manejar la autenticación de usuarios de forma segura y escalable.  
- **HU-212:** Como administrador, **quiero asignar roles (cliente, empleado, administrador)**, para controlar los permisos y accesos dentro del sistema.  
- **HU-213:** Como arquitecto, **quiero proteger los endpoints de productos y pedidos**, usando Spring Security, para que solo los roles autorizados puedan gestionarlos.  

---

## Sprint 12

- **HU-214:** Como cliente, **quiero mantener mi sesión activa en el frontend después de iniciar sesión**, para no tener que autenticarme en cada acción.  
- **HU-215:** Como empleado, **quiero acceder a un panel en el frontend**, para gestionar productos, pedidos y mesas según mis permisos.  
- **HU-216:** Como QA, **quiero validar flujos completos de login, roles y acceso a vistas**, para garantizar la seguridad y correcto funcionamiento del sistema.
- **HU-217:** Como usuario, quiero acceder a una vista donde pueda visualizar y editar mi información personal, para mantener mis datos actualizados dentro del sistema y garantizar que mi perfil refleje información correcta.

## Ajustes durante el spring
- **CHU-201:** Como usuario del sistema, quiero disponer de endpoints que devuelvan el número de registros de cada tabla, para visualizar estadísticas generales en el dashboard y obtener una visión rápida del estado de la base de datos.
