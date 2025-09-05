# Sistema de Restaurante – Proyecto Final

Repositorio base de documentación para el **sistema de gestión de pedidos de un restaurante de comidas rápidas**.  
Este repositorio centraliza la visión    general del sistema, su arquitectura distribuida, la organización de la documentación y los enlaces a los repositorios de código.

> **Importante:** Este repositorio **no contiene implementación**, solo documentación, diagramas y referencias para guiar el desarrollo.

---

## Objetivo del Proyecto
Desarrollar un sistema que permita gestionar de manera eficiente la operación de un restaurante de comidas rápidas, incluyendo:

- Registro y autenticación de usuarios con distintos roles (Administrador, Empleado, Cliente).  
- Gestión del **catálogo de productos** del restaurante.  
- Creación y seguimiento de **pedidos** realizados por clientes.  
- Notificaciones automáticas a los clientes cuando su pedido esté listo.  
- Administración de mesas y control de pedidos en curso.  

El sistema busca ofrecer:

- Experiencia de usuario fluida para clientes y empleados.  
- Control completo de la operación del restaurante para el administrador.  
- Visualización en tiempo real del estado de los pedidos.  
- Alertas y notificaciones automáticas para mejorar la eficiencia.

---

## Arquitectura Distribuida
El sistema seguirá un **modelo basado en microservicios**, permitiendo:

- Escalabilidad y modularidad.  
- Mantenimiento sencillo y actualización independiente de cada módulo.  
- Comunicación eficiente entre servicios mediante API REST y notificaciones.  

> Los diagramas de arquitectura se encuentran en la carpeta `docs/diagrams/`.

---

## Metodología de Trabajo
El proyecto se desarrolla bajo **Scrum**, organizado en **épicas** y **sprints semanales**:

- Cada sprint dura **una semana**, permitiendo entregas incrementales.  
- Las épicas definen los **objetivos principales** del proyecto.  
- Las historias de usuario (HU) dividen las épicas en funcionalidades manejables.  
- Cada HU se documenta en este repositorio y se gestiona en **Jira**, asegurando trazabilidad.  <

### Convención de Historias de Usuario (HU-#)
- HU-001 en adelante: funcionalidades del sistema para el primer sprint  
- HU-101 en adelante: funcionalidades avanzadas o ajustes  

Cada HU incluirá:

- ID  
- Descripción  
- Criterios de aceptación  
- Enlace a su issue en Jira  

---

## Funcionalidades Principales
1. **Gestión de Usuarios y Roles**  
   - Registro y autenticación de clientes, empleados y administradores.  
   - Asignación de roles con permisos específicos.  

2. **Gestión de Productos y Catálogo**  
   - Visualización y búsqueda de productos del menú.  
   - Filtrado por categoría y precios.  

3. **Gestión de Pedidos**  
   - Creación y seguimiento de pedidos por clientes.  
   - Actualización del estado del pedido por empleados.  

4. **Notificaciones**  
   - Envío automático de notificaciones a clientes cuando su pedido está listo.  
   - Alertas internas para empleados sobre pedidos pendientes.  

5. **Administración de Mesas**  
   - Control del estado de las mesas (libre, ocupada, en limpieza).  
   - Asignación de pedidos a mesas específicas.  

6. **Generacion de reportes de ventas**  
   - Realizar reportes de vendas.  

---

## Gestión del Backlog
El seguimiento de épicas e historias de usuario se realiza en **Jira** mediante un **tablero Scrum**:

- Organización de épicas e historias de usuario.  
- Seguimiento de sprints semanales.  
- Visualización del estado: Pendiente, En progreso, Terminado.  
- Priorización de tareas según necesidades del restaurante. 

## Jira
Espacio de Jira donde estarán las épicas y los sprints: [Enlace al tablero de Jira](https://solitariodevs.atlassian.net/jira/software/projects/RSO/boards/67/backlog?epics=visible&issueParent=10133%2C10140&atlOrigin=eyJpIjoiYjBhYTY2MTRmOWRiNDdlNTk3ZTdkMTAzMmU4MjMwMjMiLCJwIjoiaiJ9)

---

## Repositorios Relacionados
| Microservicio          | Repositorio                        | Estado       | Descripción                                           |
|------------------------|-----------------------------------|-------------|------------------------------------------------------|
| Eureka Server          | [enlace](#)                       | Pendiente    | Registro y descubrimiento de microservicios         |
| API Gateway            | [enlace](#)                       | Pendiente    | Enrutamiento centralizado y políticas de seguridad  |
| Auth Service           | [enlace](#)                       | Pendiente    | Autenticación y autorización con JWT/OAuth2         |
| Product Service        | [enlace](#)                       | En proceso   | Gestión del catálogo de productos                   |
| Order Service          | [enlace](#)                       | En proceso   | Creación, seguimiento y actualización de pedidos   |
| Notification Service   | [enlace](#)                       | Pendiente    | Envío de alertas y notificaciones a clientes       |
| Table Service          | [enlace](#)                       | Pendiente    | Gestión de mesas y estado de ocupación              |
| Frontend Web           | [enlace](#)                       | Pendiente    | Interfaz gráfica del sistema                        |

---

## Participantes
| Nombre                    | Rol en Scrum      | Usuario GitHub                                                                 |
|---------------------------|-----------------|-------------------------------------------------------------------------------|
| Victor Andres             | Scrum Master     | [VictorAndres123](https://github.com/VictorAndres123)                         |
| Johan Esteban Ramirez     | Product Owner    | [EstebanRamirezGutierrez](https://github.com/EstebanRamirezGutierrez)         |
| Juan Jose Urbano Perdomo  | Development Team | [JuanJoseUrbano](https://github.com/JuanJoseUrbano)                           |
